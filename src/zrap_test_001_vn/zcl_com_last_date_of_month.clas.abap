CLASS zcl_com_last_date_of_month DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    CLASS-METHODS get_last_day
      IMPORTING if_date            TYPE datum
      RETURNING VALUE(if_last_day) TYPE datum.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_COM_LAST_DATE_OF_MONTH IMPLEMENTATION.


  METHOD get_last_day.
    DATA: ldf_year             TYPE n LENGTH 4,
          ldf_month            TYPE n LENGTH 2,
          ldf_next_month       TYPE n LENGTH 2,
          ldf_next_year        TYPE n LENGTH 4,
          ldf_first_next_month TYPE datum.

    " Extract year and month from the input date
    " helo
    ldf_year  = if_date+0(4).
    ldf_month = if_date+4(2).

    " Determine the next month
    IF ldf_month = 12.
      ldf_next_month = 1.
      ldf_next_year  = ldf_year + 1.
    ELSE.
      ldf_next_month = ldf_month + 1.
      ldf_next_year  = ldf_year.
    ENDIF.

    " Construct the first day of the next month
    ldf_first_next_month = |{ ldf_next_year }{ ldf_next_month }{ '01' }|.

    " Get the last day of the current month by subtracting 1 day
    if_last_day = ldf_first_next_month - 1.

  ENDMETHOD.
ENDCLASS.
