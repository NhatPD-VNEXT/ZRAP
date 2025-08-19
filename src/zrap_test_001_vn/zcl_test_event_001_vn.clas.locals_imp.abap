*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhe_test DEFINITION INHERITING FROM cl_abap_behavior_event_handler.
  PRIVATE SECTION.

" Method for event after created SO
    METHODS on_so_created FOR ENTITY EVENT
       created FOR salesorder~created.
"Method for event after changed SO
    METHODS on_so_changed FOR ENTITY EVENT
       changed FOR salesorder~changed.

    METHODS get_requesteddeliverydate
      IMPORTING
        pvf_saleorder             TYPE i_salesorder-salesorder
        pvf_salesorderitem        TYPE i_salesorderitem-salesorderitem
      CHANGING
        prf_requesteddeliverydate TYPE i_salesorder-requesteddeliverydate.

ENDCLASS.


CLASS lhe_test IMPLEMENTATION.

  METHOD on_so_changed.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.

  METHOD on_so_created.

    TYPES: BEGIN OF gts_so,
             salesorder            TYPE i_salesorder-salesorder,
             salesorderitem        TYPE i_salesorderitem-salesorderitem,
             requesteddeliverydate TYPE i_salesorderscheduleline-requesteddeliverydate,
           END OF gts_so.
    DATA: ldt_so TYPE TABLE OF gts_so.

    CHECK sy-uname = 'CB9980000188'.
    LOOP AT created  INTO DATA(ls_so_c).

      SELECT  salesorder,
      salesorderitem
      FROM i_salesorderitem WITH PRIVILEGED ACCESS
      WHERE salesorder = @ls_so_c-salesorder
      INTO TABLE @ldt_so .

      LOOP AT ldt_so INTO DATA(lds_so).

        " call method thực hiện tính toán ngày requested delivery date
        CALL METHOD get_requesteddeliverydate
          EXPORTING
            pvf_saleorder             = lds_so-salesorder
            pvf_salesorderitem        = lds_so-salesorderitem
          CHANGING
            prf_requesteddeliverydate = lds_so-requesteddeliverydate.

        " Sau khi thực hiện tính toán lại requesteddeliverydate, thực hiện thay đổi requesteddeliverydate
        MODIFY ENTITIES OF i_salesordertp
        ENTITY salesorderscheduleline
          UPDATE
              FIELDS ( requesteddeliverydate
                      )
            WITH VALUE #(  (
                           requesteddeliverydate   = lds_so-requesteddeliverydate
                           %key-salesorder             = lds_so-salesorder
                           %key-salesorderitem         = lds_so-salesorderitem
                           %key-scheduleline           = '0001' ) )
        REPORTED DATA(ls_reported1)
        FAILED   DATA(ls_failed1).

        " Thực hiện thay đổi giá trị custom field yy1_deliverydate_proc_sdi
        MODIFY ENTITIES OF i_salesordertp
          ENTITY salesorderitem
            UPDATE
              FIELDS ( yy1_deliverydate_proc_sdi )
              WITH VALUE #( ( yy1_deliverydate_proc_sdi  = lds_so-requesteddeliverydate
                              %key-salesorder            = lds_so-salesorder
                              %key-salesorderitem        = lds_so-salesorderitem ) )
          FAILED   DATA(ls_failed)
          REPORTED DATA(ls_reported).

      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.


  METHOD get_requesteddeliverydate.
    DATA: ldf_transduration      TYPE i_route-transitdurationincalendardays,
          ldf_trsleadtime        TYPE i_route-transpleadtimeincaldays,
          ldf_trsleadhr          TYPE i_route-transpleadtimeinhrsmin,
          ldf_transduration_days TYPE p DECIMALS 2,
          ldf_trsleadtime_days   TYPE p DECIMALS 2,
          ldf_sub_days           TYPE p DECIMALS 2,
          ldf_transport          TYPE p DECIMALS 2.

    "Case: Item totalreplenishmentleadtime in material master
    " Get time リードタイム日数/Lead time in days
    SELECT SINGLE product,      "製品番号
                  plant,        "プラント
                  route,        "輸送経路/Transport route　
                  creationdate,  "受注登録日/Ngày đăng ký SO
                  orderquantity
    FROM  i_salesorderitem  WITH PRIVILEGED ACCESS
    WHERE salesorder = @pvf_saleorder
    AND   salesorderitem = @pvf_salesorderitem
    INTO (  @DATA(ldf_product),
            @DATA(ldf_plant),
            @DATA(ldf_route),
            @DATA(ldf_creationdate),
            @DATA(ldf_orderquantity)
          ).

    "Select từ Schedule line
    SELECT SINGLE productavailabilitydate,
                  confdorderqtybymatlavailcheck
    FROM  i_salesorderscheduleline  WITH PRIVILEGED ACCESS
    WHERE salesorder = @pvf_saleorder
    AND salesorderitem = @pvf_salesorderitem
    INTO (  @DATA(ldf_productavailabilitydate),
            @DATA(ldf_confdorderqtybymatlavail)
          ).


    " Get time リードタイム日数/Lead time in days
    SELECT SINGLE totalreplenishmentleadtime
    FROM  i_productsupplyplanning  WITH PRIVILEGED ACCESS
    WHERE product = @ldf_product   "製品番号
    AND   plant   = @ldf_plant     "プラント
    INTO @DATA(ldf_leadtime_material).

    " Select and caculate 輸送経路/Transport route　　
    SELECT transitdurationincalendardays,   "LE-TRA 期間
           transpleadtimeincaldays          "LE-TRA 期間
    FROM i_route WITH PRIVILEGED ACCESS
    WHERE route = @ldf_route
    INTO (@ldf_transduration, @ldf_trsleadtime).
    ENDSELECT.

    " Convert transport route data to days
    ldf_transduration_days = ldf_transduration DIV 240000.
    ldf_trsleadtime_days   = ldf_trsleadtime   DIV 240000.

    " Caculate total date is added to delivery date
    ldf_transport  = ldf_trsleadtime_days
                     + ldf_transduration_days
                     + ldf_leadtime_material .
    ldf_sub_days = ldf_productavailabilitydate - ldf_creationdate.

    " Kiểm tra điều kiện số 2
    IF ( ldf_sub_days >= ldf_transport )
    OR (  ldf_orderquantity = ldf_confdorderqtybymatlavail ).  " điều kiện số 1
      RETURN.
    ENDIF.
    " Change Delivery Date
    prf_requesteddeliverydate = ldf_creationdate + ldf_transport.

  ENDMETHOD.

ENDCLASS.
