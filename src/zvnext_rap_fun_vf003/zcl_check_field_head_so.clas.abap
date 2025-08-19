CLASS zcl_check_field_head_so DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_sd_sls_check_head .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CHECK_FIELD_HEAD_SO IMPLEMENTATION.


  METHOD if_sd_sls_check_head~check_fields.

    "fix user VNEXT
    CHECK sy-uname = 'CB9980000188'.

    IF salesdocument_extension-yy1_cus_valuehelp_sdh IS NOT INITIAL.

      SELECT SINGLE product
        FROM i_producttext WITH PRIVILEGED ACCESS
        WHERE language = @sy-langu
          AND product  = @salesdocument_extension-yy1_cus_valuehelp_sdh
        INTO @DATA(ldf_product).

      IF sy-subrc <> 0.

        MESSAGE e001(zrap_com_001_vn)
          INTO DATA(ldf_message).

        APPEND VALUE #( messagetype = 'E'
                        messagetext = ldf_message ) TO messages.
      ENDIF.
    ENDIF.

    "test code list
    IF   salesdocument_extension-yy1_test_code_list_sdh IS NOT INITIAL AND
       ( salesdocument_extension-yy1_test_code_list_sdh <> '101' OR
         salesdocument_extension-yy1_test_code_list_sdh <> '102' OR
         salesdocument_extension-yy1_test_code_list_sdh <> '103' ).

      MESSAGE e002(zrap_com_001_vn)
        INTO ldf_message.

      APPEND VALUE #( messagetype = 'E'
                      messagetext = ldf_message ) TO messages.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
