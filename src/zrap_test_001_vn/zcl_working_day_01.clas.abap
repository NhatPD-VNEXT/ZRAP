CLASS zcl_working_day_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_WORKING_DAY_01 IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA: ldt_data TYPE STANDARD TABLE OF zi_test_cds_view_01.

    CHECK NOT it_original_data IS INITIAL.
    MOVE-CORRESPONDING it_original_data TO ldt_data.

    LOOP AT ldt_data ASSIGNING FIELD-SYMBOL(<lds_data>).
      TRY.
          DATA(lo_fcal_runtime) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( iv_factorycalendar_id = 'Z_JP' ).
          lo_fcal_runtime->is_date_workingday(
            EXPORTING  iv_date       = <lds_data>-calendardate
            RECEIVING  rv_workingday = DATA(ldf_check)
          ).
        CATCH cx_fhc_runtime INTO DATA(lo_error).
          " Xử lý exception nếu cần
      ENDTRY.

      CHECK ldf_check = abap_true.
      <lds_data>-checkworkingdate = abap_true.
    ENDLOOP.
    MOVE-CORRESPONDING ldt_data TO ct_calculated_data.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.
ENDCLASS.
