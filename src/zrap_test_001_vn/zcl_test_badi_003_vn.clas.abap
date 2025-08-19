    CLASS zcl_test_badi_003_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

      PUBLIC SECTION.

        INTERFACES if_badi_interface .
        INTERFACES if_mm_pur_s4_pr_modify_item .
        INTERFACES if_mm_pur_s4_pr_post .
      PROTECTED SECTION.
      PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_BADI_003_VN IMPLEMENTATION.


      METHOD if_mm_pur_s4_pr_modify_item~modify_item.
      ENDMETHOD.


      METHOD if_mm_pur_s4_pr_post~post.

        CHECK sy-uname = 'CB9980000188'.
      ENDMETHOD.
ENDCLASS.
