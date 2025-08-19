CLASS zcl_test_cds_view_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_total

        FOR TABLE FUNCTION zi_test_cds_view_03.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_CDS_VIEW_03 IMPLEMENTATION.


  METHOD get_total BY DATABASE FUNCTION
                   FOR HDB
                   LANGUAGE SQLSCRIPT
                   OPTIONS READ-ONLY
                   USING I_MaterialDocumentItem_2
                         I_MaterialDocumentHeader_2
                         I_MaterialStock_2
                         I_ProductValuationBasic
                         I_Product
                         I_Producttext.

    declare lv_clnt "$ABAP.type( MANDT )" := session_context('CLIENT');
    declare lv_year nvarchar(4);
    declare lv_month nvarchar(2);
    declare lv_start_date, lv_end_date date;
    declare lv_start_month, lv_year_offset integer;
    declare lv_date_str nvarchar(8);
    declare lv_stock_start_date date;

    -- Lấy năm và tháng từ p_pdate
    lv_year := substring(:p_pdate, 1, 4);
    lv_month := substring(:p_pdate, 5, 2);

    -- Tính start_month = 7 + (month - 6)
    lv_start_month := cast(lv_month as integer);
    lv_start_month := :lv_start_month - 6 + 7;
    lv_year_offset := 0;

    -- xử lý trường hợp tháng > 12
    WHILE :lv_start_month > 12 DO
      lv_start_month := :lv_start_month - 12;
      lv_year_offset := :lv_year_offset + 1;
    END while;

    -- Tính start_date và end_date cho gi/gr
    lv_start_date := add_years(to_date(:p_pdate), -1);
    IF :lv_year_offset > 0 THEN
      lv_start_date := add_years(:lv_start_date, :lv_year_offset);
    END if;

    -- Tạo string date với FORMAT yyyymmdd
    lv_date_str := concat(
                     concat(
                       substring(to_varchar(:lv_start_date), 1, 4),
                       lpad(cast(:lv_start_month as varchar(2)), 2, '0')
                     ),
                     '01'
                   );

    -- CONVERT string to date
    lv_start_date := to_date(:lv_date_str);

    -- Tính ngày kết thúc (cuối tháng của p_pdate)
    lv_end_date := last_day(to_date(:p_pdate));

    -- Tính ngày bắt đầu cho stock (ngày đầu tháng của p_pdate)
    lv_stock_start_date := to_date(concat(substring(:p_pdate, 1, 6), '01'));

    -- Tính gi/gr và Stock
    lt_gi_gr =
      SELECT
        :lv_clnt AS clnt,
        item.Companycode as companycode,
        item.Material as material,
        sum(case
          when header.AccountingDocumentType in ('WA', 'WL')
          then item.QuantityInBaseUnit
          else 0
        end) as totalgiqty,
        sum(case
          WHEN header.AccountingDocumentType in ('WE', 'WI', 'WN')
          then item.QuantityInBaseUnit
          else 0
        end) as totalgrqty
      FROM I_MaterialDocumentItem_2 as item
        INNER JOIN I_MaterialDocumentHeader_2 as header
          ON  header.MaterialDocumentYear = item.MaterialDocumentYear
          and header.MaterialDocument = item.MaterialDocument
          and header.mandt = item.mandt
      where item.mandt = :lv_clnt
        AND item.PostingDate >= :lv_start_date
        AND item.PostingDate <= :lv_end_date
        and header.AccountingDocumentType in ('WA', 'WL', 'WE', 'WI', 'WN')
      group by
        item.Companycode,
        item.Material;

    lt_stock =
      select
        :lv_clnt as clnt,
        CompanyCode as companycode,
        Material as material,
        sum(MatlWrhsStkQtyInMatlBaseUnit) as totalstockqty
      from I_MaterialStock_2
      where mandt = :lv_clnt
        and InventoryStockType = '01'
*        and MatlDocLatestPostgDate >= :lv_stock_start_date
        and MatlDocLatestPostgDate <= :p_pdate
      group by CompanyCode, Material;

    lt_valuation =
      select
        :lv_clnt as clnt,
        CompanyCode as companycode,
        Product as Product,
        ValuationClass as valuationclass,
        StandardPrice as StandardPrice,
        Currency as Currency,
        BaseUnit as BaseUnit
      from I_ProductValuationBasic
      where mandt = :lv_clnt
      group by CompanyCode,
               Product,
               ValuationClass,
               StandardPrice,
               Currency,
               BaseUnit;

    -- Kết hợp kết quả
    lt_result =
      select
        t1.clnt,
        t1.companycode,
        t1.material,
        t1.totalgiqty,
        t1.totalgrqty,
        coalesce(t2.totalstockqty, 0) as totalstockqty,

*remain_stock
        CASE
            when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
              then 0
            else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
        end as remain_stock,

*estimated_stock
        case
         when t1.totalgiqty = 0 OR t1.totalgiqty is null
           then 84
         when coalesce(t2.totalstockqty, 0) > CASE
                                                  when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                    then 0
                                                  else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                              end

           then cast(                         case
                                                  when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                    then 0
                                                  else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                              end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
         else
           cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
        end as estimated_stock,

*estimated_stock_3660
        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 36
            then 0
            --
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  >= 36

                     and

                 CASE
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 60
            --
            then case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 36

            else 24
        end as estimated_stock_3660,

*estimated_stock_6084
        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 60
            then 0
            --
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  >= 60

                     and

                 CASE
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 84
            --
            then case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 60

            else 24
        end as estimated_stock_6084,

*estimated_stock_84
        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 84
            then 0
            --
            else

                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 83

        end as estimated_stock_84,

*reversed_amount1
      case
        when (
          cast(
            (
              -- count_3660 * totalgiqty / 12 * unit_price * 0.2
              CAST(

                        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 0
            then 0
            --
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  >= 36

                     and

                 CASE
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 60
            --
            then case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 36

            else 24
            end * t1.totalgiqty / 12.0 * t4.StandardPrice * 0.2
              as decimal)

              +

            --unit_price * totalgiqty / 12 * estimated_stock_6084 * 0.4
            CAST ( t4.StandardPrice * t1.totalgiqty / 12.0 *
                        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 60
            then 0
            --
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  >= 60

                     and

                 CASE
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 84
            --
            then case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 60

                else 24
            end * 0.4
                as decimal)

            +


              -- unit_price * totalgiqty / 12 * count_84  * 0.8
              CAST(
                t4.StandardPrice * t1.totalgiqty / 12.0 *

                        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 84
            then 0
            --
            else

                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 83

            end * 0.8
              as decimal)
            )
          as decimal) > coalesce(t2.totalstockqty, 0) )
        THEN 0

        ELSE
          cast(
            (
              -- count_3660 * totalgiqty / 12 * 0.2
              CAST(

                        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 0
            then 0
            --
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  >= 36

                     and

                 CASE
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 60
            --
            then case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 36

            else 24
            end * t1.totalgiqty / 12.0 * t4.StandardPrice * 0.2
              as decimal)


              +

               +

            --unit_price * totalgiqty / 12 * estimated_stock_6084 * 0.4
            CAST ( t4.StandardPrice * t1.totalgiqty / 12.0 *
                        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 60
            then 0
            --
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  >= 60

                     and

                 CASE
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 84
            --
            then case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 60

                else 24
            end * 0.4
                as decimal)


                +


              --unit_price * totalgiqty / 12 * count_6084 * 0.8
              CAST( t4.StandardPrice * t1.totalgiqty / 12.0 *
                        case
            when
                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end  < 84
            then 0
            --
            else

                case
                     when t1.totalgiqty = 0 OR t1.totalgiqty is null
                       then 84
                     when coalesce(t2.totalstockqty, 0) > CASE
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end

                       then cast(                         case
                                                              when coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                                                                then 0
                                                              else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                                                          end as decimal ) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     else
                       cast(coalesce(t2.totalstockqty, 0) as decimal) / nullif(cast(t1.totalgiqty as decimal), 0) * 12
                     end - 83

            end * 0.8
              as decimal)
            )
          as decimal)

      END as reversed_amount1,

*reversed_amount2
      CASE
        WHEN totalgiqty = 0
            then CASE
                    WHEN coalesce(t2.totalstockqty, 0) - t1.totalgiqty < 0
                      then 0
                    else coalesce(t2.totalstockqty, 0) - t1.totalgiqty
                 end * t4.StandardPrice * 0.8
        ELSE
            0
      end as reversed_amount2,

*status
      CASE
        WHEN t3.CreationDate < add_days(:p_pdate, 1)
            then '対象'
        ELSE
            ''
      END as status,

*totalstockamount
      t2.totalstockqty * t4.StandardPrice as totalstockamount,

*StandardPrice
      t4.StandardPrice as unitprice,

      t4.ValuationClass as valuationclass,

      t3.productgroup as materialgroup,

      t4.BaseUnit as baseunit,

      t4.Currency as currency,

      t3.CreationDate as creationdate,

      t5.productname as productname

      from :lt_gi_gr as t1
      left outer join :lt_stock as t2
        on t1.material = t2.material
        and t1.clnt = t2.clnt
        and t1.companycode = t2.companycode
      left outer join I_Product as t3
        on t1.material = t3.product
      left outer join :lt_valuation as t4
        on t4.companycode = t1.companycode
       and t4.Product = t1.material
      left outer join I_Producttext as t5
        on t5.product = t1.material
       and t5.language = 'J';

    RETURN :lt_result;

  ENDMETHOD.
ENDCLASS.
