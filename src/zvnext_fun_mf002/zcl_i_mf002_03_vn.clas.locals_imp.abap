CLASS lhc_zi_mf002_03_vn DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_mf002_03_vn RESULT result.
    METHODS cancel FOR MODIFY
      IMPORTING keys FOR ACTION _allocate~cancel.

    METHODS create FOR MODIFY
      IMPORTING keys FOR ACTION _allocate~create.

ENDCLASS.

CLASS lhc_zi_mf002_03_vn IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD Cancel.
  ENDMETHOD.

  METHOD Create.

  ENDMETHOD.

ENDCLASS.
