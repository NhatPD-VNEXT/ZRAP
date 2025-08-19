CLASS lhc_ZI_MF007_01_VN DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_mf007_01_vn RESULT result.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zi_mf007_01_vn.

ENDCLASS.

CLASS lhc_ZI_MF007_01_VN IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA(ldt_entities) = entities.

    DELETE ldt_entities WHERE InvoiceId IS NOT INITIAL.


    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
*           ignore_buffer     =
            nr_range_nr       = '10'
            object            = 'ZNR_MF007'
*           quantity          =
*           subobject         =
*           toyear            =
          IMPORTING
            number            = DATA(ldf_number)
            returncode        = DATA(ldf_returncode)
            returned_quantity = DATA(ldf_returned_quantity)
        ).
      CATCH cx_number_ranges.
        "handle exception
    ENDTRY.

    DATA(ldf_curr_number) = ldf_number.

    LOOP AT ldt_entities INTO DATA(lds_entity).
      ldf_curr_number += 1.
      APPEND VALUE #( %cid      = lds_entity-%cid
                      invoiceId = ldf_curr_number )
      TO mapped-zi_mf007_01_vn.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
