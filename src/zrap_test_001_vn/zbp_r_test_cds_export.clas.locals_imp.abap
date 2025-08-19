CLASS lhc__export DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _export RESULT result.
    METHODS export FOR MODIFY
      IMPORTING keys FOR ACTION _export~export RESULT result.

ENDCLASS.

CLASS lhc__export IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD Export.

    TYPES: BEGIN OF ty_person,
             name TYPE string,
             age  TYPE string,
             city TYPE string,
           END OF ty_person.

    DATA:lt_persons TYPE TABLE OF ty_person.

    lt_persons = VALUE #(
      ( name = 'An'   age = 25 city = 'Hanoi' )
      ( name = 'Binh' age = 30 city = 'Saigon' )
    ).

    DATA: lv_txt TYPE string.

    FIELD-SYMBOLS <ls_person> TYPE ty_person.

    LOOP AT lt_persons ASSIGNING <ls_person>.
      CONCATENATE <ls_person>-name <ls_person>-age <ls_person>-city
        INTO DATA(lv_line) SEPARATED BY cl_abap_char_utilities=>horizontal_tab.
      IF lv_txt IS INITIAL.
        lv_txt = lv_line.
      ELSE.
        lv_txt = |{ lv_txt }{ cl_abap_char_utilities=>cr_lf }{ lv_line }|.
      ENDIF.
    ENDLOOP.

    DATA: lv_xstring TYPE xstring.

    lv_xstring = cl_abap_conv_codepage=>create_out( codepage = 'UTF-8' )->convert( lv_txt ).

    TYPES: BEGIN OF ty_download_result,
             value    TYPE xstring,
             filename TYPE string,
             mimetype TYPE string,
           END OF ty_download_result.


    APPEND VALUE #(
    attachmentuuid = keys[ 1 ]-AttachmentUuid
    %param         = VALUE #(
                      value    = '313531302C31353330303030312C37322C31302C323032343131312C39393939313233312C31303030302C4A50592C313531302C302C50432C312C31303030300D0A313531302C31353330303030312C37322C3132302C32303234313231312C39393939313233312C31303' &&
'030302C4A50592C313531302C302C50432C312C3'
                      filename = 'export.txt'
                      mimetype = 'text/csv'
                      )
    ) TO result .
  ENDMETHOD.

ENDCLASS.
