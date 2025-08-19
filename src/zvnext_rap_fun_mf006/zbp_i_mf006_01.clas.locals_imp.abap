CLASS lhc__header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _header RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE _header.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE _header.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE _header.

    METHODS read FOR READ
      IMPORTING keys FOR READ _header RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK _header.

    METHODS rba_detail FOR READ
      IMPORTING keys_rba FOR READ _header\_detail FULL result_requested RESULT result LINK association_links.

    METHODS cba_detail FOR MODIFY
      IMPORTING entities_cba FOR CREATE _header\_detail.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _header RESULT result.

ENDCLASS.

CLASS lhc__header IMPLEMENTATION.

  METHOD get_instance_authorizations.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD create.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD update.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD delete.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD read.

    SELECT *
    FROM zi_mf006_05
    FOR ALL ENTRIES IN @keys
    WHERE referencedocument = @keys-referencedocument
    INTO TABLE @DATA(ldt_item).

    CHECK sy-subrc = 0.

    SELECT *
       FROM zi_mf006_01
       FOR ALL ENTRIES IN @ldt_item
       WHERE materialdocument = @ldt_item-materialdocument
         AND materialdocumentyear = @ldt_item-materialdocumentyear
         AND materialdocumentitem = @ldt_item-materialdocumentitem
       INTO TABLE @DATA(ldt_data).

    MOVE-CORRESPONDING ldt_data TO result.

*    MODIFY ENTITIES OF zi_mf006_01
*    ENTITY _header
*    CREATE
*    FIELDS (
*        materialdocument
*        materialdocumentyear
*        materialdocumentitem
*        referencedocument
*        creationdate
*        creationtime
*        supplierfullname
*        purchaseordercurrency
*        supplier
*        quantityinentryunit
*        entryunit
*        companycodecurrency
*        companycode
*        material
*    )
*    WITH VALUE #( FOR lds_data IN ldt_data (
*                  %cid                  = |CREATE_{ sy-tabix }|
*                  %is_draft             = keys[ 1 ]-%is_draft
*                  materialdocument      = lds_data-materialdocument
*                  materialdocumentyear  = lds_data-materialdocumentyear
*                  materialdocumentitem  = lds_data-materialdocumentitem
*                  referencedocument     = lds_data-referencedocument
*                  creationdate          = lds_data-creationdate
*                  creationtime          = lds_data-creationtime
*                  supplierfullname      = lds_data-supplierfullname
*                  purchaseordercurrency = lds_data-purchaseordercurrency
*                  supplier              = lds_data-supplier
*                  quantityinentryunit   = lds_data-quantityinentryunit
*                  entryunit             = lds_data-entryunit
*                  companycodecurrency   = lds_data-companycodecurrency
*                  companycode           = lds_data-companycode
*                  material              = lds_data-material
*                  ) )
*    FAILED DATA(lds_failed_d_crt)
*    REPORTED DATA(lds_reported_d_crt)
*    MAPPED DATA(lds_mapped_d_crt).
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_detail.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD cba_detail.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD get_instance_features.
    CHECK sy-subrc = 0.

    SELECT *
    FROM zi_mf006_05
    FOR ALL ENTRIES IN @keys
    WHERE referencedocument = @keys-referencedocument
    INTO TABLE @DATA(ldt_item).

    CHECK sy-subrc = 0.

    SELECT *
       FROM zi_mf006_01
       FOR ALL ENTRIES IN @ldt_item
       WHERE materialdocument = @ldt_item-materialdocument
         AND materialdocumentyear = @ldt_item-materialdocumentyear
         AND materialdocumentitem = @ldt_item-materialdocumentitem
       INTO TABLE @DATA(ldt_data).

    MOVE-CORRESPONDING ldt_data TO result.

    MODIFY ENTITIES OF zi_mf006_01
    ENTITY _header
    CREATE
    FIELDS (
        materialdocument
        materialdocumentyear
        materialdocumentitem
        referencedocument
        creationdate
        creationtime
        supplierfullname
        purchaseordercurrency
        supplier
        quantityinentryunit
        entryunit
        companycodecurrency
        companycode
        material
    )
    WITH VALUE #( FOR lds_data IN ldt_data (
                  %cid                  = |CREATE_{ sy-tabix }|
                  %is_draft             = keys[ 1 ]-%is_draft
                  materialdocument      = lds_data-materialdocument
                  materialdocumentyear  = lds_data-materialdocumentyear
                  materialdocumentitem  = lds_data-materialdocumentitem
                  referencedocument     = lds_data-referencedocument
                  creationdate          = lds_data-creationdate
                  creationtime          = lds_data-creationtime
                  supplierfullname      = lds_data-supplierfullname
                  purchaseordercurrency = lds_data-purchaseordercurrency
                  supplier              = lds_data-supplier
                  quantityinentryunit   = lds_data-quantityinentryunit
                  entryunit             = lds_data-entryunit
                  companycodecurrency   = lds_data-companycodecurrency
                  companycode           = lds_data-companycode
                  material              = lds_data-material
                  ) )
    FAILED DATA(lds_failed_d_crt)
    REPORTED DATA(lds_reported_d_crt)
    MAPPED DATA(lds_mapped_d_crt).
  ENDMETHOD.

ENDCLASS.

CLASS lhc__detail DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE _detail.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE _detail.

    METHODS read FOR READ
      IMPORTING keys FOR READ _detail RESULT result.

    METHODS rba_header FOR READ
      IMPORTING keys_rba FOR READ _detail\_header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc__detail IMPLEMENTATION.

  METHOD update.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD delete.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD read.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD rba_header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_mf006_01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_mf006_01 IMPLEMENTATION.

  METHOD finalize.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD check_before_save.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD save.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD cleanup.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD cleanup_finalize.
    CHECK sy-subrc = 0.
  ENDMETHOD.

ENDCLASS.
