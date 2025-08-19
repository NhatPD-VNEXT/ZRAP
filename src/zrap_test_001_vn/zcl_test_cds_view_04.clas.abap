CLASS zcl_test_cds_view_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_CDS_VIEW_04 IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA:
      ldt_result      TYPE STANDARD TABLE OF zi_test_cds_view_04.

    DATA(ldf_top) = io_request->get_paging( )->get_page_size( ).
    IF ldf_top < 0.
      ldf_top = 1.
    ENDIF.

    DATA(ldf_skip) = io_request->get_paging( )->get_offset( ).

    DATA(ldt_sort) = io_request->get_sort_elements( ).

    DATA : ldf_orderby TYPE string.
    LOOP AT ldt_sort INTO DATA(lds_sort).
      IF lds_sort-descending = abap_true.
        ldf_orderby = |'{ ldf_orderby } { lds_sort-element_name } DESCENDING '|.
      ELSE.
        ldf_orderby = |'{ ldf_orderby } { lds_sort-element_name } ASCENDING '|.
      ENDIF.
    ENDLOOP.

    IF ldf_orderby IS INITIAL.
      ldf_orderby = 'PurchaseOrder'.
    ENDIF.

    DATA(ldf_conditions) = io_request->get_filter( )->get_as_sql_string( ).

    SELECT
     FROM i_purchaseorderitemapi01
     FIELDS
     purchaseorder,
     purchaseorderitem,
     purchaseorderquantityunit,
     orderquantity
     WHERE (ldf_conditions)
     ORDER BY (ldf_orderby)
     INTO TABLE @DATA(ldt_data)
     UP TO @ldf_top ROWS OFFSET @ldf_skip.

    IF sy-subrc = 0.

      LOOP AT ldt_data INTO DATA(lds_data).
        APPEND INITIAL LINE TO ldt_result ASSIGNING FIELD-SYMBOL(<lds_result>).
        MOVE-CORRESPONDING lds_data TO <lds_result>.
      ENDLOOP.


*    IF io_request->is_total_numb_of_rec_requested( ).
*      io_response->set_total_number_of_records( lines( ldt_result ) ).
*      io_response->set_data( ldt_result ).
*    ENDIF.

      TRY.
          io_response->set_total_number_of_records( lines( ldt_result ) ).
          io_response->set_data( ldt_result ).
        CATCH cx_root INTO DATA(exception).
          DATA(exception_message) = cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ).
      ENDTRY.
    ENDIF.



  ENDMETHOD.
ENDCLASS.
