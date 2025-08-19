CLASS lhc_zi_mf002_02_vn DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES: BEGIN OF gts_type,
             detail TYPE STRUCTURE FOR READ RESULT zi_mf002_02_vn\\_detail.
    TYPES: END OF gts_type.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _detail RESULT result.

    METHODS createdata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~createdata.

    METHODS deletedata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~deletedata.

    METHODS allocate_01 FOR MODIFY
      IMPORTING keys FOR ACTION _detail~allocate_01.

    METHODS allocate_02 FOR MODIFY
      IMPORTING keys FOR ACTION _detail~allocate_02.

    METHODS allocate
      IMPORTING if_type   TYPE char2
                is_data_d TYPE gts_type-detail.

    METHODS delete_allocation_result
      IMPORTING if_referencedocumentitem TYPE sysuuid_x16.
ENDCLASS.


CLASS lhc_zi_mf002_02_vn IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD createdata.
    READ ENTITIES OF zi_mf002_02_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         " TODO: variable is assigned but never used (ABAP cleaner)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_data_d INTO DATA(lds_data_d) INDEX 1.

    " Invoice明細No
    SELECT MAX( zmf002t_02_vn~referencedocumentno )
      FROM zmf002t_02_vn
      WHERE ReferenceDocument = @lds_data_d-ReferenceDocument
      INTO @FINAL(ldf_referencedocumentno).

    IF sy-subrc = 0.
      lds_data_d-referencedocumentno = ldf_referencedocumentno + 10.
    ELSE.
      lds_data_d-referencedocumentno = '10'.
    ENDIF.

    CONDENSE lds_data_d-referencedocumentno NO-GAPS.

    " Convert Amount to input
    FINAL(ldf_amountexpense) = zcl_convt_amt_vn=>scale_amount_in( if_amountout = lds_data_d-amountexpense_num
                                                                  if_currency  = lds_data_d-purchaseordercurrency ).

    IF ldf_amountexpense <> lds_data_d-amountexpense.
      lds_data_d-amountexpense = ldf_amountexpense.
    ELSE.
      EXIT.
    ENDIF.

    MODIFY ENTITIES OF zi_mf002_02_vn IN LOCAL MODE
           ENTITY _detail
           UPDATE
           FIELDS ( amountexpense referencedocumentno )
           WITH VALUE #( ( referencedocumentitem = lds_data_d-referencedocumentitem " key
                           amountexpense         = lds_data_d-amountexpense
                           referencedocumentno   = lds_data_d-referencedocumentno ) )
           FAILED   FINAL(lds_failed_d)
           " TODO: variable is assigned but never used (ABAP cleaner)
           REPORTED FINAL(lds_reported_d)
           " TODO: variable is assigned but never used (ABAP cleaner)
           MAPPED   FINAL(lds_mapped_d).

    IF lds_failed_d IS NOT INITIAL.
      RETURN.
    ENDIF.

    " update status
    SELECT SINGLE * FROM zi_mf002_01_vn
      WHERE ReferenceDocument = @lds_data_d-ReferenceDocument
      INTO @FINAL(lds_mf002_01_vn).

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    zcl_mf002_update_vn=>save_log( if_referencedocument = lds_data_d-referencedocument
                                   if_creationdate      = lds_mf002_01_vn-creationdatelog
                                   if_postingdate       = lds_mf002_01_vn-postingdate
                                   if_status            = '01' ). " Not Started
  ENDMETHOD.

  METHOD allocate_01.
    READ ENTITIES OF zi_mf002_02_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         " TODO: variable is assigned but never used (ABAP cleaner)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_data_d INTO FINAL(lds_data_d) INDEX 1.

    " allocate quantity
    allocate( if_type   = '01' " quantity
              is_data_d = lds_data_d ).

    SELECT SINGLE * FROM zi_mf002_01_vn
      WHERE ReferenceDocument = @lds_data_d-ReferenceDocument
      INTO @FINAL(lds_mf002_01_vn).

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    " update status
    zcl_mf002_update_vn=>save_log( if_referencedocument = lds_data_d-ReferenceDocument
                                   if_creationdate      = lds_mf002_01_vn-creationdatelog
                                   if_postingdate       = lds_mf002_01_vn-postingdate
                                   if_status            = '02' ).
  ENDMETHOD.

  METHOD allocate_02.
    READ ENTITIES OF zi_mf002_02_vn IN LOCAL MODE
         ENTITY _detail
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT FINAL(ldt_data_d)
         " TODO: variable is assigned but never used (ABAP cleaner)
         FAILED FINAL(ldt_failed_d).

    IF ldt_data_d IS INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_data_d INTO FINAL(lds_data_d) INDEX 1.

    " allocate amount
    allocate( if_type   = '02' " amount
              is_data_d = lds_data_d ).

    SELECT SINGLE * FROM zi_mf002_01_vn
      WHERE ReferenceDocument = @lds_data_d-ReferenceDocument
      INTO @FINAL(lds_mf002_01_vn).

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    " update status
    zcl_mf002_update_vn=>save_log( if_referencedocument = lds_data_d-ReferenceDocument
                                   if_creationdate      = lds_mf002_01_vn-creationdatelog
                                   if_postingdate       = lds_mf002_01_vn-postingdate
                                   if_status            = '02' ).
  ENDMETHOD.

*  METHOD get_instance_features.
*
*  ENDMETHOD.

  METHOD allocate.
    DATA ldf_amountexpense     TYPE p LENGTH 8 DECIMALS 0.
    DATA ldf_amountexpense_sum TYPE p LENGTH 8 DECIMALS 0.
    DATA ldt_allocate          TYPE TABLE FOR CREATE zi_mf002_03_vn\\_allocate.

    SELECT * FROM I_MaterialDocumentHeader_2
      WHERE ReferenceDocument = @is_data_d-ReferenceDocument
      INTO TABLE @DATA(ldt_header).

    IF sy-subrc = 0.
      SORT ldt_header BY MaterialDocument
                         MaterialDocumentYear.

      SELECT * FROM I_MaterialDocumentItem_2
        FOR ALL ENTRIES IN @ldt_header
        WHERE MaterialDocument     = @ldt_header-MaterialDocument
          AND MaterialDocumentYear = @ldt_header-MaterialDocumentYear
        INTO TABLE @DATA(ldt_item).

      IF sy-subrc = 0.
        SORT ldt_item BY MaterialDocumentYear
                         MaterialDocument
                         MaterialDocumentItem.
      ENDIF.
    ENDIF.

    CASE if_type.
      WHEN '01'.
        " allocate quantity
        FINAL(ldf_quantity_sum) =
            REDUCE menge_d( INIT q = CONV menge_d( 0 )
                            FOR wa IN ldt_item
                            NEXT q = q + wa-QuantityInEntryUnit ).
      WHEN '02'.
        " allocate amount
        FINAL(ldf_amount_sum) =
            REDUCE dmbtr( INIT a = CONV dmbtr( 0 )
                            FOR wa IN ldt_item
                            NEXT a = a + wa-TotalGoodsMvtAmtInCCCrcy ).
      WHEN OTHERS.
    ENDCASE.

    delete_allocation_result( if_referencedocumentitem = is_data_d-referencedocumentitem ).

    FINAL(ldf_line) = lines( ldt_item ).

    LOOP AT ldt_item INTO FINAL(lds_item).
      CLEAR ldf_amountexpense.
      FINAL(ldf_index) = sy-tabix.

      IF ldf_line = ldf_index.
        ldf_amountexpense = is_data_d-amountexpense - ldf_amountexpense_sum.
      ELSE.
        CASE if_type.
          WHEN '01'.
            IF ldf_quantity_sum <> 0.
              ldf_amountexpense = lds_item-QuantityInEntryUnit / ldf_quantity_sum * is_data_d-amountexpense.
            ENDIF.
          WHEN '02'.
            IF ldf_amount_sum <> 0.
              ldf_amountexpense = lds_item-TotalGoodsMvtAmtInCCCrcy / ldf_amount_sum * is_data_d-amountexpense.
            ENDIF.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.

      ldf_amountexpense_sum += ldf_amountexpense.

      APPEND VALUE #( %cid                     = |CREATE_{ ldf_index }|
                      materialdocumentyear     = lds_item-MaterialDocumentYear
                      materialdocument         = lds_item-MaterialDocument
                      materialdocumentitem     = lds_item-MaterialDocumentItem
                      referencedocumentitem    = is_data_d-referencedocumentitem
                      referencedocument        = is_data_d-referencedocument
                      deliverydocument         = lds_item-DeliveryDocument
                      deliverydocumentitem     = lds_item-DeliveryDocumentItem
                      companycode              = lds_item-CompanyCode
                      material                 = lds_item-Material
                      quantityinentryunit      = lds_item-QuantityInEntryUnit
                      entryunit                = lds_item-EntryUnit
                      zzvcdid                  = is_data_d-zzvcdid
                      zzvctxt                  = is_data_d-zzvctxt
                      totalgoodsmvtamtincccrcy = lds_item-TotalGoodsMvtAmtInCCCrcy
                      companycodecurrency      = lds_item-CompanyCodeCurrency
                      purchaseordercurrency    = is_data_d-purchaseordercurrency
                      amountexpense            = ldf_amountexpense )
             TO ldt_allocate.
    ENDLOOP.

    MODIFY ENTITIES OF zi_mf002_03_vn
           ENTITY _allocate
           CREATE
           FIELDS (
               materialdocumentyear
               materialdocument
               materialdocumentitem
               referencedocumentitem
               referencedocument
               deliverydocument
               deliverydocumentitem
               companycode
               material
               entryunit
               quantityinentryunit
               zzvcdid
               zzvctxt
               totalgoodsmvtamtincccrcy
               companycodecurrency
               purchaseordercurrency
               amountexpense )
           WITH ldt_allocate
           " TODO: variable is assigned but never used (ABAP cleaner)
           FAILED FINAL(lds_failed_d_crt)
           " TODO: variable is assigned but never used (ABAP cleaner)
           REPORTED FINAL(lds_reported_d_crt)
           " TODO: variable is assigned but never used (ABAP cleaner)
           MAPPED FINAL(lds_mapped_d_crt).
  ENDMETHOD.

  METHOD delete_allocation_result.
    SELECT * FROM zmf002t_03_vn
      WHERE ReferenceDocumentItem = @if_referencedocumentitem
      INTO TABLE @FINAL(ldt_zmf002t_03_vn).

    LOOP AT ldt_zmf002t_03_vn INTO FINAL(lds_zmf002t_03_vn).
      MODIFY ENTITIES OF zi_mf002_03_vn
             ENTITY _allocate
             DELETE FROM VALUE #( ( ReferenceDocumentItem = lds_zmf002t_03_vn-ReferenceDocumentItem
                                    MaterialDocument      = lds_zmf002t_03_vn-MaterialDocument
                                    MaterialDocumentItem  = lds_zmf002t_03_vn-MaterialDocumentItem
                                    MaterialDocumentYear  = lds_zmf002t_03_vn-MaterialDocumentYear ) )
             " TODO: variable is assigned but never used (ABAP cleaner)
             FAILED FINAL(ldt_failed_del).
    ENDLOOP.
  ENDMETHOD.

  METHOD deletedata.
    LOOP AT keys INTO FINAL(lds_key).
      delete_allocation_result( if_referencedocumentitem = lds_key-ReferenceDocumentItem ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
