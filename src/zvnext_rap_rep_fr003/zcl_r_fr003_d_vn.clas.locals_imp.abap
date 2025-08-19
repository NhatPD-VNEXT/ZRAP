CLASS lhc__detail DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _detail RESULT result.
*    METHODS edit FOR MODIFY
*      IMPORTING keys FOR ACTION _detail~edit.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _detail RESULT result.
    METHODS edit FOR MODIFY
      IMPORTING keys FOR ACTION _detail~edit RESULT result.

ENDCLASS.

CLASS lhc__detail IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
    "Read entities selected from list page
    READ ENTITIES OF zr_fr003_d_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_detail)
        FAILED DATA(ldt_failed)
        REPORTED DATA(ldt_reported).

    IF ldt_failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_detail ASSIGNING FIELD-SYMBOL(<lds_detail>) INDEX 1.
    CHECK sy-subrc = 0.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #(
           %tky = key-%tky
           %action-edit      = COND #( WHEN <lds_detail>-accountingdocument IS INITIAL
                               THEN if_abap_behv=>fc-o-enabled
                               ELSE if_abap_behv=>fc-o-disabled )
                     ) TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD edit.
    "Read entities selected from list page detail
    READ ENTITIES OF zr_fr003_d_vn IN LOCAL MODE
        ENTITY _detail
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT DATA(ldt_detail)
        FAILED DATA(ldt_failed)
        REPORTED DATA(ldt_reported).

    IF ldt_failed IS NOT INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_detail INTO DATA(lds_detail) INDEX 1.
    CHECK sy-subrc = 0 AND lds_detail-accountingdocument IS INITIAL.

    MODIFY ENTITIES OF zr_fr003_d_vn
        ENTITY _detail
        UPDATE
        FIELDS ( postingdate glaccount )
        WITH VALUE #( ( keyuuid            = lds_detail-keyuuid
                       postingdate         = keys[ %tky = lds_detail-%tky ]-%param-postingdate
                       glaccount           = keys[ %tky = lds_detail-%tky ]-%param-glaccount
                      ) )
        FAILED DATA(ldt_failed_d)
        REPORTED DATA(ldt_reported_d)
        MAPPED DATA(ldt_mapped_d).

    "Setting message failed
    IF ldt_failed_d IS NOT INITIAL.
      APPEND VALUE #(
          %tky = lds_detail-%tky
      ) TO failed-_detail.

      DO 23 TIMES.
        APPEND VALUE #(
            %tky = lds_detail-%tky
            %msg = new_message_with_text(
            severity = if_abap_behv_message=>severity-error
            text     = |{ lds_detail-postingdate }/{ lds_detail-glaccount } update failed 12321321321321321321312321321321|
            )
        ) TO reported-_detail.
      ENDDO.

    ELSE.
      DO 40 TIMES.
        APPEND VALUE #(
            %tky = lds_detail-%tky
            %msg = new_message_with_text(
            severity = if_abap_behv_message=>severity-success
            text     = |{ lds_detail-postingdate }/{ lds_detail-glaccount } update success 312321321321321321321321312321|
            )
        ) TO reported-_detail.
      ENDDO.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
