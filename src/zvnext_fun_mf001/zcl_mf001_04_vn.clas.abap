CLASS zcl_mf001_04_vn DEFINITION
  PUBLIC
  INHERITING FROM cl_abap_parallel
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF gts_type,
             header TYPE STRUCTURE FOR READ RESULT zi_mf001_01_vn\\_header.
    TYPES: END OF gts_type.

    METHODS do REDEFINITION.
    METHODS save_zmf001t_04
      IMPORTING
        is_input TYPE gts_type-header.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MF001_04_VN IMPLEMENTATION.


  METHOD do.

    DATA: lds_mf001t_04 TYPE STRUCTURE FOR READ RESULT zi_mf001_01_vn\\_header.

    "Get parameter from buffer
    IMPORT param_input = lds_mf001t_04 FROM DATA BUFFER p_in.

    MODIFY ENTITIES OF zr_mf001_03_vn
        ENTITY _header
        DELETE FROM VALUE #( ( %is_draft            = '01'
                               referencedocument    = lds_mf001t_04-referencedocument
                               materialdocument     = lds_mf001t_04-materialdocument
                               materialdocumentitem = lds_mf001t_04-materialdocumentitem
                               materialdocumentyear = lds_mf001t_04-materialdocumentyear
                           ) )
        FAILED DATA(ldt_failed_del)
        REPORTED DATA(ldt_reported_del).

    MODIFY ENTITIES OF zr_mf001_03_vn
      ENTITY _header
      CREATE
      FIELDS (
          materialdocumentyear
          materialdocument
          materialdocumentitem
          referencedocument
          material
          supplier
          supplierfullname
          entryunit
          quantityinentryunit
          totalgoodsmvtamtincccrcy
          companycodecurrency
          deliverydocument
          deliverydocumentitem
          companycode
          createdbyuser
          creationdate
          creationtime
          postingdate
          purchaseordercurrency
          status
      )
      WITH VALUE #(
        (
          %cid                        = |CREATE_{ sy-index }|
          materialdocumentyear        = lds_mf001t_04-materialdocumentyear
          materialdocument            = lds_mf001t_04-materialdocument
          materialdocumentitem        = lds_mf001t_04-materialdocumentitem
          referencedocument           = lds_mf001t_04-referencedocument
          material                    = lds_mf001t_04-material
          supplier                    = lds_mf001t_04-supplier
          supplierfullname            = lds_mf001t_04-supplierfullname
          entryunit                   = lds_mf001t_04-entryunit
          quantityinentryunit         = lds_mf001t_04-quantityinentryunit
          totalgoodsmvtamtincccrcy    = lds_mf001t_04-totalgoodsmvtamtincccrcy
          companycodecurrency         = lds_mf001t_04-companycodecurrency
          deliverydocument            = lds_mf001t_04-deliverydocument
          deliverydocumentitem        = lds_mf001t_04-deliverydocumentitem
          companycode                 = lds_mf001t_04-companycode
          createdbyuser               = lds_mf001t_04-createdbyuser
          creationdate                = lds_mf001t_04-creationdate
          creationtime                = lds_mf001t_04-creationtime
          postingdate                 = lds_mf001t_04-postingdate
          purchaseordercurrency       = lds_mf001t_04-purchaseordercurrency
        )
      )
      FAILED DATA(ldt_failed_h_crt)
      REPORTED DATA(ldt_reported_h_crt)
      MAPPED DATA(ldt_mapped_h_crt).

    IF ldt_failed_h_crt IS INITIAL.
      COMMIT ENTITIES.
    ENDIF.
  ENDMETHOD.


  METHOD save_zmf001t_04.
    DATA: ldt_xinput  TYPE cl_abap_parallel=>t_in_tab,
          ldt_xoutput TYPE cl_abap_parallel=>t_out_tab,
          ldf_xinput  TYPE LINE OF cl_abap_parallel=>t_in_tab,
          lds_xoutput TYPE LINE OF cl_abap_parallel=>t_out_tab.

    EXPORT param_input  = is_input TO DATA BUFFER ldf_xinput.
    APPEND ldf_xinput TO ldt_xinput.

    "Execute parallel -> execute method do
    run( EXPORTING p_in_tab = ldt_xinput IMPORTING p_out_tab = ldt_xoutput ).
    "Setting data result
    IF NOT ldt_xoutput IS INITIAL.
      lds_xoutput = ldt_xoutput[ 1 ].
*      TRY.
*          IMPORT param_output = es_output FROM DATA BUFFER lds_xoutput-result.
*        CATCH cx_root INTO DATA(lo_error).
*      ENDTRY.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
