CLASS zcl_enh_inbound_delivery DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_le_shp_modify_head .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ENH_INBOUND_DELIVERY IMPLEMENTATION.


  METHOD if_le_shp_modify_head~modify_fields.

    CHECK sy-uname = 'CB9980000188'.
    MOVE-CORRESPONDING delivery_document_in TO delivery_document_out.

    " Set the delivery document number to a specific value if it is empty
    IF delivery_document_in-deliverydocumentbysupplier IS INITIAL.
      delivery_document_out-deliverydocumentbysupplier = '1234567890'.
    ENDIF.

    delivery_document_out-billoflading = '123abc'.                      "船荷証券
    delivery_document_out-goodsissueorreceiptslipnumber = '11111'.      "入出庫票

  ENDMETHOD.
ENDCLASS.
