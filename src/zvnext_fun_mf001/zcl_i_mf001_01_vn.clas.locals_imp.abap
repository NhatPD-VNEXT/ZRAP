CLASS lhc__detail DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    TYPES: BEGIN OF gts_type,
             detail   TYPE STRUCTURE FOR READ RESULT zi_mf001_01_vn\\_detail,
             detail_t TYPE TABLE FOR READ RESULT zi_mf001_01_vn\\_detail,
             header   TYPE STRUCTURE FOR READ RESULT zi_mf001_01_vn\\_detail\_header.
    TYPES: END OF gts_type.

    METHODS createdata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~createdata.

    METHODS savedata FOR DETERMINE ON SAVE
      IMPORTING keys FOR _detail~savedata.

    METHODS deletedata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~deletedata.

    METHODS updatedata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _detail~updatedata.

    METHODS allocate_01 FOR MODIFY
      IMPORTING keys FOR ACTION _detail~allocate_01 RESULT result.

    METHODS allocate_02 FOR MODIFY
      IMPORTING keys FOR ACTION _detail~allocate_02 RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _detail RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _detail RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _detail RESULT result.

    METHODS delete_allocation_result
      IMPORTING if_referencedocument     TYPE  xblnr
                if_referencedocumentitem TYPE sysuuid_x16.

    METHODS allocate
      IMPORTING if_type   TYPE char2
                is_data_h TYPE gts_type-header
                is_data_d TYPE gts_type-detail.

    METHODS create_detail
      IMPORTING is_data_h TYPE gts_type-header
                is_data_d TYPE gts_type-detail
                it_data_d TYPE gts_type-detail_t.
ENDCLASS.

CLASS lhc__detail IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD createdata.

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        BY \_header
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_h)
        FAILED DATA(ldt_failed_h).

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_d)
        FAILED DATA(ldt_failed_d).

    CHECK ldt_data_h IS NOT INITIAL AND
          ldt_data_d IS NOT INITIAL.

    READ TABLE ldt_data_h INTO DATA(lds_data_h) INDEX 1.
    READ TABLE ldt_data_d ASSIGNING FIELD-SYMBOL(<lds_data_d>) INDEX 1.

    <lds_data_d>-supplier = lds_data_h-supplier.
    <lds_data_d>-supplierfullname = lds_data_h-supplierfullname.
    <lds_data_d>-purchaseordercurrency = lds_data_h-purchaseordercurrency.

    MODIFY ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        UPDATE
        FIELDS (
        supplier
        supplierfullname
        purchaseordercurrency  )
        WITH VALUE #( FOR lds_data_d IN ldt_data_d (
                      %tky                             = lds_data_d-%tky
                      supplier                         = lds_data_d-supplier
                      supplierfullname                 = lds_data_d-supplierfullname
                      purchaseordercurrency            = lds_data_d-purchaseordercurrency
                      %control-supplier                = if_abap_behv=>mk-on
                      %control-supplierfullname        = if_abap_behv=>mk-on
                      %control-purchaseordercurrency   = if_abap_behv=>mk-on
                      ) )
    REPORTED DATA(update_reported).

    "Set the changing parameter to update UI screen
    reported = CORRESPONDING #( DEEP update_reported ).

    SORT ldt_data_d BY materialdocument materialdocumentyear materialdocumentitem.
    "create data detail
    create_detail(
      is_data_h = lds_data_h
      is_data_d = <lds_data_d>
      it_data_d = ldt_data_d ).
  ENDMETHOD.

  METHOD savedata.
    CHECK sy-uname = 'CB9980000188'.

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        BY \_header
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_h)
        FAILED DATA(ldt_failed_h).

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_d)
        FAILED DATA(ldt_failed_d).

    CHECK ldt_data_h IS NOT INITIAL AND
          ldt_data_d IS NOT INITIAL.

    READ TABLE ldt_data_h INTO DATA(lds_data_h) INDEX 1.
    READ TABLE ldt_data_d ASSIGNING FIELD-SYMBOL(<lds_data_d>) INDEX 1.

    SORT ldt_data_d BY materialdocument materialdocumentyear materialdocumentitem.

*    "create data detail
*    create_detail(
*      is_data_h = lds_data_h
*      is_data_d = <lds_data_d>
*      it_data_d = ldt_data_d
*    ).
  ENDMETHOD.

  METHOD deletedata.

    LOOP AT keys INTO DATA(lds_key).
      delete_allocation_result(
        if_referencedocument     = lds_key-referencedocument
        if_referencedocumentitem = lds_key-referencedocumentitem
      ).
    ENDLOOP.
  ENDMETHOD.

  METHOD updatedata.

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        BY \_header
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_h)
        FAILED DATA(ldt_failed_h).

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_d)
        FAILED DATA(ldt_failed_d).

    CHECK ldt_data_h IS NOT INITIAL AND
          ldt_data_d IS NOT INITIAL.

    READ TABLE ldt_data_h INTO DATA(lds_data_h) INDEX 1.
    READ TABLE ldt_data_d ASSIGNING FIELD-SYMBOL(<lds_data_d>) INDEX 1.

    SORT ldt_data_d BY materialdocument materialdocumentyear materialdocumentitem.
    "create data detail
    create_detail(
      is_data_h = lds_data_h
      is_data_d = <lds_data_d>
      it_data_d = ldt_data_d ).
  ENDMETHOD.

  METHOD allocate_01.

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_d)
        FAILED DATA(ldt_failed_d).

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        BY \_header
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_h)
        FAILED DATA(ldt_failed_h).

    CHECK ldt_data_h IS NOT INITIAL AND
          ldt_data_d IS NOT INITIAL.

    READ TABLE ldt_data_h INTO DATA(lds_data_h) INDEX 1.
    READ TABLE ldt_data_d INTO DATA(lds_data_d) INDEX 1.

    "allocate quantity
    allocate(
      if_type   = '01' "quantity
      is_data_h = lds_data_h
      is_data_d = lds_data_d
    ).
  ENDMETHOD.

  METHOD allocate_02.

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_d)
        FAILED DATA(ldt_failed_d).

    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
        ENTITY _detail
        BY \_header
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_data_h)
        FAILED DATA(ldt_failed_h).

    CHECK ldt_data_h IS NOT INITIAL AND
          ldt_data_d IS NOT INITIAL.

    READ TABLE ldt_data_h INTO DATA(lds_data_h) INDEX 1.
    READ TABLE ldt_data_d INTO DATA(lds_data_d) INDEX 1.

    "allocate amount
    allocate(
      if_type   = '02' "amount
      is_data_h = lds_data_h
      is_data_d = lds_data_d
    ).
  ENDMETHOD.

  METHOD get_global_authorizations.

  ENDMETHOD.

  METHOD delete_allocation_result.

    SELECT *
    FROM i_materialdocumentheader_2
    WHERE referencedocument = @if_referencedocument
    INTO TABLE @DATA(ldt_header).

    IF sy-subrc = 0.
      SORT ldt_header BY materialdocument materialdocumentyear.

      SELECT *
      FROM i_materialdocumentitem_2
      FOR ALL ENTRIES IN @ldt_header
      WHERE materialdocument = @ldt_header-materialdocument
        AND materialdocumentyear = @ldt_header-materialdocumentyear
      INTO TABLE @DATA(ldt_item).

      IF sy-subrc = 0.
        SORT ldt_item BY materialdocumentyear materialdocument materialdocumentitem.
      ENDIF.
    ENDIF.

    LOOP AT ldt_item INTO DATA(lds_item).
      MODIFY ENTITIES OF zr_mf001_07_vn
          ENTITY _zmf001t_03
          DELETE FROM VALUE #( ( referencedocumentitem = if_referencedocumentitem
                                 materialdocument = lds_item-materialdocument
                                 materialdocumentitem = lds_item-materialdocumentitem
                                 materialdocumentyear = lds_item-materialdocumentyear
                             ) )
          FAILED DATA(ldt_failed_del).
    ENDLOOP.
  ENDMETHOD.

  METHOD allocate.

    SELECT *
    FROM i_materialdocumentheader_2
    WHERE referencedocument = @is_data_d-referencedocument
    INTO TABLE @DATA(ldt_header).

    IF sy-subrc = 0.
      SORT ldt_header BY materialdocument materialdocumentyear.

      SELECT *
      FROM i_materialdocumentitem_2
      FOR ALL ENTRIES IN @ldt_header
      WHERE materialdocument = @ldt_header-materialdocument
        AND materialdocumentyear = @ldt_header-materialdocumentyear
      INTO TABLE @DATA(ldt_item).

      IF sy-subrc = 0.
        SORT ldt_item BY materialdocumentyear materialdocument materialdocumentitem.
      ENDIF.
    ENDIF.

    CASE if_type.
      WHEN '01'.
        "allocate quantity
        DATA(ldf_quantity_sum) =
            REDUCE menge_d( INIT q = CONV menge_d( 0 )
                            FOR wa IN ldt_item
                            NEXT q = q + wa-quantityinentryunit ).
      WHEN '02'.
        "allocate amount
        DATA(ldf_amount_sum) =
            REDUCE dmbtr( INIT a = CONV dmbtr( 0 )
                            FOR wa IN ldt_item
                            NEXT a = a + wa-quantityinentryunit ).
      WHEN OTHERS.
    ENDCASE.

    delete_allocation_result(
      if_referencedocument     = is_data_d-referencedocument
      if_referencedocumentitem = is_data_d-referencedocumentitem
    ).

    DATA:
      ldf_amountexpense     TYPE p,
      ldf_amountexpense_sum TYPE p,
      ldt_zmf001t_03        TYPE TABLE FOR CREATE zr_mf001_07_vn\\_zmf001t_03.

    DATA(ldf_line) = lines( ldt_item ).

    LOOP AT ldt_item INTO DATA(lds_item).
      CLEAR: ldf_amountexpense.
      DATA(ldf_index) = sy-tabix.

      IF ldf_line = ldf_index.
        ldf_amountexpense = is_data_d-amountexpense - ldf_amountexpense_sum.
      ELSE.
        CASE if_type.
          WHEN '01'.
            IF ldf_quantity_sum <> 0.
              ldf_amountexpense = lds_item-quantityinentryunit / ldf_quantity_sum * is_data_d-amountexpense.
            ENDIF.
          WHEN '02'.
            IF ldf_amount_sum <> 0.
              ldf_amountexpense = lds_item-quantityinentryunit / ldf_amount_sum * is_data_d-amountexpense.
            ENDIF.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.

      ldf_amountexpense_sum = ldf_amountexpense_sum + ldf_amountexpense.

      APPEND VALUE #(
          %cid                        = |CREATE_{ ldf_index }|
          materialdocumentyear        = lds_item-materialdocumentyear
          materialdocument            = lds_item-materialdocument
          materialdocumentitem        = lds_item-materialdocumentitem
          referencedocumentitem       = is_data_d-referencedocumentitem
          referencedocument           = is_data_d-referencedocument
          deliverydocument            = lds_item-deliverydocument
          deliverydocumentitem        = lds_item-deliverydocumentitem
          companycode                 = lds_item-companycode
          material                    = lds_item-material
          quantityinentryunit         = lds_item-quantityinentryunit
          entryunit                   = lds_item-entryunit
          zzvcdid                     = is_data_d-zzvcdid
          zzvctxt                     = is_data_d-zzvctxt
          totalgoodsmvtamtincccrcy    = lds_item-totalgoodsmvtamtincccrcy
          companycodecurrency         = lds_item-companycodecurrency
          purchaseordercurrency       = is_data_h-purchaseordercurrency
          amountexpense               = ldf_amountexpense
      ) TO ldt_zmf001t_03.
    ENDLOOP.

    MODIFY ENTITIES OF zr_mf001_07_vn
        ENTITY _zmf001t_03
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
            materialdescription
            entryunit
            quantityinentryunit
            zzvcdid
            zzvctxt
            totalgoodsmvtamtincccrcy
            companycodecurrency
            purchaseordercurrency
            amountexpense
        )
        WITH ldt_zmf001t_03
        FAILED DATA(lds_failed_d_crt)
        REPORTED DATA(lds_reported_d_crt)
        MAPPED DATA(lds_mapped_d_crt).
  ENDMETHOD.

  METHOD create_detail.

    SELECT *
    FROM i_materialdocumentheader_2
    WHERE referencedocument = @is_data_h-referencedocument
    INTO TABLE @DATA(ldt_header).

    IF sy-subrc = 0.
      SORT ldt_header BY materialdocument materialdocumentyear.

      SELECT *
      FROM i_materialdocumentitem_2
      FOR ALL ENTRIES IN @ldt_header
      WHERE materialdocument = @ldt_header-materialdocument
        AND materialdocumentyear = @ldt_header-materialdocumentyear
      INTO TABLE @DATA(ldt_item).
    ENDIF.

    DATA:
      lds_data_cre     TYPE STRUCTURE FOR READ RESULT zi_mf001_01_vn\\_detail,
      lds_zmf001t_04_h TYPE STRUCTURE FOR READ RESULT zi_mf001_01_vn\\_header.

    LOOP AT ldt_item INTO DATA(lds_item).

      READ TABLE it_data_d TRANSPORTING NO FIELDS
         WITH KEY materialdocument     = lds_item-materialdocument
                  materialdocumentyear = lds_item-materialdocumentyear
                  materialdocumentitem = lds_item-materialdocumentitem
                  BINARY SEARCH.
      IF sy-subrc = 0.
        CONTINUE.
      ENDIF.

      CLEAR: lds_data_cre.
      MOVE-CORRESPONDING is_data_d TO lds_data_cre.

      lds_data_cre-materialdocument     = lds_item-materialdocument.
      lds_data_cre-materialdocumentitem = lds_item-materialdocumentitem.
      lds_data_cre-materialdocumentyear = lds_item-materialdocumentyear.

      MODIFY ENTITIES OF zr_mf001_06_vn
          ENTITY _zmf001t_02
          CREATE
          FIELDS (
              referencedocument
              referencedocumentitem
              materialdocument
              materialdocumentitem
              materialdocumentyear
              zzvcdid
              zzvctxt
              supplier
              supplierfullname
              purchaseordercurrency
              amountexpense
              taxcode
              headertext
              itemtext
          )
          WITH VALUE #( (
*                        %is_draft                   = lds_data_cre-%is_draft
                        %cid                        = |CREATE_{ sy-index }|
                        referencedocument           = lds_data_cre-referencedocument
                        referencedocumentitem       = lds_data_cre-referencedocumentitem
                        materialdocument            = lds_data_cre-materialdocument
                        materialdocumentyear        = lds_data_cre-materialdocumentyear
                        materialdocumentitem        = lds_data_cre-materialdocumentitem
                        zzvcdid                     = lds_data_cre-zzvcdid
                        zzvctxt                     = lds_data_cre-zzvctxt
                        supplier                    = lds_data_cre-supplier
                        supplierfullname            = lds_data_cre-supplierfullname
                        purchaseordercurrency       = lds_data_cre-purchaseordercurrency
                        amountexpense               = lds_data_cre-amountexpense
                        taxcode                     = lds_data_cre-taxcode
                        headertext                  = lds_data_cre-headertext
                        itemtext                    = lds_data_cre-itemtext
                        ) )
          FAILED DATA(lds_failed_d_crt)
          REPORTED DATA(lds_reported_d_crt)
          MAPPED DATA(lds_mapped_d_crt).

      MOVE-CORRESPONDING is_data_h TO lds_zmf001t_04_h.
      MOVE-CORRESPONDING lds_item TO lds_zmf001t_04_h.

*      "create zmf001t_04
      SELECT SINGLE * FROM zmf001t_04
        WHERE materialdocument = @lds_zmf001t_04_h-materialdocument
          AND materialdocumentitem = @lds_zmf001t_04_h-materialdocumentitem
          AND materialdocumentyear = @lds_zmf001t_04_h-materialdocumentyear
          INTO @DATA(lds_mf001t_04).

      IF sy-subrc <> 0.
        DATA(lo_process_parallel) = NEW zcl_mf001_04_vn(  ).
        lo_process_parallel->save_zmf001t_04( is_input = lds_zmf001t_04_h ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zi_mf001_01_vn DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR _header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_mf001_01_vn RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_mf001_01_vn RESULT result.
    METHODS validateall FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_mf001_01_vn~validateall.
*    METHODS lock FOR LOCK
*      IMPORTING keys FOR LOCK _header.
    METHODS createdata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _header~createdata.
    METHODS updatedata FOR DETERMINE ON MODIFY
      IMPORTING keys FOR _header~updatedata.
    METHODS savedata FOR DETERMINE ON SAVE
      IMPORTING keys FOR _header~savedata.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _header RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK _header.
ENDCLASS.

CLASS lhc_zi_mf001_01_vn IMPLEMENTATION.

*  METHOD get_instance_features.
*    CHECK sy-uname = 'CB9980000188'.
*
*    DATA(lo_process_parallel) = NEW zcl_mf001_04_vn(  ).
*    DATA(lo_process_parallel_d) = NEW zcl_mf001_04_d_vn(  ).
*
*    READ ENTITIES OF zi_mf001_01_vn IN LOCAL MODE
*        ENTITY _header
*        ALL FIELDS
*        WITH CORRESPONDING #( keys )
*        RESULT DATA(ldt_data_h)
*        FAILED DATA(ldt_failed_h)
*        REPORTED DATA(ldt_reported_h).
*
*    IF ldt_failed_h IS NOT INITIAL.
*      RETURN.
*    ENDIF.
*
*    READ TABLE ldt_data_h INTO DATA(lds_data_h) INDEX 1.
*
*    SELECT *
*    FROM i_materialdocumentheader_2
*    WHERE referencedocument = @lds_data_h-referencedocument
*    INTO TABLE @DATA(ldt_header).
*
*    IF sy-subrc = 0.
*      SORT ldt_header BY materialdocument materialdocumentyear.
*
*      SELECT *
*      FROM i_materialdocumentitem_2
*      FOR ALL ENTRIES IN @ldt_header
*      WHERE materialdocument = @ldt_header-materialdocument
*        AND materialdocumentyear = @ldt_header-materialdocumentyear
*      INTO TABLE @DATA(ldt_item).
*    ENDIF.
*
*    LOOP AT ldt_item INTO DATA(lds_item).
*
*      MOVE-CORRESPONDING lds_item TO lds_data_h.
*
*      READ TABLE ldt_data_h TRANSPORTING NO FIELDS
*          WITH KEY materialdocument = lds_item-materialdocument
*                   materialdocumentitem = lds_item-materialdocumentitem
*                   materialdocumentyear = lds_item-materialdocumentyear
*                   BINARY SEARCH.
*      IF sy-subrc <> 0.
**      "create zmf001t_04_d
*        SELECT SINGLE * FROM zmf001t_04_d
*          WHERE materialdocument = @lds_item-materialdocument
*            AND materialdocumentitem = @lds_item-materialdocumentitem
*            AND materialdocumentyear = @lds_item-materialdocumentyear
*            INTO @DATA(lds_mf001t_04_d).
*
*        IF sy-subrc <> 0.
*          lo_process_parallel_d->save_zmf001t_04_d( is_input = lds_data_h ).
*        ENDIF.
*      ENDIF.
*
*      "create zmf001t_04
**      SELECT SINGLE * FROM zmf001t_04
**        WHERE materialdocument = @lds_item-materialdocument
**          AND materialdocumentitem = @lds_item-materialdocumentitem
**          AND materialdocumentyear = @lds_item-materialdocumentyear
**          INTO @DATA(lds_mf001t_04).
**      IF sy-subrc <> 0.
**        lo_process_parallel->save_zmf001t_04( is_input = lds_data_h ).
**      ENDIF.
*    ENDLOOP.
*
*  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateall.
  ENDMETHOD.

*  METHOD lock.
*  ENDMETHOD.

  METHOD createdata.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.

  METHOD updatedata.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.

  METHOD savedata.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_mf001_01_vn DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zi_mf001_01_vn IMPLEMENTATION.

  METHOD cleanup_finalize.
  ENDMETHOD.

  METHOD save_modified.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.

ENDCLASS.
