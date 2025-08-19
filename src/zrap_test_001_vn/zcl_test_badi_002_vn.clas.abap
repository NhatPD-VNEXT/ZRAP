CLASS zcl_test_badi_002_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_sd_sls_modify_head .
    INTERFACES if_sd_sls_modify_item .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_BADI_002_VN IMPLEMENTATION.


  METHOD if_sd_sls_modify_head~modify_fields.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD if_sd_sls_modify_item~modify_fields.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.
ENDCLASS.
