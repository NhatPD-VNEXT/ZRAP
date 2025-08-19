CLASS lhc_zi_mf002_01_vn DEFINITION INHERITING FROM cl_abap_behavior_handler.
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
    METHODS create1 FOR MODIFY
      IMPORTING keys FOR ACTION _header~create1.

ENDCLASS.

CLASS lhc_zi_mf002_01_vn IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
    READ TABLE entities INTO DATA(lds_entities) INDEX 1.
    CHECK sy-subrc = 0.

    "update status
    zcl_mf002_update_vn=>save_log(
      if_referencedocument = lds_entities-referencedocument
      if_creationdate      = lds_entities-creationdatelog
      if_postingdate       = lds_entities-postingdate
      if_status            = '' "Not Started
    ).

  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_detail.
  ENDMETHOD.

  METHOD cba_detail.

    READ TABLE entities_cba INTO DATA(lds_entities_cba) INDEX 1.
    CHECK sy-subrc = 0.


    "select data from zi_mf003_01_vn
    SELECT SINGLE *
    FROM zi_mf002_01_vn
    WHERE materialdocument = @lds_entities_cba-materialdocument
      AND materialdocumentitem = @lds_entities_cba-materialdocumentitem
      AND materialdocumentyear = @lds_entities_cba-materialdocumentyear
      AND referencedocument    = @lds_entities_cba-referencedocument
      INTO @DATA(lds_mf002_01_vn).

    MODIFY ENTITIES OF zi_mf002_02_vn
      ENTITY _detail
      CREATE
      FIELDS ( referencedocument
               zzvcdid
               zzvctxt
               supplier "comapany code
               supplierfullname
               purchaseordercurrency
               amountexpense_num
               taxcode "tax code
               headertext "header text
               itemtext )
      WITH VALUE #( FOR lds_target IN lds_entities_cba-%target (
                    %cid                  = |CREATE_{ sy-tabix }|
                    referencedocument     = lds_entities_cba-referencedocument
                    zzvcdid               = lds_target-zzvcdid
                    zzvctxt               = lds_target-zzvctxt
                    supplier              = lds_mf002_01_vn-supplier
                    supplierfullname      = lds_mf002_01_vn-supplierfullname
                    purchaseordercurrency = lds_mf002_01_vn-purchaseordercurrency
                    amountexpense_num     = lds_target-amountexpense_num
                    taxcode               = lds_target-taxcode
                    headertext            = lds_target-headertext
                    itemtext              = lds_target-itemtext ) )
      FAILED    DATA(lds_failed_d_crt)
      REPORTED  DATA(lds_reported_d_crt)
      MAPPED    DATA(lds_mapped_d_crt).

  ENDMETHOD.

  METHOD create1.

    " read the data from the travel instances to be copied
*    MODIFY ENTITIES OF zi_mf002_01_vn
*      ENTITY _header
*      CREATE
*      FIELDS ( referencedocument postingdate )
*      WITH VALUE #( ( %cid              = |CREATE_{ sy-tabix }|
*                      referencedocument = keys[ 1 ]-referencedocument ) )
*      FAILED    DATA(lds_failed_crt)
*      REPORTED  DATA(lds_reported_crt)
*      MAPPED    DATA(lds_mapped_crt).
*
*    mapped-_header   =  lds_mapped_crt-_header .
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_mf002_01_vn DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

    METHODS map_messages REDEFINITION.

ENDCLASS.

CLASS lsc_zi_mf002_01_vn IMPLEMENTATION.

  METHOD finalize.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD check_before_save.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD cleanup_finalize.
    CHECK sy-subrc = 0.
  ENDMETHOD.

  METHOD map_messages.
  ENDMETHOD.

ENDCLASS.
