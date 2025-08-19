CLASS zcl_ff901_01_vn DEFINITION
  PUBLIC
     INHERITING FROM cl_abap_parallel
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: gts_zf901t TYPE STANDARD TABLE OF zf901t_vn.
    TYPES: gts_zf901d TYPE STANDARD TABLE OF zf901t_vn.

    METHODS post_fi
      IMPORTING
        is_input  TYPE gts_zf901t
      EXPORTING
        es_output TYPE gts_zf901t.

    METHODS do REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FF901_01_VN IMPLEMENTATION.


  METHOD do.

    TYPES: BEGIN OF lts_data_post,
             company_code             TYPE bukrs,
             fiscal_year_base         TYPE gjahr,
             accounting_document_base TYPE belnr_d,
             allocated_line_item      TYPE numc5,
             data_post                TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post,
           END OF lts_data_post.

    DATA:
      ldt_zf901t     TYPE STANDARD TABLE OF zf901t_vn,
      ldf_flag_error TYPE c LENGTH 1,
      ldf_msg        TYPE string,
      ldt_data_post  TYPE STANDARD TABLE OF lts_data_post,
      ldt_je_deep    TYPE TABLE FOR FUNCTION IMPORT i_journalentrytp~validate,
      ldf_test       TYPE char1.

    FIELD-SYMBOLS: <lds_zf901t> TYPE zf901t_vn.

    " Get parameter from buffer
    IMPORT param_input = ldt_zf901t FROM DATA BUFFER p_in.
**********************************************************************
    "simulation
    LOOP AT ldt_zf901t ASSIGNING <lds_zf901t>.

      TRY.
          DATA(lv_cid)  = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
        CATCH cx_uuid_error.
          ASSERT 1 = 0.
      ENDTRY.

*      CLEAR: ldt_je_deep.
      APPEND INITIAL LINE TO ldt_je_deep ASSIGNING FIELD-SYMBOL(<je_deep>).
      <je_deep>-%cid   = lv_cid.
      <je_deep>-%param = VALUE #(
          companycode                  = <lds_zf901t>-company_code
          documentreferenceid          = 'BKPFF'
          createdbyuser                = sy-uname
          businesstransactiontype      = 'RFBU'
          accountingdocumenttype       = 'SA'
          documentdate                 = <lds_zf901t>-posting_date
          postingdate                  = <lds_zf901t>-posting_date
          accountingdocumentheadertext = 'RAP rules'
          taxdeterminationdate         = sy-datum
          taxreportingdate             = sy-datum

          _glitems                     = VALUE #(
                               ( glaccountlineitem = |001|
                                 glaccount         = <lds_zf901t>-glaccount_h
                                 taxcode           = 'V0'
                                 costcenter        = '0015101101'
                                 taxcountry        = 'JP'
                                 _currencyamount   = VALUE #( ( currencyrole           = '00'
                                                                journalentryitemamount = <lds_zf901t>-amounting_transaction_currency
                                                                currency               = <lds_zf901t>-company_code_currency ) ) )
                               ( glaccountlineitem = |002|
                                 glaccount         = <lds_zf901t>-glaccount_s
                                 documentitemtext  = 'Test'
                                 _currencyamount   = VALUE #( ( currencyrole           = '00'
                                                                journalentryitemamount = <lds_zf901t>-amounting_transaction_currency * -1
                                                                currency               = <lds_zf901t>-company_code_currency ) ) ) )
          _taxitems                    = VALUE #(
                               ( glaccountlineitem = '003'
                                 taxcode           = 'V0'
                                 conditiontype     = 'MWVR'
                                 _currencyamount   = VALUE #(
                                                              ( currencyrole           = '00'
                                                                currency               = <lds_zf901t>-company_code_currency
                                                                journalentryitemamount = '0'
                                                                taxbaseamount          = <lds_zf901t>-amounting_transaction_currency ) ) ) ) ).

      APPEND INITIAL LINE TO ldt_data_post ASSIGNING FIELD-SYMBOL(<lds_data_post>).
      <lds_data_post>-company_code = <lds_zf901t>-company_code.
      <lds_data_post>-accounting_document_base = <lds_zf901t>-accounting_document_base.
      <lds_data_post>-fiscal_year_base = <lds_zf901t>-fiscal_year_base.
      <lds_data_post>-allocated_line_item = <lds_zf901t>-allocated_line_item.
      MOVE-CORRESPONDING ldt_je_deep TO <lds_data_post>-data_post.

    ENDLOOP.

    " GL Posting Validation --------------------------
    READ ENTITIES OF i_journalentrytp
         ENTITY journalentry
         EXECUTE validate FROM ldt_je_deep
         RESULT FINAL(ldt_check_result)
         FAILED FINAL(ldt_failed_deep)
         REPORTED FINAL(ldt_reported_deep).

    IF ldt_failed_deep IS NOT INITIAL.
      LOOP AT ldt_reported_deep-journalentry ASSIGNING FIELD-SYMBOL(<lds_reported_deep>).
        <lds_zf901t>-log_message = <lds_reported_deep>-%msg->if_message~get_text( ).
        <lds_zf901t>-log_status = '2'.
        ldf_flag_error = abap_true.
      ENDLOOP.
    ENDIF.
**********************************************************************
    "post
    IF ldf_flag_error = abap_false.

      LOOP AT ldt_data_post INTO DATA(lds_data_post).

        READ TABLE ldt_zf901t ASSIGNING <lds_zf901t>
          WITH KEY company_code = lds_data_post-company_code
                   accounting_document_base = lds_data_post-accounting_document_base
                   fiscal_year_base = lds_data_post-fiscal_year_base
                   allocated_line_item = lds_data_post-allocated_line_item.
        IF sy-subrc = 0.
          MODIFY ENTITIES OF i_journalentrytp
          ENTITY journalentry
          EXECUTE post FROM lds_data_post-data_post
          FAILED DATA(ldt_failed_post)
          REPORTED DATA(ldt_reported_post)
          MAPPED DATA(ldt_mapped_post).

          IF ldt_failed_deep IS NOT INITIAL.

            " message error
            CLEAR: ldf_msg.
            LOOP AT ldt_reported_post-journalentry ASSIGNING FIELD-SYMBOL(<lds_reported_post>).
              IF ldf_msg IS INITIAL.
                ldf_msg = <lds_reported_post>-%msg->if_message~get_text( ).
              ELSE.
                ldf_msg = |{ ldf_msg },{ <lds_reported_post>-%msg->if_message~get_text( ) }|.
              ENDIF.
            ENDLOOP.

            <lds_zf901t>-log_message = ldf_msg.
            <lds_zf901t>-log_status = '2'.
          ELSE.
            " commit data
            COMMIT ENTITIES IN SIMULATION MODE
                   RESPONSE OF i_journalentrytp
                   FAILED FINAL(ldt_commit_failed)
                   REPORTED FINAL(ldt_commit_reported).
            " success
            <lds_zf901t>-accounting_document = ldt_commit_reported-journalentry[ 1 ]-accountingdocument.
            <lds_zf901t>-log_status = '1'.
            <lds_zf901t>-fiscal_year = <lds_zf901t>-posting_date+0(4).
          ENDIF.
        ENDIF.

      ENDLOOP.
    ENDIF.
**********************************************************************
    " Export data result to buffer
    EXPORT param_output = ldt_zf901t TO DATA BUFFER p_out.
  ENDMETHOD.


  METHOD post_fi.
    DATA ldf_xinput  TYPE LINE OF cl_abap_parallel=>t_in_tab.
    DATA ldt_xinput  TYPE cl_abap_parallel=>t_in_tab.
    DATA ldt_xoutput TYPE cl_abap_parallel=>t_out_tab.
    DATA lds_xoutput TYPE LINE OF cl_abap_parallel=>t_out_tab.

    EXPORT param_input = is_input TO DATA BUFFER ldf_xinput.
    APPEND ldf_xinput TO ldt_xinput.

    " Execute parallel -> execute method do
    run( EXPORTING p_in_tab  = ldt_xinput
         IMPORTING p_out_tab = ldt_xoutput ).
    " Setting data result
    IF ldt_xoutput IS NOT INITIAL.
      lds_xoutput = ldt_xoutput[ 1 ].
      TRY.
          IMPORT param_output = es_output FROM DATA BUFFER lds_xoutput-result.
        CATCH cx_root INTO FINAL(lo_error). " TODO: variable is assigned but never used (ABAP cleaner)
      ENDTRY.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
