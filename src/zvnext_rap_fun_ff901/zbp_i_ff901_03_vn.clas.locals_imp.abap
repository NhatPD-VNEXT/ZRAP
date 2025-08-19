CLASS lhc__header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _header RESULT result.

    METHODS allocate FOR MODIFY
      IMPORTING keys FOR ACTION _header~allocate.

    METHODS post FOR MODIFY
      IMPORTING keys FOR ACTION _header~post.

ENDCLASS.

CLASS lhc__header IMPLEMENTATION.

  METHOD get_instance_features.
    ASSIGN keys[ 1 ] TO FIELD-SYMBOL(<ls_key>).

    SELECT SINGLE *
      FROM zf901t_vn
      WHERE accounting_document_base = @<ls_key>-accountingdocument
        AND company_code            = @<ls_key>-companycode
        AND fiscal_year_base        = @<ls_key>-fiscalyear
      INTO @DATA(ls_zf901t).

    APPEND VALUE #(
      %tky             = <ls_key>-%tky
      %action-post     = COND #( WHEN ls_zf901t IS NOT INITIAL AND
                                      ls_zf901t-allocated_line_item IS NOT INITIAL AND
                                      ls_zf901t-accounting_document IS INITIAL
                                 THEN if_abap_behv=>fc-o-enabled
                                 ELSE if_abap_behv=>fc-o-disabled )
      %action-allocate = COND #( WHEN ls_zf901t-accounting_document IS NOT INITIAL AND
                                      ls_zf901t IS NOT INITIAL

                                 THEN if_abap_behv=>fc-o-disabled
                                 ELSE if_abap_behv=>fc-o-enabled )
    ) TO result.
  ENDMETHOD.

  METHOD get_instance_authorizations.
    " Implementation to be added
  ENDMETHOD.

  METHOD allocate.

    SET LOCKS ENTITY zi_ff901_03_vn
       FROM VALUE #( ( accountingdocument = keys[ 1 ]-accountingdocument )
                     ( companycode =  keys[ 1 ]-companycode )
                     ( fiscalyear =  keys[ 1 ]-fiscalyear )
                     ( ledgergllineitem =  keys[ 1 ]-ledgergllineitem ) )
        FAILED   DATA(lt_failed1)
        REPORTED DATA(lt_reported1).


    " Read entities selected from list page
    READ ENTITIES OF zi_ff901_03_vn IN LOCAL MODE
      ENTITY _header
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_header)
      FAILED DATA(lt_failed)
      REPORTED DATA(lt_reported).

    IF lt_failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    ASSIGN lt_header[ 1 ] TO FIELD-SYMBOL(<ls_header>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    READ TABLE keys INTO DATA(ls_key) WITH KEY %key = <ls_header>-%key.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    " Delete existing detail records
    SELECT *
      FROM zf901t_vn
      WHERE company_code            = @<ls_header>-companycode
        AND fiscal_year_base        = @<ls_header>-fiscalyear
        AND accounting_document_base = @<ls_header>-accountingdocument
      INTO TABLE @DATA(lt_zf901t_vn).


    "modidy entity zi_ff901_03_vn
    IF lt_zf901t_vn IS NOT INITIAL.
      MODIFY ENTITIES OF zi_ff901_02_vn
        ENTITY _detail
        DELETE FROM VALUE #(
          FOR ls_zf901t IN lt_zf901t_vn (
          accountingdocumentbase = ls_zf901t-accounting_document_base
          allocatedlineitem      = ls_zf901t-allocated_line_item
          companycode            = ls_zf901t-company_code
          fiscalyearbase         = ls_zf901t-fiscal_year_base
          )
      )
        FAILED DATA(lt_failed_del).
    ENDIF.

    " Allocate new detail records
    DATA:
      lv_amount_per_period   TYPE dmbtr,
      lv_allocated_amount    TYPE dmbtr,
      lv_allocated_line_item TYPE numc5,
      lv_total_allocated     TYPE dmbtr,
      lv_posting_date        TYPE budat,
      lv_month               TYPE monat.

    " Calculate amount per period
    lv_amount_per_period = <ls_header>-amountincompanycodecurrency / ls_key-%param-allocatedmonths.

    " Create detail records for each period
    DO ls_key-%param-allocatedmonths TIMES.
      " For the last period, use the remaining amount to avoid rounding issues
      IF sy-index = ls_key-%param-allocatedmonths.
        lv_allocated_amount = <ls_header>-amountincompanycodecurrency - lv_total_allocated.
      ELSE.
        lv_allocated_amount = lv_amount_per_period.
      ENDIF.

      lv_total_allocated = lv_total_allocated + lv_allocated_amount.
      lv_month = sy-index.
      lv_posting_date = |{ <ls_header>-fiscalyear }{ lv_month }01|.
      lv_allocated_line_item += 10.

      MODIFY ENTITIES OF zi_ff901_02_vn
        ENTITY _detail
        CREATE
        FIELDS (
          companycode
          fiscalyearbase
          accountingdocumentbase
          allocatedlineitem
          postingdate
          glaccounts
          glaccountnames
          glaccounth
          glaccountnameh
          amountingtransactioncurrency
          companycodecurrency
          headertext
          allocatemonths
        )
        WITH VALUE #( (
                      %cid                         = |CREATE_{ sy-index }|
                      companycode                  = <ls_header>-companycode
                      fiscalyearbase               = <ls_header>-fiscalyear
                      accountingdocumentbase       = <ls_header>-accountingdocument
                      allocatedlineitem            = lv_allocated_line_item
                      postingdate                  = ls_key-%param-postingdate
                      glaccounts                   = <ls_header>-glaccount
                      glaccountnames               = <ls_header>-glaccountname
                      glaccounth                   = <ls_header>-offsettingaccount
                      glaccountnameh               = <ls_header>-offsettingaccountname
                      amountingtransactioncurrency = lv_allocated_amount
                      companycodecurrency          = <ls_header>-companycodecurrency
                      headertext                   = <ls_header>-accountingdocumentheadertext
                      allocatemonths               = ls_key-%param-allocatedmonths
                      ) )
        FAILED DATA(ls_failed_create)
        REPORTED DATA(ls_reported_create)
        MAPPED DATA(ls_mapped_create).
    ENDDO.
  ENDMETHOD.

  METHOD post.

    " Implementation to be added
    READ ENTITIES OF zi_ff901_03_vn IN LOCAL MODE
      ENTITY _header
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_header)
      FAILED DATA(lt_failed)
      REPORTED DATA(lt_reported).

    IF lt_failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    " Get the first header record
    DATA(ls_header) = lt_header[ 1 ].
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    "******************************************************************
    "* Get allocation records from ZF901T
    "******************************************************************
    SELECT *
      FROM zf901t_vn
      WHERE company_code            = @ls_header-companycode
        AND fiscal_year_base        = @ls_header-fiscalyear
        AND accounting_document_base = @ls_header-accountingdocument
      INTO TABLE @DATA(ldt_zf901t).

    IF sy-subrc = 0.
      FINAL(lo_process_parallel) = NEW zcl_ff901_01_vn( ).
      lo_process_parallel->post_fi(
        EXPORTING
          is_input  = ldt_zf901t
        IMPORTING
          es_output = DATA(ldt_output)
      ).
    ENDIF.

**********************************************************************
    "update data base
    MODIFY ENTITIES OF zi_ff901_02_vn
           ENTITY _detail
           UPDATE
           FIELDS ( logmessage logstatus accountingdocument fiscalyear )
           WITH VALUE #( FOR lds_zf901t IN ldt_output
                         ( companycode            = lds_zf901t-company_code
                           fiscalyearbase         = lds_zf901t-fiscal_year_base
                           accountingdocumentbase = lds_zf901t-accounting_document_base
                           allocatedlineitem      = lds_zf901t-allocated_line_item
                           accountingdocument     = lds_zf901t-accounting_document
                           fiscalyear             = lds_zf901t-fiscal_year
                           logmessage             = lds_zf901t-log_message
                           logstatus              = lds_zf901t-log_status
                         ) )
           FAILED FINAL(ldt_failed_d)
           REPORTED FINAL(ldt_reported_d)
           MAPPED FINAL(ldt_mapped_d).
  ENDMETHOD.

ENDCLASS.
