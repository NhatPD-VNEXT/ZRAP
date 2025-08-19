CLASS zcl_test_run_vn_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_RUN_VN_001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT *
    FROM I_SuplrInvcItemPurOrdRefAPI01 WITH PRIVILEGED ACCESS
    INTO TABLE @DATA(ldt_data).

*    DATA: if_date      TYPE datum VALUE '20240123',
*          if_last_date TYPE datum.
*
*    DATA lv_first_day TYPE datum.
*
*    lv_first_day = CONV datum( |{ if_date(6) }01| ).
*    if_last_date = lv_first_day + 32.
*    if_last_date = if_last_date - 1.

*    SELECT supplierinvoice,
*           fiscalyear,
*           supplierinvoiceitem,
*           purchaseorder,
*           purchaseorderitem
*    FROM i_suplrinvcitempurordrefapi01
*    WHERE supplierinvoice = '5105600534'
*      AND fiscalyear = '2025'
*    INTO TABLE @DATA(ldt_invoiceitem).
*
*    CHECK sy-subrc = 0.
*
*    SELECT a~inbounddelivery,
*           a~deliverydocumentbysupplier
*      FROM i_inbounddelivery AS a
*      INNER JOIN i_inbounddeliveryitem AS b
*        ON a~inbounddelivery = b~inbounddelivery
*      FOR ALL ENTRIES IN @ldt_invoiceitem
*      WHERE b~purchaseorder     = @ldt_invoiceitem-purchaseorder
*        AND b~purchaseorderitem = @ldt_invoiceitem-purchaseorderitem
*        INTO TABLE @DATA(ldt_inbounddelivery).
*
*    CHECK sy-subrc = 0.
*
*    SELECT companycode,
*          fiscalyear,
*          accountingdocument,
*          ledgergllineitem,
*          sourceledger,
*          assignmentreference
*    FROM i_journalentryitem
*    WHERE referencedocument = '5105600534'
*      AND fiscalyear = '2025'
*      AND ledger = '0L'
*      AND financialaccounttype = 'K'
*    INTO TABLE @DATA(ldt_journalentryitem).
*
*    CHECK sy-subrc = 0.
*
*    DATA: ldt_journalentry  TYPE TABLE FOR ACTION IMPORT i_journalentrytp~change.
*    FIELD-SYMBOLS: <lfs_journalentry> LIKE LINE OF ldt_journalentry.
*
*    DATA lt_glitem           LIKE <lfs_journalentry>-%param-_aparitems.
*    DATA ls_glitem           LIKE LINE OF lt_glitem.
*    DATA ls_glitem_control   LIKE ls_glitem-%control.
*
*    ls_glitem_control-glaccountlineitem              = if_abap_behv=>mk-on.
*    ls_glitem_control-assignmentreference            = if_abap_behv=>mk-on.
*
*    DATA:
*          lds_headercontrol   LIKE <lfs_journalentry>-%param-%control.
*
*
*    LOOP AT ldt_journalentryitem INTO DATA(lds_journalentryitem).
*      APPEND INITIAL LINE TO ldt_journalentry ASSIGNING FIELD-SYMBOL(<lds_journalentry>).
*      <lds_journalentry>-companycode        = lds_journalentryitem-companycode.
*      <lds_journalentry>-fiscalyear         = lds_journalentryitem-fiscalyear.
*      <lds_journalentry>-accountingdocument = lds_journalentryitem-accountingdocument.
*      <lds_journalentry>-%param             = VALUE #( %control   = lds_headercontrol
*                                                       _aparitems = VALUE #( (
*                                                                             glaccountlineitem   = lds_journalentryitem-ledgergllineitem
*                                                                             assignmentreference = ldt_inbounddelivery[ 1 ]-deliverydocumentbysupplier
*                                                                             %control            = ls_glitem_control )
*                                                                             )
*                                                     ).
*    ENDLOOP.
*
*    MODIFY ENTITIES OF i_journalentrytp
*            ENTITY journalentry
*            EXECUTE change FROM ldt_journalentry
*              RESULT DATA(ls_resulted_deep)
*              FAILED DATA(ls_failed_deep)
*              REPORTED DATA(ls_reported_deep)
*              MAPPED DATA(ls_mapped_deep).
*
*    IF ls_failed_deep IS NOT INITIAL.
*    ELSE.
*    COMMIT ENTITIES
*     RESPONSE OF i_supplierinvoicetp
*     FAILED DATA(ls_commit_failed)
*     REPORTED DATA(ls_commit_reported).
*    ENDIF.

*    DATA ls_invoice TYPE STRUCTURE FOR ACTION IMPORT i_supplierinvoicetp~change.
*    DATA lt_invoice TYPE TABLE FOR ACTION IMPORT i_supplierinvoicetp~change.
*
*    " The %cid (temporary primary key) has always to be supplied (is omitted in further examples)
*    TRY.
*        DATA(lv_cid) = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ).
*      CATCH cx_uuid_error.
*        "Error handling
*    ENDTRY.
*
*    "Create a new invoice
*    ls_invoice-%cid = lv_cid.
*    ls_invoice-supplierinvoice = '5105600534'.
*    ls_invoice-supplierinvoicefiscalyear = '2025'.
*    ls_invoice-%param-assignmentreference = '1234567890'.
*    ls_invoice-%param-%control-assignmentreference = if_abap_behv=>mk-on.
*    INSERT ls_invoice INTO TABLE lt_invoice.
*
*    "Register the action
*    MODIFY ENTITIES OF i_supplierinvoicetp
*    ENTITY supplierinvoice
*    EXECUTE change FROM lt_invoice
*    FAILED DATA(ls_failed)
*    REPORTED DATA(ls_reported)
*    MAPPED DATA(ls_mapped).
*
*    IF ls_failed IS NOT INITIAL.
*      DATA lo_message TYPE REF TO if_message.
*
*      LOOP AT ls_reported-supplierinvoice INTO DATA(ls_reported_item).
*        lo_message = ls_reported_item-%msg.
*        DATA(ldf_msg_text) = lo_message->get_text( ).
*        out->write( ldf_msg_text ).
*      ENDLOOP.
*      "Error handling
*      RETURN.
*    ENDIF.
*
*    "Execution the action
*    COMMIT ENTITIES
*     RESPONSE OF i_supplierinvoicetp
*     FAILED DATA(ls_commit_failed)
*     REPORTED DATA(ls_commit_reported).
*
*    IF ls_commit_reported IS NOT INITIAL.
*      LOOP AT ls_commit_reported-supplierinvoice ASSIGNING FIELD-SYMBOL(<ls_invoice>).
*        IF <ls_invoice>-supplierinvoice IS NOT INITIAL AND
*        <ls_invoice>-supplierinvoicefiscalyear IS NOT INITIAL.
*          "Success case
*        ELSE.
*          "Error handling
*        ENDIF.
*      ENDLOOP.
*    ENDIF.
*
*    IF ls_commit_failed IS NOT INITIAL.
*      LOOP AT ls_commit_reported-supplierinvoice ASSIGNING <ls_invoice>.
*        "Error handling
*      ENDLOOP.
*    ENDIF.



*    DATA: ldt_cdredadd TYPE cl_chdo_read_tools=>tt_cdredadd_tab,
*          ldt_objectid TYPE cl_chdo_read_tools=>tt_r_objectid.
*    ldt_objectid = VALUE #( (
*    sign = 'I'
*    option = 'EQ'
*    low = 'FG126'
*    ) ).
*
*    TRY.
*        cl_chdo_read_tools=>changedocument_read(
*                  EXPORTING
*                     i_objectclass    = 'ZNTZCDTF034_01'  " change document object name
**                     it_objectid      = ldt_objectid
*                   IMPORTING
*                     et_cdredadd_tab  = ldt_cdredadd    " result returned in table
*                ).
*      CATCH cx_chdo_read_error INTO DATA(lo_error).
*        out->write( lo_error->get_longtext( ) ).
*        "handle exception
*    ENDTRY.
*
*    out->write( ldt_cdredadd ).

  ENDMETHOD.
ENDCLASS.
