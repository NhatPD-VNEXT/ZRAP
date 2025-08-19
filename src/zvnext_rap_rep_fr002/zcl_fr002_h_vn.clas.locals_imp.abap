CLASS lhc__header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _header RESULT result.

    METHODS allocate FOR MODIFY
      IMPORTING keys FOR ACTION _header~allocate.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _header RESULT result.

ENDCLASS.

CLASS lhc__header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD allocate.

    DATA:
      ldt_detail TYPE TABLE FOR READ RESULT  zr_fr002_vn\\_header\_detail,
      lds_detail LIKE LINE OF ldt_detail.

    DATA:
      ldt_data TYPE TABLE FOR CREATE zr_fr002_vn\_detail,
      lds_data LIKE LINE OF ldt_data.

    READ ENTITIES OF zr_fr002_vn IN LOCAL MODE
        ENTITY _header
          ALL FIELDS
           WITH CORRESPONDING #( keys )
           RESULT DATA(ldt_header)
           FAILED failed
           REPORTED reported.

    IF reported IS NOT INITIAL.
      RETURN.
    ENDIF.

    READ TABLE ldt_header INTO DATA(lds_header) INDEX 1.
    CHECK sy-subrc = 0.

    READ TABLE keys INTO DATA(lds_key)
    WITH KEY %key = lds_header-%key.
    IF  sy-subrc <> 0.
      RETURN.
    ENDIF.

    ldt_data = VALUE #( (
        %key-companycode        = lds_header-companycode
        %key-fiscalyear         = lds_header-fiscalyear
        %key-accountingdocument = lds_header-accountingdocument
        %target = VALUE #( (
            companycode                     = lds_header-companycode
            fiscalyear                      = lds_header-fiscalyear
            rootaccountingdocument          = lds_header-accountingdocument
            glaccount                       = lds_header-glaccount
            offsettingaccount               = lds_header-offsettingaccount
            taxcode                         = lds_header-taxcode
            costcenter                      = lds_header-costcenter
            amountintransactioncurrency     = lds_header-amountintransactioncurrency
            %control-companycode            = if_abap_behv=>mk-on
            %control-fiscalyear             = if_abap_behv=>mk-on
            %control-rootaccountingdocument = if_abap_behv=>mk-on
            %control-glaccount              = if_abap_behv=>mk-on
            %control-offsettingaccount      = if_abap_behv=>mk-on
            %control-taxcode                = if_abap_behv=>mk-on
            %control-costcenter             = if_abap_behv=>mk-on
        ) )
    ) ).

*    APPEND VALUE #(
*        %key-companycode              = lds_header-companycode
*        %key-fiscalyear               = lds_header-fiscalyear
*        companycode                   = lds_header-companycode
*        fiscalyear                    = lds_header-fiscalyear
*        rootaccountingdocument        = lds_header-accountingdocument
*        glaccount                     = lds_header-glaccount
*        offsettingaccount             = lds_header-offsettingaccount
*        taxcode                       = lds_header-taxcode
*        costcenter                    = lds_header-costcenter
*        amountintransactioncurrency   = lds_header-amountintransactioncurrency
*      %control-companycode            = if_abap_behv=>mk-on
*      %control-fiscalyear             = if_abap_behv=>mk-on
*      %control-rootaccountingdocument = if_abap_behv=>mk-on
*      %control-glaccount              = if_abap_behv=>mk-on
*      %control-offsettingaccount      = if_abap_behv=>mk-on
*      %control-taxcode                = if_abap_behv=>mk-on
*      %control-costcenter             = if_abap_behv=>mk-on
*    ) TO lds_data-%target.
*
*    APPEND lds_data TO ldt_data.

    MODIFY ENTITIES OF zr_fr002_vn
        ENTITY _header
        CREATE BY \_detail
        AUTO FILL CID WITH ldt_data
    REPORTED DATA(reported_upload)
    FAILED DATA(failed_data)
    MAPPED DATA(mapped_data).
*    DO lds_key-%param-yy1_headre_field_001_sdh TIMES.
*    ENDDO.
  ENDMETHOD.

  METHOD get_instance_features.
*    LOOP AT keys INTO DATA(key).
*      APPEND VALUE #(
*           %tky = key-%tky
*           %action-allocate     = if_abap_behv=>fc-o-disabled  )
*                      TO result.
*    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
