CLASS zcl_cus_vh_so_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CUS_VH_SO_VN IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA:
      ldt_result      TYPE STANDARD TABLE OF zi_cus_vh_so_vn.

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
      ldf_orderby = 'PRODUCT'.
    ENDIF.

    DATA(ldf_conditions) = io_request->get_filter( )->get_as_sql_string( ).

    DATA(ldt_param) = io_request->get_parameters(  ).

    LOOP AT ldt_param INTO DATA(lds_param).

*      IF lds_param-parameter_name = 'P_PRODUCT'.
*        DATA(ldf_product) = lds_param-value.
**      ELSEIF lds_param-parameter_name = 'P_VKORG'.
**
**        DATA(ldf_vkorg) = lds_param-value.
*      ENDIF.

      CASE lds_param-parameter_name.
        WHEN 'P_PRODUCT'.
          DATA(ldf_product) = lds_param-value.
        WHEN 'P_VKORG'.
          DATA(ldf_vkorg) = lds_param-value.
        WHEN OTHERS.
      ENDCASE.

    ENDLOOP.

    SELECT
     FROM i_producttext
     FIELDS
     product,
     productname
     WHERE language = @sy-langu
*       AND (ldf_conditions)
       AND product = @ldf_product
       AND ProductName  = @ldf_vkorg
     ORDER BY (ldf_orderby)
     INTO TABLE @DATA(ldt_producttext)
     UP TO @ldf_top ROWS OFFSET @ldf_skip.

    LOOP AT ldt_producttext INTO DATA(lds_producttext).
      APPEND INITIAL LINE TO ldt_result ASSIGNING FIELD-SYMBOL(<lds_result>).
      <lds_result>-product     = |{  lds_producttext-product ALPHA = OUT }|.
      <lds_result>-productname = lds_producttext-productname.
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

  ENDMETHOD.
ENDCLASS.
