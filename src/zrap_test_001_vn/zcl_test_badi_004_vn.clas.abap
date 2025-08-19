CLASS zcl_test_badi_004_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES j_3r_reginv_intf .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_BADI_004_VN IMPLEMENTATION.


  METHOD j_3r_reginv_intf~after_change_screen.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~check_authority.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~check_authority_action.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~get_reg_reversal.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~in_inv_select.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~match_reg_in.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~out_inv_select.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~update_link_data.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~update_prn.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~update_prn_2017.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~update_reg_in.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~update_reg_out.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~utdi_select_data.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD j_3r_reginv_intf~utdo_select_data.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.
ENDCLASS.
