CLASS zcl_test_badi_001_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mmpur_po_output_item_ext .
    INTERFACES if_ex_mmpur_final_check_po .
    INTERFACES if_mm_pur_s4_po_mod_deliv_addr.
    INTERFACES if_mm_pur_s4_po_modify_item.
    INTERFACES if_mm_pur_s4_po_post.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_BADI_001_VN IMPLEMENTATION.


  METHOD if_ex_mmpur_final_check_po~check.
    CHECK sy-uname = 'CB9980000188'.


  ENDMETHOD.


  METHOD if_mmpur_po_output_item_ext~enrich_po_output.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD if_mm_pur_s4_po_modify_item~modify_item.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD if_mm_pur_s4_po_mod_deliv_addr~modify_delivery_address.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.


  METHOD if_mm_pur_s4_po_post~post.
    CHECK sy-uname = 'CB9980000188'.
  ENDMETHOD.
ENDCLASS.
