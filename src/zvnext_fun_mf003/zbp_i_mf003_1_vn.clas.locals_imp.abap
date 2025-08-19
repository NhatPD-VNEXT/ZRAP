CLASS lhc__detail DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS createData FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _Detail~createData.

ENDCLASS.

CLASS lhc__detail IMPLEMENTATION.

  METHOD createData.

    "Variables for invoice item handling
    DATA: ldf_invoice_item TYPE zmf003t_02_vn-invoice_item.

    "Read detail entities
    READ ENTITIES OF zi_mf003_1_vn IN LOCAL MODE
         ENTITY _Detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         FAILED FINAL(ldt_failed_d).


    READ ENTITIES OF zi_mf003_1_vn IN LOCAL MODE
         ENTITY _Invoice
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_inv)
         FAILED FINAL(ldt_failed_inv).

    DATA(lds_data_d) = ldt_data_d[ 1 ].
    DATA(lds_data_inv) = ldt_data_inv[ 1 ].

    "Get next invoice item number
    SELECT MAX( invoiceitem )
      FROM zmf003t_2_d_vn
      WHERE invoiceno = @lds_data_inv-InvoiceNo
        AND ( draftentityoperationcode <> 'D' AND draftentityoperationcode <> 'L' )  "Exclude deleted items
      INTO @ldf_invoice_item.

    "Calculate next item number (increment by 10)
    lds_data_d-InvoiceItem = COND #( WHEN ldf_invoice_item IS NOT INITIAL
                                        THEN ldf_invoice_item + 10
                                        ELSE '10' ).

    "Get supplier and company code from material document
    SELECT SINGLE supplier, companycode
    FROM I_MaterialDocumentItem_2 AS a
    INNER JOIN I_MaterialDocumentHeader_2 AS b
    ON a~MaterialDocument      = b~MaterialDocument
    AND a~MaterialDocumentYear = b~MaterialDocumentYear
    WHERE b~ReferenceDocument  = @lds_data_d-InvoiceNo
    INTO ( @lds_data_d-Supplier, @DATA(ldf_companycode) ).

    "Get supplier name   name
    SELECT SINGLE SupplierName
    FROM I_Supplier
    WHERE Supplier =  @lds_data_d-Supplier
    INTO @lds_data_d-SupplierName.

    "Get company code
    SELECT SINGLE PurchaseOrderCurrency
    FROM I_SupplierPurchasingOrg
    WHERE Supplier = @lds_data_d-Supplier
      AND PurchasingOrganization = @ldf_companycode
    INTO @lds_data_d-Purchaseordercurrency.

    "Update detail entity with collected data
    MODIFY ENTITIES OF zi_mf003_1_vn IN LOCAL MODE
      ENTITY _Detail
        UPDATE
          FIELDS ( InvoiceItem Supplier SupplierName Purchaseordercurrency )
          WITH VALUE #( ( %is_draft             = lds_data_d-%is_draft
                          InvoiceUuitem         = lds_data_d-InvoiceUuitem
                          InvoiceNo             = lds_data_d-InvoiceNo
                          InvoiceId             = lds_data_d-InvoiceId
                          InvoiceItem           = lds_data_d-InvoiceItem
                          Supplier              = lds_data_d-Supplier
                          SupplierName          = lds_data_d-SupplierName
                          Purchaseordercurrency = lds_data_d-Purchaseordercurrency ) )
        FAILED DATA(lds_failed_d)
        REPORTED DATA(lds_reported_d)
        MAPPED DATA(lds_mapped_d).

    IF lds_failed_d IS INITIAL.
      RETURN.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc__Invoice DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _Invoice RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _Invoice RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _Invoice RESULT result.

ENDCLASS.

CLASS lhc__Invoice IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
