CLASS zcl_mf002_update_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS:
      save_log
        IMPORTING if_referencedocument TYPE xblnr
                  if_creationdate      TYPE dats
                  if_postingdate       TYPE dats
                  if_status            TYPE char2.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MF002_UPDATE_VN IMPLEMENTATION.


  METHOD save_log.

    SELECT SINGLE *
      FROM zmf002t_01_vn
      WHERE referencedocument = @if_referencedocument
      INTO @DATA(lds_zmf002t_01_vn).

    IF sy-subrc <> 0.
      MODIFY ENTITIES OF zr_mf002_log_vn
        ENTITY _log
        CREATE
        FIELDS ( referencedocument creationdate postingdate status )
        WITH VALUE #( ( %cid               = |CREATE_{ sy-tabix }|
                        referencedocument  = if_referencedocument
                        creationdate       = if_creationdate
                        postingdate        = if_postingdate
                        status             = if_status ) )
        FAILED    DATA(lds_failed_crt)
        REPORTED  DATA(lds_reported_crt)
        MAPPED    DATA(lds_mapped_crt).
    ELSE.
      MODIFY ENTITIES OF zr_mf002_log_vn
        ENTITY _log
        UPDATE
        FIELDS ( creationdate postingdate status )
        WITH VALUE #( ( referencedocument = if_referencedocument
                        creationdate      = if_creationdate
                        postingdate       = if_postingdate
                        status            = if_status ) )
        FAILED    DATA(lds_failed_upd)
        REPORTED  DATA(lds_reported_upd)
        MAPPED    DATA(lds_mapped_upd).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
