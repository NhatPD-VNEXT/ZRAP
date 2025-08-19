CLASS zcl_fr001_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FR001_VN IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA:
      ldt_result      TYPE STANDARD TABLE OF zi_fr001_vn.

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
      ldf_orderby = 'Companycode'.
    ENDIF.

    DATA(ldf_conditions) = io_request->get_filter( )->get_as_sql_string( ).

    SELECT
     FROM i_journalentryitem
     FIELDS
     companycode,
     fiscalyearperiod,
     accountingdocument,
     fiscalyear,
     offsettingaccount,
     glaccount,
     accountingdocumenttype,
     debitcreditcode,
     reversalreferencedocument,
     companycodecurrency,
     amountintransactioncurrency
     WHERE (ldf_conditions)
       AND ledger = '0L'
       AND glaccount = '0012561000'
     ORDER BY (ldf_orderby)
     INTO TABLE @DATA(ldt_journalentryitem)
     UP TO @ldf_top ROWS OFFSET @ldf_skip.

    LOOP AT ldt_journalentryitem INTO DATA(lds_journalentryitem).
      IF lds_journalentryitem-reversalreferencedocument IS NOT INITIAL.
        CONTINUE.
      ENDIF.
      APPEND INITIAL LINE TO ldt_result ASSIGNING FIELD-SYMBOL(<lds_result>).
      MOVE-CORRESPONDING lds_journalentryitem TO <lds_result>.

      "get taxcode, costcenter
      SELECT SINGLE
      taxcode,
      costcenter
        FROM i_journalentryitem
        WHERE companycode = @<lds_result>-companycode
          AND fiscalyear  = @<lds_result>-fiscalyear
          AND accountingdocument = @<lds_result>-accountingdocument
          AND glaccount   = @<lds_result>-offsettingaccount
          AND ledger = '0L'
        INTO ( @<lds_result>-taxcode, @<lds_result>-costcenter ).

      "Allocated months
      <lds_result>-allocatedmonths = '12'.
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
