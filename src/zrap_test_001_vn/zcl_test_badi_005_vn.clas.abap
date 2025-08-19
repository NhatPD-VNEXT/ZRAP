CLASS zcl_test_badi_005_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_le_shp_modify_head .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_BADI_005_VN IMPLEMENTATION.


  METHOD if_le_shp_modify_head~modify_fields.
*    CHECK sy-uname = 'CB9980000188'.
*    MOVE-CORRESPONDING delivery_document_in TO delivery_document_out.
*    IF delivery_document_in-deliverydocumentbysupplier IS INITIAL.
*      delivery_document_out-deliverydocumentbysupplier = '1234567890'.
*    ENDIF.
  ENDMETHOD.
ENDCLASS.
