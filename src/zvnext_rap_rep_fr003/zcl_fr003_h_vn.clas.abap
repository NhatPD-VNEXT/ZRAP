CLASS zcl_fr003_h_vn DEFINITION
  PUBLIC
   INHERITING FROM cl_abap_parallel
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS post_fi
      IMPORTING
        is_input  TYPE zfr003_d_vn
      EXPORTING
        es_output TYPE zfr003_d_vn.

    METHODS reverse_fi
      IMPORTING
        is_input  TYPE zfr003_d_vn
      EXPORTING
        es_output TYPE zfr003_d_vn.

    METHODS do REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FR003_H_VN IMPLEMENTATION.


  METHOD do.
    DATA lds_zfr003_d     TYPE zfr003_d_vn.
    DATA ldt_journal_item TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post.
    DATA ldf_msg          TYPE string.

    " Get parameter from buffer
    IMPORT param_input = lds_zfr003_d FROM DATA BUFFER p_in.
    CLEAR lds_zfr003_d-TaxCode.

    TRY.
        FINAL(lv_cid) = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
      CATCH cx_uuid_error.
    ENDTRY.

    ldt_journal_item = VALUE #(
        ( %cid   = lv_cid
          %param = VALUE #(
              companycode                  = lds_zfr003_d-CompanyCode  " 会社コード
              documentreferenceid          = 'BKPFF'                   " 参照伝票番号
              createdbyuser                = cl_abap_context_info=>get_user_technical_name( ) " ユーザ名
              businesstransactiontype      = 'RFBU'    " 取引
              accountingdocumenttype       = 'SA'      " 伝票タイプ
              documentdate                 = cl_abap_context_info=>get_system_date( )  " 伝票の伝票日付
              postingdate                  = lds_zfr003_d-PostingDate                  " 伝票の転記日付
              taxdeterminationdate         = lds_zfr003_d-PostingDate                  " 税率定義の日付
              taxreportingdate             = lds_zfr003_d-PostingDate                  " 税レポート日付
              accountingdocumentheadertext = 'Allocate annual costs'                   " 伝票ヘッダテキスト
              _glitems                     = VALUE #(
                  ( glaccountlineitem = |001|                            " 6 文字の総勘定元帳明細
                    glaccount         = lds_zfr003_d-OffsettingAccount   " 総勘定元帳勘定
                    taxcode           = lds_zfr003_d-TaxCode             " 消費税コード
                    costcenter        = lds_zfr003_d-CostCenter          " 原価センタ
                    taxcountry        = 'JP'                             " 税申告国/地域
                    _currencyamount   = VALUE #( ( CurrencyRole           = '00'                                              " 通貨タイプおよび評価ビュー
                                                   JournalEntryItemAmount = lds_zfr003_d-AmountInTransactionCurrency          " 伝票通貨額
                                                   Currency               = lds_zfr003_d-CompanyCodeCurrency ) ) )            " 通貨コード
                  ( glaccountlineitem = |002|                             " 6 文字の総勘定元帳明細
                    glaccount         = lds_zfr003_d-GLAccount           " 総勘定元帳勘定
                    documentitemtext  = 'Test'                            " 明細テキスト
                    _currencyamount   = VALUE #(
                        ( CurrencyRole           = '00'                                              " 通貨タイプおよび評価ビュー
                          JournalEntryItemAmount = lds_zfr003_d-AmountInTransactionCurrency * -1     " 伝票通貨額
                          Currency               = lds_zfr003_d-CompanyCodeCurrency ) ) ) )          " 通貨コード
              _taxitems                    = VALUE #(
                  ( glaccountlineitem = '003'                    " 6 文字の総勘定元帳明細
                    taxcode           = lds_zfr003_d-TaxCode     " 消費税コード
                    conditiontype     = 'MWVR'                   " 条件タイプ
                    _currencyamount   = VALUE #( ( CurrencyRole           = '00'                                       " 通貨タイプおよび評価ビュー
                                                   Currency               = lds_zfr003_d-CompanyCodeCurrency           " 通貨コード
                                                   JournalEntryItemAmount = '0'                                        " 伝票通貨額
                                                   TaxBaseAmount          = lds_zfr003_d-AmountInTransactionCurrency ) ) ) ) ) ) ). " 課税基準額 (伝票通貨建て)

    MODIFY ENTITIES OF i_journalentrytp
           ENTITY journalentry
           EXECUTE post FROM ldt_journal_item
           FAILED FINAL(ldt_failed_deep)
           REPORTED FINAL(ldt_reported_deep)
           " TODO: variable is assigned but never used (ABAP cleaner)
           MAPPED FINAL(ldt_mapped_deep).

    IF ldt_failed_deep IS NOT INITIAL.

      " message error
      LOOP AT ldt_reported_deep-JournalEntry ASSIGNING FIELD-SYMBOL(<lds_reported_deep>).
        IF ldf_msg IS INITIAL.
          ldf_msg = <lds_reported_deep>-%msg->if_message~get_text( ).
        ELSE.
          ldf_msg = |{ ldf_msg },{ <lds_reported_deep>-%msg->if_message~get_text( ) }|.
        ENDIF.
      ENDLOOP.

      lds_zfr003_d-Message = ldf_msg.
    ELSE.
*      ROLLBACK ENTITIES.
      " commit data
      COMMIT ENTITIES
             RESPONSE OF i_journalentrytp
             " TODO: variable is assigned but never used (ABAP cleaner)
             FAILED FINAL(ldt_commit_failed)
             REPORTED FINAL(ldt_commit_reported).
      " success
      lds_zfr003_d-AccountingDocument = ldt_commit_reported-JournalEntry[ 1 ]-AccountingDocument.
    ENDIF.

    ROLLBACK ENTITIES.

    " Export data result to buffer
    EXPORT param_output = lds_zfr003_d TO DATA BUFFER p_out.
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


  METHOD reverse_fi.
  ENDMETHOD.
ENDCLASS.
