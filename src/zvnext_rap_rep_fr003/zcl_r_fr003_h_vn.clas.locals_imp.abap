CLASS lhc_zr_fr003_h_vn DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _header RESULT result.

    METHODS allocate FOR MODIFY
      IMPORTING keys FOR ACTION _header~allocate.

    METHODS post FOR MODIFY
      IMPORTING keys FOR ACTION _header~post.
    METHODS reverse FOR MODIFY
      IMPORTING keys FOR ACTION _header~reverse.

ENDCLASS.


CLASS lhc_zr_fr003_h_vn IMPLEMENTATION.
  METHOD get_instance_features.
    " Read entities selected from list page
    READ ENTITIES OF zr_fr003_h_vn IN LOCAL MODE
         ENTITY _header
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_header)
         FAILED failed
         REPORTED reported.

    IF failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    ASSIGN ldt_header[ 1 ] TO FIELD-SYMBOL(<lds_header>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    READ TABLE keys INTO FINAL(lds_key)
         WITH KEY %key = <lds_header>-%key.
    IF sy-subrc = 0.
      APPEND VALUE #( %tky             = lds_key-%tky
                      %action-post     = COND #( WHEN ( requested_features-%action-Allocate = if_abap_behv=>mk-on AND  <lds_header>-status  = '' )
                                                   OR <lds_header>-status  = '1'
                                                 THEN if_abap_behv=>fc-o-enabled
                                                 ELSE if_abap_behv=>fc-o-disabled )
                      %action-reverse  = COND #( WHEN <lds_header>-status  = '1'
                                                   OR <lds_header>-status IS INITIAL
                                                 THEN if_abap_behv=>fc-o-disabled
                                                 ELSE if_abap_behv=>fc-o-enabled )
                      %action-allocate = COND #( WHEN <lds_header>-status <> '2'
                                                 THEN if_abap_behv=>fc-o-enabled
                                                 ELSE if_abap_behv=>fc-o-disabled ) )
             TO result.
    ENDIF.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD allocate.
    DATA lds_header          TYPE zr_fr003_h_vn.
    " ---------------------------------------------------------------------
    " allocate data detail
    DATA ldf_amount          TYPE dmbtr.
    DATA ldf_amount_allocate TYPE dmbtr.
    DATA ldf_amount_sum      TYPE dmbtr.
    DATA ldf_monat           TYPE monat.
    DATA ldf_budat           TYPE budat.

    " ---------------------------------------------------------------------
    " Read entities selected from list page
    READ ENTITIES OF zr_fr003_h_vn IN LOCAL MODE
         ENTITY _header
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(ldt_header)
         FAILED failed
         REPORTED reported.

    IF failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    ASSIGN ldt_header[ 1 ] TO FIELD-SYMBOL(<lds_header>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    " status in process
    <lds_header>-status = '1'.  " status allocate

    SELECT SINGLE TaxCode,
                  CostCenter
      FROM I_JournalEntryItem
      WHERE CompanyCode        = @<lds_header>-CompanyCode
        AND FiscalYear         = @<lds_header>-FiscalYear
        AND AccountingDocument = @<lds_header>-AccountingDocument
        AND GLAccount          = @<lds_header>-OffsettingAccount
        AND Ledger             = '0L'
      INTO ( @<lds_header>-TaxCode, @<lds_header>-CostCenter ).

    MOVE-CORRESPONDING <lds_header> TO lds_header.

    READ TABLE keys INTO FINAL(lds_key)
         WITH KEY %key = <lds_header>-%key.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    " ---------------------------------------------------------------------
    SELECT * FROM zfr003_d_vn
      WHERE CompanyCode            = @lds_header-CompanyCode
        AND FiscalYear             = @lds_header-FiscalYear
        AND RootAccountingDocument = @lds_header-AccountingDocument
      INTO TABLE @FINAL(ldt_zfr003_d).

    LOOP AT ldt_zfr003_d INTO FINAL(lds_zfr003_d).
      MODIFY ENTITIES OF zr_fr003_d_vn
             ENTITY _detail
             DELETE FROM VALUE #( ( keyuuid = lds_zfr003_d-key_uuid ) )
             " TODO: variable is assigned but never used (ABAP cleaner)
             FAILED FINAL(ldt_failed_del).
    ENDLOOP.

    ldf_amount = lds_header-AmountInTransactionCurrency / lds_key-%param-allocatedmonths.

    DO lds_key-%param-allocatedmonths TIMES.

      IF sy-index = lds_key-%param-allocatedmonths.
        ldf_amount_allocate = lds_header-AmountInTransactionCurrency - ldf_amount_sum.
      ELSE.
        ldf_amount_allocate = ldf_amount.
      ENDIF.

      ldf_amount_sum += ldf_amount_allocate.
      ldf_monat = sy-index.
      ldf_budat = |{ lds_header-FiscalYear }{ ldf_monat }01|.

      MODIFY ENTITIES OF zr_fr003_d_vn
             ENTITY _detail
             CREATE
             FIELDS (
                 companycode
                 fiscalyear
                 postingdate
                 rootaccountingdocument
                 glaccount
                 offsettingaccount
                 companycodecurrency
                 amountintransactioncurrency
                 taxcode
                 costcenter )
             WITH VALUE #( ( %cid                        = |CREATE_{ sy-index }|
                             CompanyCode                 = lds_header-CompanyCode
                             FiscalYear                  = lds_header-FiscalYear
                             PostingDate                 = ldf_budat
                             RootAccountingDocument      = lds_header-AccountingDocument
                             GLAccount                   = lds_header-GLAccount
                             OffsettingAccount           = lds_header-OffsettingAccount
                             CompanyCodeCurrency         = lds_header-CompanyCodeCurrency
                             AmountInTransactionCurrency = ldf_amount_allocate
                             TaxCode                     = lds_header-TaxCode
                             CostCenter                  = lds_header-CostCenter ) )
             " TODO: variable is assigned but never used (ABAP cleaner)
             FAILED FINAL(lds_failed_d_crt)
             " TODO: variable is assigned but never used (ABAP cleaner)
             REPORTED FINAL(lds_reported_d_crt)
             " TODO: variable is assigned but never used (ABAP cleaner)
             MAPPED FINAL(lds_mapped_d_crt).
    ENDDO.
    " ---------------------------------------------------------------------
    " update header
    SELECT SINGLE * FROM zfr003_h_vn
      WHERE CompanyCode        = @lds_header-CompanyCode
        AND FiscalYear         = @lds_header-FiscalYear
        AND AccountingDocument = @lds_header-AccountingDocument
    " TODO: variable is assigned but never used (ABAP cleaner)
      INTO @FINAL(lds_zfr003_h).

    IF sy-subrc <> 0.
      MODIFY ENTITIES OF zr_fr003_data_h_vn
             ENTITY _header
             CREATE
             FIELDS (
                 companycode
                 fiscalyear
                 accountingdocument
                 glaccount
                 offsettingaccount
                 companycodecurrency
                 amountintransactioncurrency
                 taxcode
                 costcenter
                 status
                 allocatedmonths )
             WITH VALUE #( ( %cid                        = |CREATE_H|
                             companycode                 = lds_header-CompanyCode
                             fiscalyear                  = lds_header-FiscalYear
                             accountingdocument          = lds_header-AccountingDocument
                             glaccount                   = lds_header-GLAccount
                             offsettingaccount           = lds_header-OffsettingAccount
                             companycodecurrency         = lds_header-CompanyCodeCurrency
                             amountintransactioncurrency = ldf_amount_allocate
                             taxcode                     = lds_header-TaxCode
                             costcenter                  = lds_header-CostCenter
                             status                      = lds_header-Status
                             allocatedmonths             = lds_key-%param-allocatedmonths ) )
             " TODO: variable is assigned but never used (ABAP cleaner)
             FAILED FINAL(ldt_failed_h_crt)
             " TODO: variable is assigned but never used (ABAP cleaner)
             REPORTED FINAL(ldt_reported_h_crt)
             " TODO: variable is assigned but never used (ABAP cleaner)
             MAPPED FINAL(ldt_mapped_h_crt).
    ELSE.
      MODIFY ENTITIES OF zr_fr003_data_h_vn
             ENTITY _header
             UPDATE
             FIELDS (
                 allocatedmonths )
             WITH VALUE #( ( companycode        = lds_header-CompanyCode
                             fiscalyear         = lds_header-FiscalYear
                             accountingdocument = lds_header-AccountingDocument
                             allocatedmonths    = lds_key-%param-allocatedmonths ) )
             " TODO: variable is assigned but never used (ABAP cleaner)
             FAILED FINAL(ldt_failed_h_upd)
             " TODO: variable is assigned but never used (ABAP cleaner)
             REPORTED FINAL(ldt_reported_h_upd)
             " TODO: variable is assigned but never used (ABAP cleaner)
             MAPPED FINAL(ldt_mapped_h_upd).
    ENDIF.
  ENDMETHOD.

  METHOD post.
    FINAL(lo_process_parallel) = NEW zcl_fr003_h_vn( ).

    " Read entities selected from list page
    READ ENTITIES OF zr_fr003_h_vn IN LOCAL MODE
         ENTITY _header
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_header)
         FAILED failed
         REPORTED reported.

    IF failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    ASSIGN ldt_header[ 1 ] TO FIELD-SYMBOL(<lds_header>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    " ---------------------------------------------------------------------
    " get data detail
    SELECT * FROM zfr003_d_vn
      WHERE CompanyCode            = @<lds_header>-CompanyCode
        AND FiscalYear             = @<lds_header>-FiscalYear
        AND RootAccountingDocument = @<lds_header>-AccountingDocument
      INTO TABLE @DATA(ldt_zfr003_d).

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    " ---------------------------------------------------------------------
    " post FI
    LOOP AT ldt_zfr003_d ASSIGNING FIELD-SYMBOL(<lds_zfr003_d>).

      IF <lds_zfr003_d>-AccountingDocument IS NOT INITIAL.
        CONTINUE.
      ENDIF.

      lo_process_parallel->post_fi( EXPORTING is_input  = <lds_zfr003_d>
                                    IMPORTING es_output = <lds_zfr003_d> ).

      " flag check post fi
      IF <lds_zfr003_d>-AccountingDocument IS NOT INITIAL.
        DATA(ldf_flag_post) = abap_on.
      ELSE.
        CLEAR ldf_flag_post.
      ENDIF.
    ENDLOOP.
    " ---------------------------------------------------------------------
    " Update table
    MODIFY ENTITIES OF zr_fr003_d_vn
           ENTITY _detail
           UPDATE
           FIELDS ( message accountingdocument )
           WITH VALUE #( FOR lds_zfr003_d IN ldt_zfr003_d
                         ( keyuuid            = lds_zfr003_d-key_uuid
                           message            = lds_zfr003_d-message
                           accountingdocument = lds_zfr003_d-accountingdocument ) )
           " TODO: variable is assigned but never used (ABAP cleaner)
           FAILED FINAL(ldt_failed_d)
           " TODO: variable is assigned but never used (ABAP cleaner)
           REPORTED FINAL(ldt_reported_d)
           " TODO: variable is assigned but never used (ABAP cleaner)
           MAPPED FINAL(ldt_mapped_d).

    " flag check post fi
    IF ldf_flag_post <> abap_on.
      RETURN.
    ENDIF.
    MODIFY ENTITIES OF zr_fr003_h_vn
           ENTITY _header
           UPDATE
           FIELDS ( status )
           WITH VALUE #( ( %key   = <lds_header>-%key
                           status = '2' ) ) " status post
           " TODO: variable is assigned but never used (ABAP cleaner)
           FAILED FINAL(ldt_failed_h)
           " TODO: variable is assigned but never used (ABAP cleaner)
           REPORTED FINAL(ldt_reported_h)
           " TODO: variable is assigned but never used (ABAP cleaner)
           MAPPED FINAL(ldt_mapped_h).
  ENDMETHOD.

  METHOD reverse.
    DATA ldt_journal TYPE TABLE FOR ACTION IMPORT i_journalentrytp~reverse.

    " Read entities selected from list page
    READ ENTITIES OF zr_fr003_h_vn IN LOCAL MODE
         ENTITY _header
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_header)
         FAILED failed
         REPORTED reported.

    IF failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    ASSIGN ldt_header[ 1 ] TO FIELD-SYMBOL(<lds_header>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    " ---------------------------------------------------------------------
    " get data detail
    SELECT * FROM zfr003_d_vn
      WHERE CompanyCode            = @<lds_header>-CompanyCode
        AND FiscalYear             = @<lds_header>-FiscalYear
        AND RootAccountingDocument = @<lds_header>-AccountingDocument
      INTO TABLE @DATA(ldt_zfr003_d).

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    DELETE ldt_zfr003_d WHERE accountingdocument IS INITIAL.
    LOOP AT ldt_zfr003_d ASSIGNING FIELD-SYMBOL(<lds_zfr003_d>).
      APPEND INITIAL LINE TO ldt_journal ASSIGNING FIELD-SYMBOL(<lds_journal>).
      <lds_journal>-CompanyCode        = <lds_zfr003_d>-CompanyCode.
      <lds_journal>-FiscalYear         = <lds_zfr003_d>-FiscalYear.
      <lds_journal>-AccountingDocument = <lds_zfr003_d>-AccountingDocument.
      <lds_journal>-%param             = VALUE #( PostingDate    = sy-datlo
                                                  ReversalReason = '01'
                                                  CreatedByUser  = sy-uname ).

      MODIFY ENTITIES OF i_journalentrytp
             ENTITY journalentry
             EXECUTE reverse FROM ldt_journal
               " TODO: variable is assigned but only used in commented-out code (ABAP cleaner)
             FAILED FINAL(lds_failed)
             REPORTED FINAL(lds_reported)
             " TODO: variable is assigned but never used (ABAP cleaner)
             MAPPED FINAL(lds_mapped).

      LOOP AT lds_reported-JournalEntry ASSIGNING FIELD-SYMBOL(<lds_reported>).
        FINAL(ldf_result) = <lds_reported>-%msg->if_message~get_text( ).
        <lds_zfr003_d>-Message = ldf_result.
      ENDLOOP.

*      IF lds_failed-journalentry IS INITIAL.
*
*        COMMIT ENTITIES BEGIN
*          RESPONSE OF i_journalentrytp
*            FAILED DATA(lt_commit_failed)
*            REPORTED DATA(lt_commit_reported).
*
*        "Error handling goes here
*        "Convert the %pid to the drawn db key
*        LOOP AT ls_mapped-journalentry ASSIGNING FIELD-SYMBOL(<ls_mapped>).
*
*          CONVERT KEY OF i_journalentrytp FROM <ls_mapped>-%pid TO DATA(lv_key).
*          <ls_mapped>-companycode = lv_key-companycode.
*          <ls_mapped>-fiscalyear = lv_key-fiscalyear.
*          <ls_mapped>-accountingdocument = lv_key-accountingdocument.
*          EXIT.
*        ENDLOOP.
*
*        DATA(lv_accountingdocument) =  <ls_mapped>-accountingdocument.
*        DATA(lv_fiscal) =  <ls_mapped>-fiscalyear.
*        DATA(lv_companycode) =  <ls_mapped>-companycode.
*
*        WRITE: /10 'Reversed Successfully'.
*        WRITE: /10 'COMPANY CODE:'. WRITE: 60 lv_companycode.
*        WRITE: /10 'FISCAL YEAR:'. WRITE: 60 lv_fiscal.
*        WRITE: /10 'ACCOUNTING DOC:'. WRITE: 60 lv_accountingdocument.
*
*        COMMIT ENTITIES END.
*      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
