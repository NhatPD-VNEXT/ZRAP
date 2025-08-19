CLASS lhc__data DEFINITION INHERITING FROM cl_abap_behavior_handler.
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

CLASS lhc__data IMPLEMENTATION.
  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD allocate.
    "Read entities selected from list page
    READ ENTITIES OF zi_fr901_03_vn IN LOCAL MODE
        ENTITY _header
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_header)
        FAILED DATA(ldt_failed)
        REPORTED DATA(ldt_reported).

    IF ldt_failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_header ASSIGNING FIELD-SYMBOL(<lds_header>) INDEX 1.
    READ TABLE keys INTO DATA(lds_key) WITH KEY %key = <lds_header>-%key.
    CHECK sy-subrc = 0.
**********************************************************************
    "delete data detail
    SELECT *
    FROM zf901t_d_vn
    WHERE company_code = @<lds_header>-companycode
      AND fiscal_year = @<lds_header>-fiscalyear
      AND accounting_document_base = @<lds_header>-accountingdocument
      INTO TABLE @DATA(ldt_zf901t_d_vn).

    LOOP AT ldt_zf901t_d_vn INTO DATA(lds_zf901t_d_vn).
      MODIFY ENTITIES OF zi_fr901_02_vn
          ENTITY _detail
          DELETE FROM VALUE #( ( keyuuid = lds_zf901t_d_vn-key_uuid ) )
          FAILED DATA(ldt_failed_del).
    ENDLOOP.
**********************************************************************
    "allocate data detail
    DATA:
      ldf_amount          TYPE dmbtr,
      ldf_amount_allocate TYPE dmbtr,
      ldf_amount_sum      TYPE dmbtr,
      ldf_budat           TYPE budat,
      ldf_monat           TYPE monat.

    ldf_amount = <lds_header>-amountincompanycodecurrency / lds_key-%param-allocatedmonths.
    DO lds_key-%param-allocatedmonths TIMES.

      IF sy-index = lds_key-%param-allocatedmonths.
        ldf_amount_allocate = <lds_header>-amountincompanycodecurrency - ldf_amount_sum.
      ELSE.
        ldf_amount_allocate = ldf_amount.
      ENDIF.

      ldf_amount_sum = ldf_amount_sum + ldf_amount_allocate.
      ldf_monat = sy-index.
      ldf_budat = |{ <lds_header>-fiscalyear }{ ldf_monat }01|.

      MODIFY ENTITIES OF zi_fr901_02_vn
          ENTITY _detail
          CREATE
          FIELDS (
              companycode
              fiscalyearbase
              accountingdocumentbase
              fiscalyear
              accountingdocument
              postingdate
              glaccounts
              glaccountnames
              glaccounth
              glaccountnameh
              amountingtransactioncurrency
              companycodecurrency
              headertext
              costcenter
              taxcode
          )
          WITH VALUE #( (
                        %cid                         = |CREATE_{ sy-index }|
                        companycode                  = <lds_header>-companycode
                        fiscalyearbase               = <lds_header>-fiscalyear
                        fiscalyear                   = <lds_header>-fiscalyear
                        accountingdocumentbase       = <lds_header>-accountingdocument
                        postingdate                  = lds_key-%param-Postingdate
                        glaccounts                   = <lds_header>-glaccount
                        glaccountnames               = <lds_header>-glaccountname
                        glaccounth                   = <lds_header>-offsettingaccount
                        glaccountnameh               = <lds_header>-offsettingaccountname
                        amountingtransactioncurrency = ldf_amount_allocate
                        companycodecurrency          = <lds_header>-companycodecurrency
                        headertext                   = <lds_header>-accountingdocumentheadertext
                        costcenter                   = <lds_header>-costcenter
                        taxcode                      = <lds_header>-taxcode

                        ) )
          FAILED DATA(lds_failed_d_crt)
          REPORTED DATA(lds_reported_d_crt)
          MAPPED DATA(lds_mapped_d_crt).
    ENDDO.
  ENDMETHOD.

  METHOD post.
  ENDMETHOD.

ENDCLASS.
