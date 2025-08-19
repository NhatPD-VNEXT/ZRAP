*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
*"* Local helper class for handling supplier invoice events
CLASS lhe_test DEFINITION INHERITING FROM cl_abap_behavior_event_handler.
  PRIVATE SECTION.
    " Method to handle the event after supplier invoice is created
    METHODS created FOR ENTITY EVENT
       created FOR supplierinvoice~created.
ENDCLASS.

CLASS lhe_test IMPLEMENTATION.
  METHOD created.
    " Check if any invoices were created
    CHECK created IS NOT INITIAL.

    " Get the first created invoice
    DATA(lds_invoice) = created[ 1 ].

    " Select invoice items with purchase order references
    SELECT supplierinvoice,
           fiscalyear,
           supplierinvoiceitem,
           purchaseorder,
           purchaseorderitem
    FROM i_suplrinvcitempurordrefapi01
    WHERE supplierinvoice = @lds_invoice-supplierinvoice
      AND fiscalyear = @lds_invoice-fiscalyear
    INTO TABLE @DATA(ldt_invoiceitem).

    CHECK sy-subrc = 0.

    " Select inbound deliveries related to purchase orders
    SELECT a~inbounddelivery,
           a~deliverydocumentbysupplier
      FROM i_inbounddelivery AS a
      INNER JOIN i_inbounddeliveryitem AS b
        ON a~inbounddelivery = b~inbounddelivery
      FOR ALL ENTRIES IN @ldt_invoiceitem
      WHERE b~purchaseorder     = @ldt_invoiceitem-purchaseorder
        AND b~purchaseorderitem = @ldt_invoiceitem-purchaseorderitem
        INTO TABLE @DATA(ldt_inbounddelivery).

    CHECK sy-subrc = 0.

    " Select journal entry items for the invoice
    SELECT companycode,
          fiscalyear,
          accountingdocument,
          ledgergllineitem,
          sourceledger,
          assignmentreference
    FROM i_journalentryitem
    WHERE referencedocument = @lds_invoice-supplierinvoice
      AND fiscalyear = @lds_invoice-supplierinvoicefiscalyear
      AND ledger = '0L'
      AND financialaccounttype = 'K'
    INTO TABLE @DATA(ldt_journalentryitem).

    CHECK sy-subrc = 0.

    " Prepare data for journal entry modification
    DATA: ldt_journalentry TYPE TABLE FOR ACTION IMPORT i_journalentrytp~change.
    FIELD-SYMBOLS: <lfs_journalentry> LIKE LINE OF ldt_journalentry.

    DATA lt_glitem           LIKE <lfs_journalentry>-%param-_aparitems.
    DATA ls_glitem           LIKE LINE OF lt_glitem.
    DATA ls_glitem_control   LIKE ls_glitem-%control.

    " Set control flags for GL account line item and assignment reference
    ls_glitem_control-glaccountlineitem   = if_abap_behv=>mk-on.
    ls_glitem_control-assignmentreference = if_abap_behv=>mk-on.

    DATA: lds_headercontrol   LIKE <lfs_journalentry>-%param-%control.

    " Process each journal entry item
    LOOP AT ldt_journalentryitem INTO DATA(lds_journalentryitem).
      APPEND INITIAL LINE TO ldt_journalentry ASSIGNING FIELD-SYMBOL(<lds_journalentry>).
      <lds_journalentry>-companycode        = lds_journalentryitem-companycode.
      <lds_journalentry>-fiscalyear         = lds_journalentryitem-fiscalyear.
      <lds_journalentry>-accountingdocument = lds_journalentryitem-accountingdocument.
      <lds_journalentry>-%param = VALUE #(
        %control   = lds_headercontrol
        _aparitems = VALUE #( (
                              glaccountlineitem   = lds_journalentryitem-ledgergllineitem
                              assignmentreference = ldt_inbounddelivery[ 1 ]-deliverydocumentbysupplier
                              %control            = ls_glitem_control )
                              )
      ).
    ENDLOOP.

    " Execute the journal entry modification
    MODIFY ENTITIES OF i_journalentrytp
            ENTITY journalentry
            EXECUTE change FROM ldt_journalentry
              RESULT DATA(ls_resulted_deep)
              FAILED DATA(ls_failed_deep)
              REPORTED DATA(ls_reported_deep)
              MAPPED DATA(ls_mapped_deep).

    " Handle the result of the modification
    IF ls_failed_deep IS NOT INITIAL.
      " TODO: Add error handling logic here
    ENDIF.
  ENDMETHOD.
ENDCLASS.
