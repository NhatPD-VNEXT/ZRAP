CLASS zcl_get_data_f2335 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GET_DATA_F2335 IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA: ldt_data     TYPE STANDARD TABLE OF zc_f2335,
          ldf_timezone TYPE string.

    CHECK NOT it_original_data IS INITIAL.

    MOVE-CORRESPONDING it_original_data TO ldt_data.

    ldf_timezone = sy-tzone.
    LOOP AT ldt_data ASSIGNING FIELD-SYMBOL(<lds_data>).

      CONVERT DATE <lds_data>-mfgorderplannedstartdate TIME <lds_data>-mfgorderplannedstarttime
        INTO TIME STAMP <lds_data>-mfgorderplannedstartdatetime TIME ZONE 'UTC'.

      CONVERT DATE <lds_data>-mfgorderplannedenddate TIME <lds_data>-mfgorderplannedendtime
        INTO TIME STAMP <lds_data>-mfgorderplannedenddatetime TIME ZONE 'UTC'.

    ENDLOOP.

    MOVE-CORRESPONDING ldt_data TO ct_calculated_data.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    CHECK sy-subrc = 0.
  ENDMETHOD.
ENDCLASS.
