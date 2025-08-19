CLASS lsc_zi_mf003_01_vn DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zi_mf003_01_vn IMPLEMENTATION.

  METHOD save_modified.

    CHECK update IS NOT INITIAL.
    CHECK  create IS NOT INITIAL.
    CHECK delete IS NOT INITIAL.

    "Read invoi_modified( ).

  ENDMETHOD.

ENDCLASS.

*CLASS lsc_zi_mf003_01_vn DEFINITION INHERITING FROM cl_abap_behavior_saver.
*
*  PROTECTED SECTION.
*
**    METHODS save_modified REDEFINITION.
*
*ENDCLASS.
*
*CLASS lsc_zi_mf003_01_vn IMPLEMENTATION.
*
**  METHOD save_modified.
**    CHECK sy-subrc = 0.
**  ENDMETHOD.
*
*ENDCLASS.


"! Behavior implementation class for Invoice entity
CLASS lhc__invoice DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    "! Get instance features for Invoice entity
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _invoice RESULT result.

    "! Get instance authorizations for Invoice entity
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _invoice RESULT result.

    "! Get global authorizations for Invoice entity
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _invoice RESULT result.

    "! Validate Invoice Number on save
    METHODS validateinvoiceno FOR VALIDATE ON SAVE
      IMPORTING keys FOR _invoice~validateinvoiceno.

    "! Validate Posting Date on save
    METHODS validatepostingdate FOR VALIDATE ON SAVE
      IMPORTING keys FOR _invoice~validatepostingdate.
    METHODS setdocumentdate FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _invoice~setdocumentdate.
    METHODS activate FOR MODIFY
      IMPORTING keys FOR ACTION _invoice~activate.
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE _invoice.
ENDCLASS.

CLASS lhc__invoice IMPLEMENTATION.

  METHOD get_instance_features.
    "Read invoice entities
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         FIELDS ( invoiceno )
         WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_invoice).

    result = VALUE #( FOR lds_invoice1 IN ldt_invoice
                      ( %tky                = lds_invoice1-%tky
*                        %action-edit        = if_abap_behv=>fc-o-disabled
                        %field-documentdate = if_abap_behv=>fc-f-read_only
                      ) ).



    "-- about open/close action
*    DATA lds_result LIKE LINE OF result.
*    LOOP AT ldt_invoice INTO DATA(lds_invoice).
*      CLEAR lds_result.
*      MOVE-CORRESPONDING lds_invoice TO lds_result.
*      lds_result-%features-%field-documentdate = if_abap_behv=>mk-off.
*      APPEND lds_result TO result.
*    ENDLOOP.

*    CHECK ldt_invoice[ 1 ]-invoiceno IS NOT INITIAL.

    DATA ldt_invoiceno TYPE SORTED TABLE OF zi_mf003_05_vh_vn WITH UNIQUE KEY referencedocument.

    "Extract distinct non-initial invoice numbers for optimization
    ldt_invoiceno = CORRESPONDING #( ldt_invoice DISCARDING DUPLICATES MAPPING referencedocument = invoiceno EXCEPT * ).
    DELETE ldt_invoiceno WHERE referencedocument IS INITIAL.

    IF ldt_invoiceno IS NOT INITIAL.
      "Check if invoice numbers exist in validation table
      SELECT FROM zi_mf003_05_vh_vn FIELDS referencedocument

                                FOR ALL ENTRIES IN @ldt_invoiceno
                                WHERE referencedocument = @ldt_invoiceno-referencedocument
        INTO TABLE @DATA(ldt_valid_invoiceno).
    ENDIF.


    "Validate each invoice
*    LOOP AT ldt_invoice INTO DATA(lds_invoice).
*      APPEND VALUE #( %tky        = lds_invoice-%tky
*                      %state_area = 'VALIDATE_INVOICENO'
*      ) TO reported-_invoice.
*
*      "Check if invoice number is empty
*      IF lds_invoice-invoiceno IS INITIAL.
*        APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.
*
*        APPEND VALUE #( %tky               = lds_invoice-%tky
*                        %state_area        = 'VALIDATE_INVOICENO'
*                        %msg               = new_message_with_text(
*                        severity = if_abap_behv_message=>severity-error
*                        text     = |Invoice number is required| )
*                        %element-invoiceno = if_abap_behv=>mk-on
*                      ) TO reported-_invoice.
*        "Check if invoice number exists
*      ELSEIF lds_invoice-invoiceno IS NOT INITIAL AND NOT line_exists( ldt_valid_invoiceno[ referencedocument = lds_invoice-invoiceno ] ).
*        APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.
*        APPEND VALUE #( %tky               = lds_invoice-%tky
*                        %state_area        = 'VALIDATE_INVOICENO'
*                        %msg               = new_message_with_text(
*                        severity = if_abap_behv_message=>severity-error
*                        text     = |Invoice number does not exist| )
*                        %element-invoiceno = if_abap_behv=>mk-on
*                      ) TO reported-_invoice.
*      ENDIF.
*    ENDLOOP.

*    LOOP AT ldt_invoice INTO DATA(lds_invoice).
*      IF lds_invoice-postingdate IS NOT INITIAL AND
*         lds_invoice-postingdate < '20250529'.
*        APPEND VALUE #( %tky        = lds_invoice-%tky
*                        %state_area = 'VALIDATE_POSTINGDATE'
*                      ) TO reported-_invoice.
*
*        APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.
*
*        APPEND VALUE #( %tky                 = lds_invoice-%tky
*                        %state_area          = 'VALIDATE_POSTINGDATE'
*                        %msg                 = new_message_with_text(
*                        severity = if_abap_behv_message=>severity-error
*                        text     = |Postingdate is required| )
*                        %element-postingdate = if_abap_behv=>mk-on
*                      ) TO reported-_invoice.
*      ENDIF.
*    ENDLOOP.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateinvoiceno.
    CHECK sy-subrc = 0.
    "Read invoice entities for validation
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         FIELDS ( invoiceno )
         WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_invoice).

    DATA ldt_invoiceno TYPE SORTED TABLE OF zi_mf003_05_vh_vn WITH UNIQUE KEY referencedocument.

    "Extract unique invoice numbers for efficient DB lookup
    ldt_invoiceno = CORRESPONDING #( ldt_invoice DISCARDING DUPLICATES MAPPING referencedocument = invoiceno EXCEPT * ).
    DELETE ldt_invoiceno WHERE referencedocument IS INITIAL.

    IF ldt_invoiceno IS NOT INITIAL.
      "Validate invoice numbers against master data
      SELECT FROM zi_mf003_05_vh_vn FIELDS referencedocument
                                FOR ALL ENTRIES IN @ldt_invoiceno
                                WHERE referencedocument = @ldt_invoiceno-referencedocument
        INTO TABLE @DATA(ldt_valid_invoiceno).
    ENDIF.

    "Process each invoice and report validation results
    LOOP AT ldt_invoice INTO DATA(lds_invoice).
      APPEND VALUE #( %tky        = lds_invoice-%tky
                      %state_area = 'VALIDATE_INVOICENO'
                    ) TO reported-_invoice.

      "Error case 1: Invoice number is empty
      IF lds_invoice-invoiceno IS INITIAL.
        APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.

        APPEND VALUE #( %tky               = lds_invoice-%tky
                        %state_area        = 'VALIDATE_INVOICENO'
                        %msg               = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = |Invoice number is required| )
                        %element-invoiceno = if_abap_behv=>mk-on
                      ) TO reported-_invoice.

        "Error case 2: Invoice number doesn't exist in master data
      ELSEIF lds_invoice-invoiceno IS NOT INITIAL AND NOT
             line_exists( ldt_valid_invoiceno[ referencedocument = lds_invoice-invoiceno ] ).
        APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.
        APPEND VALUE #( %tky               = lds_invoice-%tky
                        %state_area        = 'VALIDATE_INVOICENO'
                        %msg               = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = |Invoice number does not exist| )
                        %element-invoiceno = if_abap_behv=>mk-on
                      ) TO reported-_invoice.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validatepostingdate.
    "Read invoice entities for posting date validation
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         FIELDS ( postingdate )
         WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_invoice).

    "Process each invoice and validate posting date
    LOOP AT ldt_invoice INTO DATA(lds_invoice).
      APPEND VALUE #( %tky        = lds_invoice-%tky
                      %state_area = 'VALIDATE_POSTINGDATE'
                    ) TO reported-_invoice.

      "Error case: Posting date is empty
      IF lds_invoice-postingdate IS INITIAL.
        APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.

        APPEND VALUE #( %tky                 = lds_invoice-%tky
                        %state_area          = 'VALIDATE_POSTINGDATE'
                        %msg                 = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = |Postingdate is required| )
                        %element-postingdate = if_abap_behv=>mk-on
                      ) TO reported-_invoice.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD setdocumentdate.

    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
           ENTITY _invoice
           FIELDS ( documentdate )
           WITH CORRESPONDING #( keys )
           RESULT FINAL(ldt_invoice).

    MODIFY ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
    ENTITY _invoice
      UPDATE
        FIELDS ( invoiceid documentdate )
        WITH VALUE #( ( %is_draft    = ldt_invoice[ 1 ]-%is_draft
                        invoiceid    = ldt_invoice[ 1 ]-invoiceid
                        documentdate = sy-datum ) )
      FAILED DATA(lds_failed_d)
      REPORTED DATA(lds_reported_d)
      MAPPED DATA(lds_mapped_d).
  ENDMETHOD.

  METHOD activate.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD precheck_update.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ldf_data>).

      CHECK <ldf_data>-%control-postingdate = '01'.
*      READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
*           ENTITY _detail
*           ALL FIELDS
*           WITH VALUE #( ( %key = <ldf_data>-%key ) )
*           RESULT FINAL(ldt_data_d)
*           FAILED FINAL(ldt_failed_d).

      READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
           ENTITY _invoice
           ALL FIELDS
           WITH VALUE #( ( %key      = <ldf_data>-%key
                           %is_draft = <ldf_data>-%is_draft ) )
           RESULT FINAL(ldt_data_inv)
           FAILED FINAL(ldt_failed_inv).

      LOOP AT ldt_data_inv INTO DATA(lds_invoice).
        IF <ldf_data>-postingdate IS NOT INITIAL AND
           <ldf_data>-postingdate < '20250601'.
          APPEND VALUE #( %tky        = lds_invoice-%tky
                          %state_area = 'VALIDATE_POSTINGDATE'
                        ) TO reported-_invoice.

          APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_invoice.

          APPEND VALUE #( %tky                 = lds_invoice-%tky
                          %state_area          = 'VALIDATE_POSTINGDATE'
                          %msg                 = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = |Postingdate is required| )
                          %element-postingdate = if_abap_behv=>mk-on
                        ) TO reported-_invoice.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

"! Behavior implementation class for Detail entity
CLASS lhc__detail DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    "! Structure type for detail and allocation data
    TYPES: BEGIN OF gts_type,
             detail   TYPE STRUCTURE FOR READ RESULT zi_mf003_01_vn\\_detail,
             allocate TYPE TABLE FOR READ RESULT zi_mf003_01_vn\\_invoice\_allocate.
    TYPES: END OF gts_type.

    "! Get instance authorizations for Detail entity
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _detail RESULT result.

    "! Get global authorizations for Detail entity
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _detail RESULT result.

    "! Action method for allocation type 01 (quantity based)
    METHODS allocate_01 FOR MODIFY
      IMPORTING keys FOR ACTION _detail~allocate_01 RESULT result.

    "! Action method for allocation type 02 (amount based)
    METHODS allocate_02 FOR MODIFY
      IMPORTING keys FOR ACTION _detail~allocate_02 RESULT result.

    "! Create data determination
    METHODS createdata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~createdata.

    "! Delete data determination
    METHODS deletedata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~deletedata.
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE _detail.
    METHODS validatesupplier FOR VALIDATE ON SAVE
      IMPORTING keys FOR _detail~validatesupplier.
    METHODS validateexpense FOR VALIDATE ON SAVE
      IMPORTING keys FOR _detail~validateexpense.

    "! Helper method for allocation
    METHODS allocate
      IMPORTING if_type   TYPE char2
                is_data_d TYPE gts_type-detail.

    "! Helper method to delete allocation results
    METHODS delete_allocation_result
      IMPORTING it_allocate TYPE gts_type-allocate.

ENDCLASS.

CLASS lhc__detail IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD allocate_01.

    "Read detail entities for quantity-based allocation
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    LOOP AT ldt_data_d INTO DATA(lds_data).
      APPEND VALUE #( %tky        = lds_data-%tky
                      %state_area = 'VALIDATE_SUPPLIER'
                    ) TO reported-_detail.
      IF lds_data-supplier <> '0015401510'.

        APPEND VALUE #( %tky = lds_data-%tky ) TO failed-_detail.

        APPEND VALUE #( %tky              = lds_data-%tky
                        %state_area       = 'VALIDATE_SUPPLIER'
                        %msg              = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = |Error| )
                        %element-supplier = if_abap_behv=>mk-on
                      ) TO reported-_detail.
      ELSE.
        APPEND VALUE #( %tky        = lds_data-%tky
                        %state_area = 'VALIDATE_SUPPLIER'
                      ) TO reported-_detail.
      ENDIF.
    ENDLOOP.

    "Read existing allocations to be deleted
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         BY \_allocate
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(ldt_data_allocate)
         FAILED FINAL(ldt_failed_allocate).

    "Filter allocations for current item
    DATA(lds_key) = keys[ 1 ].
    DELETE ldt_data_allocate WHERE invoiceuuitem <> lds_key-invoiceuuitem.

    "Delete existing allocations if any
    IF ldt_data_allocate IS NOT INITIAL.
      delete_allocation_result( it_allocate = ldt_data_allocate ).
    ENDIF.

    "Create new quantity-based allocation
    allocate(
      if_type   = '01' "quantity
      is_data_d = ldt_data_d[ 1 ]
    ).
  ENDMETHOD.

  METHOD allocate_02.
    "Read detail entities for amount-based allocation
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    "Read existing allocations to be deleted
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         BY \_allocate
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(ldt_data_allocate)
         FAILED FINAL(ldt_failed_allocate).

    "Filter allocations for current item
    DATA(lds_key) = keys[ 1 ].
    DELETE ldt_data_allocate WHERE invoiceuuitem <> lds_key-invoiceuuitem.

    "Delete existing allocations if any
    IF ldt_data_allocate IS NOT INITIAL.
      delete_allocation_result( it_allocate = ldt_data_allocate ).
    ENDIF.

    "Create new amount-based allocation
    DATA(lds_data_d) = ldt_data_d[ 1 ].
    allocate(
      if_type   = '02' "amount
      is_data_d = lds_data_d
    ).
  ENDMETHOD.

  METHOD createdata.
    "Variables for invoice item handling
    DATA: ldf_invoice_item TYPE zmf003t_02_vn-invoice_item.

    "Read detail entities
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_inv)
         FAILED FINAL(ldt_failed_inv).

    IF ldt_data_inv IS INITIAL.
      RETURN.
    ENDIF.

    DATA(lds_data_d) = ldt_data_d[ 1 ].
    DATA(lds_data_inv) = ldt_data_inv[ 1 ].

    "Get next invoice item number
    SELECT MAX( invoiceitem )
      FROM zmf003t_02_d_vn
      WHERE invoiceid = @lds_data_d-invoiceid
        AND ( draftentityoperationcode <> 'D' AND draftentityoperationcode <> 'L' )  "Exclude deleted items
      INTO @ldf_invoice_item.

    "Calculate next item number (increment by 10)
    lds_data_d-invoiceitem = COND #( WHEN ldf_invoice_item IS NOT INITIAL
                                        THEN ldf_invoice_item + 10
                                        ELSE '10' ).

    "Get supplier and company code from material document
    SELECT SINGLE supplier, companycode
    FROM i_materialdocumentitem_2 AS a
    INNER JOIN i_materialdocumentheader_2 AS b
    ON a~materialdocument      = b~materialdocument
    AND a~materialdocumentyear = b~materialdocumentyear
    WHERE b~referencedocument  = @lds_data_inv-invoiceno
    INTO ( @lds_data_d-supplier, @DATA(ldf_companycode) ).

    "Get supplier name
    SELECT SINGLE suppliername
    FROM i_supplier
    WHERE supplier =  @lds_data_d-supplier
    INTO @lds_data_d-suppliername.

    "Get purchase order currency
    SELECT SINGLE purchaseordercurrency
    FROM i_supplierpurchasingorg
    WHERE supplier = @lds_data_d-supplier
      AND purchasingorganization = @ldf_companycode
    INTO @lds_data_d-purchaseordercurrency.

    "Update detail entity with collected data
    MODIFY ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
      ENTITY _detail
        UPDATE
          FIELDS ( invoiceitem invoiceid invoiceno supplier suppliername purchaseordercurrency )
          WITH VALUE #( ( %is_draft             = lds_data_d-%is_draft
                          invoiceuuitem         = lds_data_d-invoiceuuitem
                          invoiceid             = lds_data_inv-invoiceid
                          invoiceno             = lds_data_inv-invoiceno
                          invoiceitem           = lds_data_d-invoiceitem
                          supplier              = lds_data_d-supplier
                          suppliername          = lds_data_d-suppliername
                          purchaseordercurrency = lds_data_d-purchaseordercurrency ) )
        FAILED DATA(lds_failed_d)
        REPORTED DATA(lds_reported_d)
        MAPPED DATA(lds_mapped_d).

    IF lds_failed_d IS INITIAL.
      RETURN.
    ENDIF.

*        READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
*         ENTITY _Invoice
*         ALL FIELDS WITH CORRESPONDING #( keys )
*         RESULT FINAL(ldt_data_ddd)
*         FAILED FINAL(ldt_failed_ddd).

  ENDMETHOD.

  METHOD deletedata.
    "Read allocation data for deletion
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _invoice
         BY \_allocate
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(ldt_data_allocate)
         FAILED FINAL(ldt_failed_allocate).

    "Filter allocations for the given keys
    ldt_data_allocate =
     REDUCE #( INIT result = VALUE #( )
                                  FOR lds_data_allocate IN ldt_data_allocate
                                  FOR key IN keys
                                  NEXT result = COND #( WHEN lds_data_allocate-invoiceuuitem = key-invoiceuuitem
                                                       THEN VALUE #( BASE result ( lds_data_allocate ) )
                                                       ELSE result ) ).

    "Delete filtered allocations if any exist
    IF ldt_data_allocate IS NOT INITIAL.
      delete_allocation_result( it_allocate = ldt_data_allocate ).
    ENDIF.
  ENDMETHOD.

  METHOD allocate.
    "Variables for amount calculations
    DATA ldf_amountexpense     TYPE p LENGTH 8 DECIMALS 0.
    DATA ldf_amountexpense_sum TYPE p LENGTH 8 DECIMALS 0.

    "Get material document items for allocation
    SELECT *
    FROM zi_mf003_06_vn
    WHERE invoiceno = @is_data_d-invoiceno
    INTO TABLE @DATA(ldt_item).

    IF sy-subrc = 0.
      SORT ldt_item BY materialdocumentyear
                       materialdocument
                       materialdocumentitem.
    ENDIF.

    "Calculate totals based on allocation type
    CASE if_type.
      WHEN '01'.
        "Calculate total quantity for quantity-based allocation
        FINAL(ldf_quantity_sum) =
            REDUCE menge_d( INIT q = CONV menge_d( 0 )
                            FOR wa IN ldt_item
                            NEXT q = q + wa-quantityinentryunit ).
      WHEN '02'.
        "Calculate total amount for amount-based allocation
        FINAL(ldf_amount_sum) =
            REDUCE dmbtr( INIT a = CONV dmbtr( 0 )
                            FOR wa IN ldt_item
                            NEXT a = a + wa-totalgoodsmvtamtincccrcy ).
      WHEN OTHERS.
    ENDCASE.

    FINAL(ldf_line) = lines( ldt_item ).

    "Prepare data structures for allocation creation
    DATA: ldt_data TYPE TABLE FOR CREATE zi_mf003_01_vn\_allocate,
          lds_data LIKE LINE OF ldt_data.

    lds_data = VALUE #(
           %key-invoiceid = is_data_d-invoiceid
           %is_draft      = is_data_d-%is_draft ).

    "Process each item for allocation
    LOOP AT ldt_item INTO FINAL(lds_item).
      FINAL(ldf_index) = sy-tabix.

      "Calculate expense amount based on allocation type
      ldf_amountexpense = COND #(
        WHEN ldf_line = ldf_index
        THEN is_data_d-amountexpense - ldf_amountexpense_sum
        ELSE COND #(
          WHEN if_type = '01' AND ldf_quantity_sum <> 0
          THEN lds_item-quantityinentryunit / ldf_quantity_sum * is_data_d-amountexpense
          WHEN if_type = '02' AND ldf_amount_sum <> 0
          THEN lds_item-totalgoodsmvtamtincccrcy / ldf_amount_sum * is_data_d-amountexpense
          ELSE 0
        )
      ).

      ldf_amountexpense_sum += ldf_amountexpense.

      "Create allocation entry
      APPEND VALUE #(
            %cid                              = |CREATE_{ ldf_index }|
            %is_draft                         = is_data_d-%is_draft
            materialdocumentyear              = lds_item-materialdocumentyear
            materialdocument                  = lds_item-materialdocument
            materialdocumentitem              = lds_item-materialdocumentitem
            invoiceuuitem                     = is_data_d-invoiceuuitem
            invoiceno                         = is_data_d-invoiceno
            invoiceitem                       = is_data_d-invoiceitem
            companycode                       = lds_item-companycode
            purchaseorder                     = lds_item-purchaseorder
            purchaseorderitem                 = lds_item-purchaseorderitem
            expensescategoryid                = is_data_d-expensescategoryid
            expensescategoryname              = is_data_d-expensescategoryname
            product                           = lds_item-material
            productname                       = lds_item-productname
            quantityinentryunit               = lds_item-quantityinentryunit
            entryunit                         = lds_item-entryunit
            totalgoodsmvtamtincccrcy          = lds_item-totalgoodsmvtamtincccrcy
            companycodecurrency               = lds_item-companycodecurrency
            purchaseordercurrency             = is_data_d-purchaseordercurrency
            amountexpense                     = ldf_amountexpense
            %control-materialdocumentyear     = if_abap_behv=>mk-on
            %control-materialdocument         = if_abap_behv=>mk-on
            %control-materialdocumentitem     = if_abap_behv=>mk-on
            %control-invoiceuuitem            = if_abap_behv=>mk-on
            %control-invoiceno                = if_abap_behv=>mk-on
            %control-invoiceitem              = if_abap_behv=>mk-on
            %control-companycode              = if_abap_behv=>mk-on
            %control-purchaseorder            = if_abap_behv=>mk-on
            %control-purchaseorderitem        = if_abap_behv=>mk-on
            %control-expensescategoryid       = if_abap_behv=>mk-on
            %control-expensescategoryname     = if_abap_behv=>mk-on
            %control-product                  = if_abap_behv=>mk-on
            %control-productname              = if_abap_behv=>mk-on
            %control-quantityinentryunit      = if_abap_behv=>mk-on
            %control-entryunit                = if_abap_behv=>mk-on
            %control-totalgoodsmvtamtincccrcy = if_abap_behv=>mk-on
            %control-companycodecurrency      = if_abap_behv=>mk-on
            %control-purchaseordercurrency    = if_abap_behv=>mk-on
            %control-amountexpense            = if_abap_behv=>mk-on
      )
             TO lds_data-%target.
    ENDLOOP.

    APPEND lds_data TO ldt_data.
    CLEAR: lds_data.

    "Create allocation entries
    MODIFY ENTITIES OF zi_mf003_01_vn
        IN LOCAL MODE
        ENTITY _invoice
        CREATE BY \_allocate
        AUTO FILL CID WITH ldt_data
    REPORTED DATA(ldt_reported_allocate)
    FAILED DATA(ldt_failed_allocate)
    MAPPED DATA(ldt_mapped_allocate).


    MODIFY ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
      ENTITY _invoice
        UPDATE
          FIELDS ( invoiceid documentdate )
          WITH VALUE #( ( %is_draft    = is_data_d-%is_draft
                          invoiceid    = is_data_d-invoiceid
                          documentdate = '20250101' ) )
        FAILED DATA(lds_failed_d)
        REPORTED DATA(lds_reported_d)
        MAPPED DATA(lds_mapped_d).
  ENDMETHOD.

  METHOD delete_allocation_result.
    "Delete allocation entries
    MODIFY ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
      ENTITY _allocate
      DELETE FROM VALUE #( FOR lds_allocate IN it_allocate
                           ( %is_draft = lds_allocate-%is_draft
*                             InvoiceUuitem        = lds_allocate-InvoiceUuitem
*                             MaterialDocument     = lds_allocate-MaterialDocument
*                             MaterialDocumentItem = lds_allocate-MaterialDocumentItem
*                             MaterialDocumentYear = lds_allocate-MaterialDocumentYear
*-< UPD V1.01 (S) >-*
                             processid = lds_allocate-processid
*-< UPD V1.01 (E) >-*
                           ) )
      FAILED FINAL(ldt_failed_del).
  ENDMETHOD.

  METHOD precheck_update.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ldf_data>).
      CHECK <ldf_data>-%control-taxcode = '01'.
      READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
           ENTITY _detail
           ALL FIELDS
           WITH VALUE #( ( %key      = <ldf_data>-%key
                           %is_draft = <ldf_data>-%is_draft ) )
           RESULT FINAL(ldt_data_d)
           FAILED FINAL(ldt_failed_d)
           REPORTED DATA(ldt_check).

      LOOP AT ldt_data_d INTO DATA(lds_invoice).
        IF <ldf_data>-taxcode IS NOT INITIAL AND
           <ldf_data>-taxcode <> 'N1'.
          APPEND VALUE #( %tky        = lds_invoice-%tky
                          %state_area = 'VALIDATE_POSTINGDATE'
                        ) TO reported-_detail.

          APPEND VALUE #( %tky = lds_invoice-%tky ) TO failed-_detail.

          APPEND VALUE #( %tky             = lds_invoice-%tky
                          %state_area      = 'VALIDATE_POSTINGDATE'
                          %msg             = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = |Taxcode check| )
                          %element-taxcode = if_abap_behv=>mk-on
                        ) TO reported-_detail.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD validatesupplier.

    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
            ENTITY _detail BY \_invoice
              FROM CORRESPONDING #( keys )
            LINK DATA(invoice_link).

    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    LOOP AT ldt_data_d INTO DATA(lds_data).
      APPEND VALUE #( %tky        = lds_data-%tky
                      %state_area = 'VALIDATE_SUPPLIER'
                    ) TO reported-_detail.
      IF lds_data-supplier <> '0015401510'.

        APPEND VALUE #( %tky = lds_data-%tky ) TO failed-_detail.

        APPEND VALUE #( %tky              = lds_data-%tky
                        %state_area       = 'VALIDATE_SUPPLIER'
                        %msg              = new_message_with_text(
                                                     severity      = if_abap_behv_message=>severity-error
                                                     text          = |Error| )
                        %element-supplier = if_abap_behv=>mk-on
                        %path             = VALUE #( _invoice-%tky = invoice_link[ KEY id source-%tky = lds_data-%tky ]-target-%tky )
                      ) TO reported-_detail.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateexpense.
    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
            ENTITY _detail BY \_invoice
              FROM CORRESPONDING #( keys )
            LINK DATA(invoice_link).

    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    LOOP AT ldt_data_d INTO DATA(lds_data).
      APPEND VALUE #( %tky        = lds_data-%tky
                      %state_area = 'VALIDATE_EXPENSE'
                    ) TO reported-_detail.
      IF lds_data-expensescategoryid <> '10'.

        APPEND VALUE #( %tky = lds_data-%tky ) TO failed-_detail.

        APPEND VALUE #( %tky                        = lds_data-%tky
                        %state_area                 = 'VALIDATE_EXPENSE'
                        %msg                        = new_message_with_text(
                                                               severity      = if_abap_behv_message=>severity-error
                                                               text          = |Error| )
                        %element-expensescategoryid = if_abap_behv=>mk-on
                        %path                       = VALUE #( _invoice-%tky = invoice_link[ KEY id source-%tky = lds_data-%tky ]-target-%tky )
                      ) TO reported-_detail.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc__allocate DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _allocate RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _allocate RESULT result.


    METHODS cancel FOR MODIFY
      IMPORTING keys FOR ACTION _allocate~cancel RESULT result.
    METHODS create FOR MODIFY
      IMPORTING keys FOR ACTION _allocate~create RESULT result.
    METHODS getdefaultsfor_za_mf003_01_vn FOR READ
      IMPORTING keys FOR FUNCTION _allocate~getdefaultsfor_za_mf003_01_vn RESULT result.
    METHODS precheck_cancel FOR PRECHECK
      IMPORTING keys FOR ACTION _allocate~cancel.

ENDCLASS.

CLASS lhc__allocate IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD cancel.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD create.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD getdefaultsfor_za_mf003_01_vn.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD precheck_cancel.
  ENDMETHOD.


ENDCLASS.
