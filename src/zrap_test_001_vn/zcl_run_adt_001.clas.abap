CLASS zcl_run_adt_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RUN_ADT_001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_uuid_x16 TYPE sysuuid_x16 VALUE 'FA163E48B8711FD093843F2E1E1C185D'.
    DATA lv_uuid_c36 TYPE sysuuid_c36.
    DATA lv_uuid_ok  TYPE i.

    TRY.
        cl_system_uuid=>convert_uuid_c32_static(
          EXPORTING
            uuid     = 'FA163E48B8711FD093843F2E1E1C185D'
          IMPORTING
*        uuid_x16 =
*        uuid_c22 =
*        uuid_c26 =
            uuid_c36 = lv_uuid_c36
        ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    TRY.
        cl_system_uuid=>convert_uuid_x16_static(
          EXPORTING
            uuid     = 'FA163E48B8711FD093843F2E1E1C185D'
          IMPORTING
*        uuid_c22 =
            uuid_c32 = DATA(lv_uuid_c32)
*        uuid_c26 =
*        uuid_c36 =
        ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
*    CATCH cx_uuid_error.
*    CATCH cx_uuid_error.
*    SELECT a~PurchasingDocumentCategory
*    FROM i_purchaserequisitionapi01\_PurchaseRequisitionItem AS a
*    WHERE purchaserequisitiontype = 'NB'
*    INTO TABLE @DATA(ldt_data).
*
*
*    IF sy-subrc = 0.
*    ENDIF.

*SELECT *
*FROM I_ChangeDocument WITH PRIVILEGED ACCESS
*into table @DATA(lt_change_document).
*
*    SELECT companycode,
*          fiscalyear,
*          accountingdocument,
*          ledgergllineitem,
*          sourceledger,
*          assignmentreference,
*          salesorder,
*          glaccount
*    FROM i_journalentryitem
*    WHERE companycode = '1510'
*      AND fiscalyear = '2025'
*      AND accountingdocument = '9400000060'
*      AND ledger = '0L'
**      AND ledgergllineitem = '000001'
*    INTO TABLE @DATA(lt_glaccountlineitemrawdata).
*    DELETE lt_glaccountlineitemrawdata WHERE salesorder IS INITIAL.
*
*    DATA: ldt_journalentry  TYPE TABLE FOR ACTION IMPORT i_journalentrytp~change.
*    FIELD-SYMBOLS: <lfs_journalentry> LIKE LINE OF ldt_journalentry.
*
*    DATA lt_glitem           LIKE <lfs_journalentry>-%param-_glitems.
*    DATA ls_glitem           LIKE LINE OF lt_glitem.
*    DATA ls_glitem_control   LIKE ls_glitem-%control.
*
*    ls_glitem_control-glaccountlineitem              = if_abap_behv=>mk-on.
*    ls_glitem_control-assignmentreference            = if_abap_behv=>mk-on.
*
*    DATA:
*          lds_headercontrol   LIKE <lfs_journalentry>-%param-%control.
*
*
*    APPEND INITIAL LINE TO ldt_journalentry ASSIGNING FIELD-SYMBOL(<lds_journalentry>).
*    <lds_journalentry>-companycode        = '1510'.
*    <lds_journalentry>-fiscalyear         = '2025'.
*    <lds_journalentry>-accountingdocument = '9400000060'.
*
*    <lds_journalentry>-%param = VALUE #(
*      %control = lds_headercontrol
*      _glitems = VALUE #(
*        FOR ls_glaccountlineitemrawdata IN lt_glaccountlineitemrawdata
*          ( glaccountlineitem   = ls_glaccountlineitemrawdata-ledgergllineitem
*            assignmentreference = 'TEST01'
**       reference1idbybusinesspartner = 'TEST02'
*            %control            = ls_glitem_control )
*      )
*    ).
*
*    MODIFY ENTITIES OF i_journalentrytp
*            ENTITY journalentry
*            EXECUTE change FROM ldt_journalentry
*              RESULT DATA(ls_resulted_deep)
*              FAILED DATA(ls_failed_deep)
*              REPORTED DATA(ls_reported_deep)
*              MAPPED DATA(ls_mapped_deep).
*
*    IF ls_failed_deep IS NOT INITIAL.
*    ELSE.
*      COMMIT ENTITIES BEGIN
*          RESPONSE OF i_journalentrytp
*            FAILED DATA(lt_commit_failed)
*            REPORTED DATA(lt_commit_reported).
*      COMMIT ENTITIES END.
*    ENDIF.


*    DATA:
*      ldt_updsch TYPE TABLE FOR UPDATE i_purchaseordschedulelinetp_2,
*      lds_updsch LIKE LINE OF ldt_updsch.
*
*    lds_updsch-purchaseorder     = '4500000372'.
**    lds_updsch-purchaseorder     = '4500000386'.
*    lds_updsch-purchaseorderitem = '10'.
*    lds_updsch-scheduleline      = '1'.
*    lds_updsch-schedulelinedeliverydate  = '20241011'.
*    lds_updsch-%control-schedulelinedeliverydate = if_abap_behv=>mk-on.
*    APPEND lds_updsch TO ldt_updsch.
*
*    MODIFY ENTITIES OF i_purchaseordertp_2
*      ENTITY purchaseorderscheduleline
*      UPDATE FROM ldt_updsch
*      MAPPED DATA(ldt_umaps)
*      FAILED DATA(ldt_ufails)
*      REPORTED DATA(ldt_ureps).
*    COMMIT ENTITIES
*      RESPONSES FAILED DATA(ldt_xfails)
*                REPORTED DATA(ldt_xreps).
*
*    IF ldt_ufails IS NOT INITIAL OR
*       ldt_ureps  IS NOT INITIAL.
*
*      out->write( 'Error' ).
*    ELSE.
*      out->write( 'Success' ).
*    ENDIF.

*    TYPES: ldt_items_create         TYPE TABLE FOR CREATE i_purchaseordertp_2\_purchaseorderitem.
*
*    DATA(ldt_item) = VALUE ldt_items_create( ( %cid_ref = 'PO'
*                                               %target  = VALUE #( ( %cid                = 'POI'
*                                                                    material             = 'RM5_CP'
*                                                                    plant                = '1510'
*                                                                    orderquantity        = 10
*                                                                    purchaseorderitem    = '00010'
*                                                                    accountassignmentcategory = 'L'
*                                                                    yy1_cre_parts_col_flag_pdi = 'X'
*                                                                    purchasecontractitem = '00010'
*
*                                               %control = VALUE #( plant = cl_abap_behv=>flag_changed
*                                                                   orderquantity        = cl_abap_behv=>flag_changed
*                                                                   purchaseorderitem    = cl_abap_behv=>flag_changed
*                                                                   material             = cl_abap_behv=>flag_changed
*                                                                   accountassignmentcategory = cl_abap_behv=>flag_changed
*                                                                   yy1_cre_parts_col_flag_pdi = cl_abap_behv=>flag_changed
*                                                                   purchasecontractitem  = cl_abap_behv=>flag_changed ) ) ) ) ).

*    MODIFY ENTITIES OF i_purchaseordertp_2
*    ENTITY purchaseorder
*    CREATE FROM VALUE #(
*                             ( %cid = 'CID_PO'
*                               purchaseordertype = 'NB'
*                               companycode = '1510'
*                               purchasingorganization = '1510'
*                               purchasinggroup = '002'
*                               supplier = '0015300096'
*                               %control = VALUE #( purchaseordertype = cl_abap_behv=>flag_changed
*                                                   companycode = cl_abap_behv=>flag_changed
*                                                   purchasingorganization = cl_abap_behv=>flag_changed
*                                                   purchasinggroup = cl_abap_behv=>flag_changed
*                                                   supplier = cl_abap_behv=>flag_changed
*                                                 )
*                              )
*                        )
*    ENTITY purchaseorder
*    CREATE BY \_purchaseorderitem
*    FROM VALUE #(
*                         ( %cid_ref = 'CID_PO'
*                           %target = VALUE #(
*                                             ( %cid = 'CID_PO_ITEM'
*                                               purchaseordercategory = 'L'
*                                               material = 'FG111_A'
*                                               manufacturermaterial = 'FG111_A'
*                                               plant = '1510'
*                                               orderquantity = 1
*                                               purchaseorderitem = '00010'
*                                               netpriceamount = 20
*                                               documentcurrency = 'JPY'
*                                               %control = VALUE #(
*                                                                   purchaseordercategory = cl_abap_behv=>flag_changed
*                                                                   material = cl_abap_behv=>flag_changed
*                                                                   manufacturermaterial = cl_abap_behv=>flag_changed
*                                                                   plant = cl_abap_behv=>flag_changed
*                                                                   orderquantity = cl_abap_behv=>flag_changed
*                                                                   purchaseorderitem = cl_abap_behv=>flag_changed
*                                                                   netpriceamount = cl_abap_behv=>flag_changed
*                                                                   documentcurrency = cl_abap_behv=>flag_changed
*                                                                 )
*                                             )
*                                            )
*                         )
*                  )
*   MAPPED DATA(ls_po_mapped)
*   FAILED DATA(ls_po_failed)
*   REPORTED DATA(ls_po_reported).
*
*    " Check if process is not failed
*    cl_abap_unit_assert=>assert_initial( ls_po_failed-purchaseorder ).
*    cl_abap_unit_assert=>assert_initial( ls_po_reported-purchaseorder ).
*
*    COMMIT ENTITIES
*      RESPONSES FAILED DATA(ldt_xfails)
*                REPORTED DATA(ldt_xreps).
*
*    LOOP AT ls_po_mapped-purchaseorder ASSIGNING FIELD-SYMBOL(<keys_header>).
*
*      CONVERT KEY OF i_purchaseordertp_2
*      FROM <keys_header>-%pid
*      TO <keys_header>-%key.
*    ENDLOOP.
*
*    out->write( 'Purchase order :' && <keys_header>-purchaseorder ).

*   一旦CREATEできるか
*    MODIFY ENTITIES OF i_purchasinginforecordtp
*      PRIVILEGED  "権限エラー
*      ENTITY purchasinginforecord
*      CREATE
**      FROM lt_header_create
*       FIELDS (
*          Supplier "サプライヤ アプリからの登録で必須
*          Material "品目
*          MaterialGroup "品目グループ アプリからの登録で必須
*        )
*          WITH VALUE #( (
*            %cid = 'H001'
**            PurchasingInfoRecord        = ' '
*            Supplier                    = '0015411510'
*            Material                    = 'E006'
*            MaterialGroup               = 'P002'
*            ) )
*
*      CREATE BY \_purginforecdorgplntdata
**      FROM lt_plantdata_create
*       FIELDS (
*          PurchasingInfoRecordCategory
*          PurchasingOrganization
*          Plant
*          PurchasingGroup
*          TimeDependentTaxValidFromDate
*          netpriceamount "正味価格
*          StandardPurchaseOrderQuantity
*          pricevalidityenddate
*          currency
*          PurgDocOrderQuantityUnit
*          MaterialPriceUnitQty
*          MaterialPlannedDeliveryDurn
*          MinimumPurchaseOrderQuantity
*        )
*          WITH VALUE #( (
*            %cid_ref = 'H001'
**            PurchasingInfoRecord        = ' '
*            %target = VALUE #( (
*            %cid = 'I001'
*            PurchasingInfoRecordCategory  = '0'
*            PurchasingOrganization        = '1510'
*            Plant                         = '1510'
*            PurchasingGroup               = '002'
*            TimeDependentTaxValidFromDate = '20241201' "税率有効開始日付を入力してください
*            pricevalidityenddate          = '20240501'
*            netpriceamount                = 200 "Please maintain either the net price or conditions
*            currency                      = 'JPY'
*            PurgDocOrderQuantityUnit      = 'LE' "発注単位
*            MaterialPriceUnitQty          = 1    "価格単位
*            MaterialPlannedDeliveryDurn   = 2    "納入予定日数
*            MinimumPurchaseOrderQuantity  = 1    "最低数量
*            StandardPurchaseOrderQuantity = 1    "標準購買発注数量 "標準数量を入力してください
*          ) )
*            ) )
*
*      ENTITY purginforecdorgplantdata
*      CREATE BY \_purginforecdprcgcndnvaldty
**      FROM lt_cndvalid_create
*       FIELDS (
*          ConditionValidityStartDate
*          ConditionValidityEndDate
*        )
*          WITH VALUE #( (
*            %cid_ref = 'H001'
*            PurchasingInfoRecordCategory       = '0'
*            PurchasingOrganization             = '1510'
*            Plant                              = '1510'
*            %target = VALUE #( (
*                        %cid              = 'I001_1'
*                        ConditionValidityEndDate   = '20240501'
*                        ConditionValidityStartDate = '20240401'
*                        ConditionApplication = 'M'
**                        ConditionType = 'PPR0'　"条件タイプを決定することはできません
*                        Supplier = '0015411510'
*                        Material = 'TG10'
*                              ) )
*            ) )
*
**     条件レコード
*      ENTITY purginforecdprcgcndnvaldty
*      CREATE BY \_purginforecdcndnrecord
**      FROM lt_conditions_create
*       FIELDS (
*          ConditionValidityStartDate
**          ConditionValidityEndDate "変更不可
*          ConditionRateValue
*        )
*          WITH VALUE #( (
*            %cid_ref = 'H001'
*            PurchasingInfoRecord               = space
*            PurchasingInfoRecordCategory       = '0'
*            PurchasingOrganization             = '1510'
*            Plant                              = '1510'
*            %target = VALUE #( (
*                        %cid              = 'I001_2'
*                        ConditionValidityEndDate   = '20240210'
*                        ConditionValidityStartDate = '20240201'
**                        ConditionApplication = 'M'
*                        ConditionRateValue   = 100
**                        ConditionType = 'PPR0'　"条件タイプを決定することはできません
*                              ) )
*
*            ) )
*
**      ENTITY purginforecdcndnrecord
**      CREATE BY \_purginforecdcndnsuplmnt
**      FROM lt_condsuplmnt_create
*
*      FAILED   DATA(lds_failed)
*      REPORTED DATA(lds_reported)
*      MAPPED   DATA(lds_mapped).
*    "Check result for export message
*    IF lds_failed IS INITIAL.
*
*    DATA: lrf_msg TYPE REF TO if_abap_behv_message.
*
*      COMMIT ENTITIES BEGIN RESPONSE OF i_purchasinginforecordtp
*          FAILED DATA(failed_late)
*          REPORTED DATA(reported_late).
*
*      LOOP AT reported_late-purchasinginforecord INTO DATA(ls_report).
*        ASSIGN COMPONENT '%msg' OF STRUCTURE ls_report TO FIELD-SYMBOL(<l_msg>).
*        IF sy-subrc = 0.
*          lrf_msg = <l_msg>.
*          DATA(ldf_message) = lrf_msg->if_message~get_text( ).
*          out->write( ldf_message ).
*        ENDIF.
*      ENDLOOP.
*
*      COMMIT ENTITIES END.
*    ENDIF.

*    SELECT SINGLE FROM i_purchasinginforecordtp\_purginforecdorgplntdata\_purginforecdprcgcndnvaldty\_purginforecdcndnrecord AS condrec
*      FIELDS *
*      WHERE purchasingorganization        = '1510'
*        AND plant                         = '1510'
*        AND conditionrecord               = '0000008957'
*      INTO @DATA(lds_pricecond).
*
*    DATA: ldt_update TYPE TABLE FOR UPDATE i_purginforecdcndnrecordtp,
*          lds_update LIKE LINE OF ldt_update.
*
*    MOVE-CORRESPONDING lds_pricecond TO lds_update.
*    lds_update-conditionvaliditystartdate = '20241128'.
*    lds_update-conditionratevalue         = 150.
*    lds_update-conditionratevalueunit     = 'JPY'.
*    APPEND lds_update TO ldt_update.
*
*    MODIFY ENTITIES OF i_purchasinginforecordtp PRIVILEGED
*       ENTITY purginforecdcndnrecord
*       UPDATE FIELDS ( conditionratevalue
*                       conditionvaliditystartdate
*                       conditionalternativecurrency
*                      )
*       WITH ldt_update
*       MAPPED DATA(lt_mapupd)
*       REPORTED DATA(lt_report)
*       FAILED DATA(lt_fail).
*
*    COMMIT ENTITIES.

*    SELECT SINGLE decimals
*      FROM i_currency
*      WHERE currency = 'JPY'
*      INTO @DATA(lv_currdec).
*
*    lv_currdec = 2 - lv_currdec.
*    lv_currdec = 10 ** lv_currdec.
*
*    DATA(ldf_test) = zcl_com_conv=>amount_in(
*      EXPORTING
*        if_amountout = 123
*        if_currency  = 'JPY'
*    ).

*    DATA ls_invoice TYPE STRUCTURE FOR ACTION IMPORT i_supplierinvoicetp~create.
*    DATA lt_invoice TYPE TABLE FOR ACTION IMPORT i_supplierinvoicetp~create.
*
*    " The %cid (temporary primary key) has always to be supplied (is omitted in further examples)
*    TRY.
*        DATA(lv_cid) = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ).
*      CATCH cx_uuid_error.
*        "Error handling
*    ENDTRY.
*
*    ls_invoice-%cid                                 = lv_cid.
*    ls_invoice-%param-supplierinvoiceiscreditmemo   = abap_false.
*    ls_invoice-%param-companycode                   = '1510'.
*    ls_invoice-%param-invoicingparty                = '0015401510'.
*    ls_invoice-%param-postingdate                   = '20241001'.
*    ls_invoice-%param-documentdate                  = '20241001'.
*    ls_invoice-%param-taxdeterminationdate          = '20241101'.
*    ls_invoice-%param-documentcurrency              = 'JPY'.
*    ls_invoice-%param-invoicegrossamount            = '1100.00'.
*    ls_invoice-%param-taxiscalculatedautomatically  = abap_true.
*    ls_invoice-%param-supplierinvoiceidbyinvcgparty = 'INV0001'.
*    ls_invoice-%param-accountingdocumenttype        = 'KR'.
*
*    ls_invoice-%param-_glitems = VALUE #(
*      ( supplierinvoiceitem       = '000001'
*        debitcreditcode           = cl_mmiv_rap_ext_c=>debitcreditcode-debit
*        glaccount                 = '0012561000'
*        companycode               = '1510'
*        taxcode                   = 'V3'
*        documentcurrency          = 'JPY'
*        supplierinvoiceitemamount = '1000.00'
*        supplierinvoiceitemtext   = 'test' )
*    ).
*
*    INSERT ls_invoice INTO TABLE lt_invoice.
*
*    "Register the action
*    MODIFY ENTITIES OF i_supplierinvoicetp
*    ENTITY supplierinvoice
*    EXECUTE create FROM lt_invoice
*    FAILED DATA(ls_failed)
*    REPORTED DATA(ls_reported)
*    MAPPED DATA(ls_mapped).
*
*    IF ls_failed IS NOT INITIAL.
*      DATA lo_message TYPE string.
*
*      LOOP AT ls_reported-supplierinvoice INTO DATA(lds_item).
*        lo_message = lo_message && lds_item-%msg->if_message~get_text( ) && ','.
*      ENDLOOP.
*
*      "Error handling
*    ENDIF.
*
*    "Execution the action
*    COMMIT ENTITIES
*      RESPONSE OF i_supplierinvoicetp
*      FAILED DATA(ls_commit_failed)
*      REPORTED DATA(ls_commit_reported).
*
*    IF ls_commit_reported IS NOT INITIAL.
*      LOOP AT ls_commit_reported-supplierinvoice ASSIGNING FIELD-SYMBOL(<ls_invoice>).
*        IF <ls_invoice>-supplierinvoice IS NOT INITIAL AND
*           <ls_invoice>-supplierinvoicefiscalyear IS NOT INITIAL.
*          "Success case
*        ELSE.
*          "Error handling
*        ENDIF.
*      ENDLOOP.
*    ENDIF.
*
*    IF ls_commit_failed IS NOT INITIAL.
*      LOOP AT ls_commit_reported-supplierinvoice ASSIGNING <ls_invoice>.
*        "Error handling
*      ENDLOOP.
*    ENDIF.

*    READ ENTITIES OF i_supplydemanditemtp
*     ENTITY supplydemanditem
*     EXECUTE getpeggingwithitems
*     FROM VALUE #(
*     ( %param-material = 'TG0011' %param-mrparea = '1510' %param-mrpplant = '1510' ) )
*     RESULT DATA(lt_sdi_result)
*     FAILED DATA(lt_sdi_failed)
*     REPORTED DATA(lt_sdi_reported).
*
*    CHECK lt_sdi_failed IS INITIAL.

    " The port of the UI URL (Type i).
*    DATA(lo_current_tenant) = xco_cp=>current->tenant( ).
*    " UI URL of the current tenant.
*    DATA(lo_ui_url) = lo_current_tenant->get_url( xco_cp_tenant=>url_type->api ).
*
*    " The protocol of the UI URL (Type string).
*    DATA(lv_ui_url_protocol) = lo_ui_url->get_protocol( ).
*
*    " The host (including the domain) of the UI URL (Type string).
*    DATA(lv_ui_url_host) = lo_ui_url->get_host( ).
*
*    DATA(lv_ui_url_port) = lo_ui_url->get_port( ).
*    CHECK lv_ui_url_port IS NOT INITIAL.

*    MODIFY ENTITIES OF zr_prod_file_vn
*        ENTITY data
*        UPDATE
*        FIELDS ( message
*                 vstat )
*        WITH VALUE #( ( attachmentuuid   = 'FB1F6E5AA6201EDFAE8DF92AB2DA3647'
*                        pkey1            = 'BOIF968'
*                        pkey2            = 'HAWA'
*                        pkey3            = '1510'
*                        pkey4            = ''
*                        message          = 'Test'
*                        vstat            = '1'
*                        %control-message = if_abap_behv=>mk-on
*                        %control-vstat   = if_abap_behv=>mk-on
*                      ) )
*    REPORTED DATA(update_reported).
*    COMMIT ENTITIES
*       RESPONSE OF zr_prod_file_vn
*       FAILED DATA(failed_commit_zr)
*       REPORTED DATA(reported_commit_zr).

*    SELECT SINGLE *
*    FROM i_srvcpartslocationproduct
*    INTO @DATA(lds_data).

*    DATA:
*      lt_prodnrtg   TYPE TABLE FOR CREATE i_productionroutingtp_2\\productionrouting,
*      lt_prodnhead  TYPE TABLE FOR CREATE i_productionroutingtp_2\\productionrouting\_header,
*      lt_matlassgmt TYPE TABLE FOR CREATE i_productionroutingtp_2\\productionroutingheader\_matlassgmt,
*      lt_sequence   TYPE TABLE FOR CREATE i_productionroutingtp_2\\productionroutingheader\_sequence,
*      lt_operation  TYPE TABLE FOR CREATE i_productionroutingtp_2\\productionroutingsequence\_operation.
*
*************************** lt_prodnrtg ********************************************
*    lt_prodnrtg = VALUE #( (
*                           %cid                            = 'ProdnRtg'
*                           productionrouting               = '01'
*                           %control-productionroutinggroup = if_abap_behv=>mk-on
*                           %control-productionrouting      = if_abap_behv=>mk-on
*                           ) ).
*
*************************** lt_prodnhead ********************************************
*    lt_prodnhead = VALUE #( (
*                            %cid_ref               = 'ProdnRtg'
*                            %key-productionrouting = '01'
*                            %target                = VALUE #( (
*                                               %cid                            = 'ProdnRtg_head'
*                                               %key-productionrouting          = '01'               "7.グループカウンタ
*                                               plant                           = '1510'           "2.プラント
*                                               billofoperationsusage           = '1'                "用途
*                                               billofoperationsstatus          = '4'                "全体ステータス
*                                               billofoperationsunit            = 'ST'
*                                               billofoperationsdesc            = 'HLDL 666'         "8.作業手順テキスト
*                                               validitystartdate               = '20241225'         "9.有効開始
*
*                                               %control-plant                  = if_abap_behv=>mk-on
*                                               %control-billofoperationsusage  = if_abap_behv=>mk-on
*                                               %control-billofoperationsstatus = if_abap_behv=>mk-on
*                                               %control-billofoperationsunit   = if_abap_behv=>mk-on
*                                               %control-billofoperationsdesc   = if_abap_behv=>mk-on
*                                               %control-validitystartdate      = if_abap_behv=>mk-on ) )
*                            ) ).
*
*************************** lt_matlassgmt ********************************************
*    lt_matlassgmt = VALUE #( (
*                             %cid_ref = 'ProdnRtg_head'
*                             %target  = VALUE #( (
*                                                %cid             = 'ProdnRtg_matlassgmt'
*                                                %key-plant       = '1510'                   "2.プラント
*                                                %key-product     = 'TG11'                   "1.品目
*
*                                                %control-plant   = if_abap_behv=>mk-on
*                                                %control-product = if_abap_behv=>mk-on
*                                                ) )
*                             ) ).
*************************** lt_sequence ********************************************
*    lt_sequence = VALUE #( (
*                           %cid_ref = 'ProdnRtg_head'
*                           %target  = VALUE #( (
*                                              %cid                           = 'ProdnRtg_sequence'
*
*                                              %key-productionroutingsequence = '000000'
*                                              validitystartdate              = '20241227' ) )
*                           ) ).
*************************** lt_operation ********************************************
*    lt_operation = VALUE #( (
*                            %cid_ref                       = 'ProdnRtg_sequence'
*                            %key-productionroutingsequence = '000000'
*                            %target                        = VALUE #( (
*                                               %cid                                = 'ProdnRtg_operation'
*                                               %key-productionroutingsequence      = '000000'            "順序
*                                               operation                           = '0010'              "10.作業
*                                               plant                               = '1510'            "2.プラント
*                                               operationcontrolprofile             = 'QM01'              "12.管理キー
*                                               workcenterinternalid                = '10000029'          "11.作業区
*                                               operationtext                       = 'Operation text 40' "13.テキスト
*                                               operationunit                       = 'ST'
*                                               operationreferencequantity          = 4                   "14.基本数量
*                                               standardworkquantity1               = 16                  "15.標準値1
*                                               standardworkquantityunit1           = 'MIN'               "16.単位1
*                                               standardworkquantity2               = 26                  "17.標準値2
*                                               standardworkquantityunit2           = 'MIN'               "18.単位2
*                                               standardworkquantity3               = 1                   "19.標準値3
*                                               standardworkquantityunit3           = 'H'                 "20.単位3
*                                               standardworkquantity4               = 6                   "21.標準値4
*                                               standardworkquantityunit4           = 'H'                 "22.単位4
*                                               standardworkquantity5               = 7                   "23.標準値5
*                                               standardworkquantityunit5           = 'H'                 "24.単位4
*                                               standardworkquantity6               = 8                   "25.標準値6
*                                               standardworkquantityunit6           = 'H'                 "26.単位6
*                                               opqtytobaseqtynmrtr                 = 2                   "27.ヘッダ（数量変換の分子）
*                                               opqtytobaseqtydnmntr                = 1                   "28.作業（数量変換の分母）
*                                               opisextlyprocdwithsubcontrg         = 'X'
*                                               purchasinginforecord                = '5300001183'        "29.購買情報
*                                               purchasingorganization              = '1510'              "30.購買組織
*                                               costelement                         = '0041000000'        "原価要素
*
*                                               %control-operation                  = if_abap_behv=>mk-on
*                                               %control-plant                      = if_abap_behv=>mk-on
*                                               %control-operationcontrolprofile    = if_abap_behv=>mk-on
*                                               %control-workcenterinternalid       = if_abap_behv=>mk-on
*                                               %control-operationtext              = if_abap_behv=>mk-on
*                                               %control-operationunit              = if_abap_behv=>mk-on
*                                               %control-operationreferencequantity = if_abap_behv=>mk-on
*                                               %control-standardworkquantity1      = if_abap_behv=>mk-on
*                                               %control-standardworkquantityunit1  = if_abap_behv=>mk-on
*                                               %control-standardworkquantity2      = if_abap_behv=>mk-on
*                                               %control-standardworkquantityunit2  = if_abap_behv=>mk-on
*                                               %control-standardworkquantity3      = if_abap_behv=>mk-on
*                                               %control-standardworkquantityunit3  = if_abap_behv=>mk-on
*                                               %control-standardworkquantity4      = if_abap_behv=>mk-on
*                                               %control-standardworkquantityunit4  = if_abap_behv=>mk-on
*                                               %control-standardworkquantity5      = if_abap_behv=>mk-on
*                                               %control-standardworkquantityunit5  = if_abap_behv=>mk-on
*                                               %control-standardworkquantity6      = if_abap_behv=>mk-on
*                                               %control-standardworkquantityunit6  = if_abap_behv=>mk-on
*
*                                               %control-opqtytobaseqtynmrtr        = if_abap_behv=>mk-on
*                                               %control-opqtytobaseqtydnmntr       = if_abap_behv=>mk-on
*                                               %control-purchasinginforecord       = if_abap_behv=>mk-on
*                                               %control-purchasingorganization     = if_abap_behv=>mk-on
*                                               %control-costelement                = if_abap_behv=>mk-on ) )
*                            ) ).
*    MODIFY ENTITIES OF i_productionroutingtp_2
**    Product Routing
*       ENTITY productionrouting
*          CREATE FIELDS ( productionrouting  ) WITH lt_prodnrtg
**       Production Routing Header
*        CREATE BY \_header
*            FIELDS ( plant billofoperationsusage billofoperationsstatus billofoperationsunit
*                     billofoperationsdesc validitystartdate  ) WITH lt_prodnhead
*
**      Production Routing Material Assignment
*       ENTITY productionroutingheader
*               CREATE BY \_matlassgmt
*               FIELDS ( plant product ) WITH lt_matlassgmt
**              Production Routing Sequence
*               CREATE BY \_sequence FROM  lt_sequence
*
**      Production Routing Operation
*       ENTITY productionroutingsequence
*               CREATE BY \_operation
*               FIELDS ( operation plant operationcontrolprofile workcenterinternalid
*                        operationtext operationunit operationreferencequantity
*                        standardworkquantity1 standardworkquantityunit1 standardworkquantity2
*                        standardworkquantityunit2 standardworkquantity3 standardworkquantityunit3
*                        standardworkquantity4 standardworkquantityunit4 standardworkquantity5
*                        standardworkquantityunit5 standardworkquantity6 standardworkquantityunit6
*                        opqtytobaseqtynmrtr opqtytobaseqtydnmntr opisextlyprocdwithsubcontrg
*                        purchasinginforecord purchasingorganization costelement ) WITH lt_operation
*
*     MAPPED DATA(mapped)
*     REPORTED DATA(reported)
*     FAILED DATA(failed).
*
*    COMMIT ENTITIES BEGIN
*    RESPONSE OF i_productionroutingtp_2
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*
*    IF failed_commit IS INITIAL
*    AND reported_commit IS INITIAL.
*      CONVERT KEY OF i_prodnroutingoperationtp_2
*      FROM TEMPORARY VALUE #( %pid = mapped-productionroutingoperation[ 1 ]-%pid
*                              %tmp = mapped-productionroutingoperation[ 1 ]-%key )
*      TO FINAL(ls_finalkey).
*    ENDIF.
*    COMMIT ENTITIES END.
*
*    out->write( |'Routing was saved with group' { ls_finalkey-productionroutinggroup } 'and material { 1510 }| ).
*    READ ENTITIES OF I_SupplyDemandItemTP
*     ENTITY SupplyDemandItem
*      EXECUTE GetPeggingWithItems
*      FROM VALUE #(
*     ( %param-material = 'ExampleMaterial1' %param-mrparea = 'TG12' %param-mrpplant = '1510') )
*     RESULT DATA(lt_sdi_result)
*     FAILED DATA(lt_sdi_failed)
*     REPORTED DATA(lt_sdi_reported).
*    DELETE FROM zfr003_d_vn.
*    DELETE FROM zfr003_h_vn.
*    DATA: lds_fr002 TYPE zfr003_d_vn.
*    lds_fr002-key_uuid = '7DD94B71AE161EDFAEEC435FDA90164E'.
*    lds_fr002-companycode = '1510'.
*    lds_fr002-fiscalyear = '2024'.
*    lds_fr002-accountingdocument = '0100000196'.
*    lds_fr002-rootaccountingdocument = '0100000195'.
*    MODIFY zfr003_d_vn FROM @lds_fr002.

*    READ ENTITIES OF I_SupplyDemandItemTP
*     ENTITY SupplyDemandItem
*      EXECUTE GetItem
*      FROM VALUE #( ( %param-material = 'TG12' %param-mrparea = '1510' %param-mrpplant = '1510' ) )
*     RESULT DATA(lt_sdi_result)
*     FAILED DATA(lt_sdi_failed)
*     REPORTED DATA(lt_sdi_reported).

*      READ ENTITIES OF i_supplydemanditemtp
*      ENTITY supplydemanditem
*      EXECUTE getpeggingwithitems
*      FROM VALUE #( ( %param-material = 'TG12' %param-mrparea = '1510' %param-mrpplant = '1510' ) )
*      RESULT DATA(lt_sdi_result)
*      FAILED DATA(lt_sdi_failed)
*      REPORTED DATA(lt_sdi_reported).

*    DATA: ldf_test   TYPE char1 VALUE 'X',
*          ldf_test_2 TYPE char1.
*
*    DATA buffer TYPE xstring.
*    EXPORT ldf_test = ldf_test TO DATA BUFFER buffer.
*    IMPORT ldf_test = ldf_test_2 FROM DATA BUFFER buffer.

*    MODIFY ENTITIES OF i_purchaseordertp_2
*    ENTITY purchaseorder
*    CREATE FROM VALUE #(
*                             ( %cid = 'CID_PO'
*                               purchaseordertype = 'NB'
*                               companycode = '1510'
*                               purchasingorganization = '1510'
*                               purchasinggroup = '002'
*                               supplier = '0015300096'
*                               %control = VALUE #( purchaseordertype = cl_abap_behv=>flag_changed
*                                                   companycode = cl_abap_behv=>flag_changed
*                                                   purchasingorganization = cl_abap_behv=>flag_changed
*                                                   purchasinggroup = cl_abap_behv=>flag_changed
*                                                   supplier = cl_abap_behv=>flag_changed
*                                                 )
*                              )
*                        )
*    ENTITY purchaseorder
*    CREATE BY \_purchaseorderitem
*    FROM VALUE #(
*                         ( %cid_ref = 'CID_PO'
*                           %target = VALUE #(
*                                             ( %cid = 'CID_PO_ITEM'
*                                               material = 'TG11'
*                                               plant = '1510'
*                                               orderquantity = 1
*                                               purchaseorderitem = '00010'
*                                               netpriceamount = 20
*                                               %control = VALUE #(
*                                                                   material = cl_abap_behv=>flag_changed
*                                                                   plant = cl_abap_behv=>flag_changed
*                                                                   orderquantity = cl_abap_behv=>flag_changed
*                                                                   purchaseorderitem = cl_abap_behv=>flag_changed
*                                                                   netpriceamount = cl_abap_behv=>flag_changed
*                                                                 )
*                                             )
*                                            )
*                         )
*                  )
*
*      REPORTED DATA(ls_po_reported)
*      FAILED   DATA(ls_po_failed)
*      MAPPED   DATA(ls_po_mapped).
*
*    " Check if process is not failed
*    cl_abap_unit_assert=>assert_initial( ls_po_failed-purchaseorder ).
*    cl_abap_unit_assert=>assert_initial( ls_po_reported-purchaseorder ).
*
**    ls_mapped_root_late-%pre = VALUE #( %tmp = ls_mapped-purchaseorder[ 1 ]-%key ).
*    COMMIT ENTITIES BEGIN RESPONSE OF I_PurchaseOrderTP_2 FAILED DATA(lt_po_res_failed) REPORTED DATA(lt_po_res_reported).
*    "Special processing for Late numbering to determine the generated document number.
*    LOOP AT ls_po_mapped-purchaseorder ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
*      CONVERT KEY OF I_PurchaseOrderTP_2 FROM <fs_po_mapped>-%key TO DATA(ls_po_key).
*      <fs_po_mapped>-PurchaseOrder = ls_po_key-PurchaseOrder.
*    ENDLOOP.
*    COMMIT ENTITIES END.
*    out->write( 'Purchase order :' && ls_po_key-PurchaseOrder ).

*    DELETE FROM zfr003_d_vn.
*    DELETE FROM zfr003_h_vn.
*CATCH cx_scal.

*    DATA:
*      lds_data TYPE zmf003t_04_vn.
*
*    lds_data-zzvcdid = '10'.
*    lds_data-zzvctxt = 'Allocate Quantity'.
*    lds_data-taxcode = 'N1'.
*    MODIFY zmf003t_04_vn FROM @lds_data.
*
*    lds_data-zzvcdid = '20'.
*    lds_data-zzvctxt = 'Allocate Amount'.
*    lds_data-taxcode = 'N2'.
*    MODIFY zmf003t_04_vn FROM @lds_data.
**
*    SELECT *
*    FROM zmf001t_01
*    INTO TABLE @DATA(ldt_data).

*    lds_zmf001t_02-referencedocument = 'INV0000001'.
*    lds_zmf001t_02-referencedocumentitem = '00001'.
*    MODIFY zmf001t_02 FROM @lds_zmf001t_02.

*    DELETE FROM zmf001t_04_d.
*    DELETE FROM zmf001t_04.
*    DELETE FROM zmf001t_02_d.
*    DELETE FROM zmf001t_02.
*    DELETE FROM zmf001t_03.

*    SELECT *
*    FROM i_materialdocumentheader_2
*    WHERE referencedocument = 'INV0000001'
*    INTO TABLE @DATA(ldt_header).
*
*    IF sy-subrc = 0.
*      SORT ldt_header BY materialdocument materialdocumentyear.
*
*      SELECT *
*      FROM i_materialdocumentitem_2
*      FOR ALL ENTRIES IN @ldt_header
*      WHERE materialdocument = @ldt_header-materialdocument
*        AND materialdocumentyear = @ldt_header-materialdocumentyear
*      INTO TABLE @DATA(ldt_item).
*    ENDIF.
*
*    DATA: lds_zmf001t_04 TYPE zmf001t_04.
*
*    LOOP AT ldt_item INTO DATA(lds_item).
*
*      MOVE-CORRESPONDING lds_item TO lds_zmf001t_04.
*      lds_zmf001t_04-referencedocument = 'INV0000001'.
*      MODIFY zmf001t_04 FROM @lds_zmf001t_04.
*    ENDLOOP.
*
*    IF sy-subrc = 0.
*      out->write( 'Done' ).
*    ENDIF.
    " Convert Amount to input
*    zcl_convt_amt_vn=>scale_amount_in(
*      EXPORTING
*        if_amountout = '10'
*        if_currency  = 'JPY'
*      RECEIVING
*        rv_amountin  = DATA(ldf_amount)
*    ).
*
*    out->write( ldf_amount ).

*    DELETE FROM zmf002t_01_vn.

*    SELECT *
*    FROM i_jp_invcsmmrypayerinvoice WITH PRIVILEGED ACCESS
*    INTO TABLE @DATA(ldt_data).
    " Read PO Item Note from the PO Item Data
*    READ ENTITY I_SalesOrderTP BY \_Text
*      FROM VALUE #( ( %key = VALUE #( SalesOrder     = '0000000158'
*                                      ) ) )
*    RESULT   DATA(ldt_text_data)
*    REPORTED DATA(lds_reported)
*    FAILED   DATA(lds_failed).

*delete FROM zf901t_d_vn.

*    DATA: lv_year   TYPE n LENGTH 4,
*          lv_month  TYPE n LENGTH 2,
*          lv_next_month TYPE n LENGTH 2,
*          lv_next_year  TYPE n LENGTH 4,
*          lv_first_next_month TYPE datum.

*
*    " Lấy năm và tháng
*    lv_year  = iv_date+0(4).
*    lv_month = iv_date+4(2).
*
*    " Xác định tháng tiếp theo
*    IF lv_month = 12.
*      lv_next_month = 1.
*      lv_next_year  = lv_year + 1.
*    ELSE.
*      lv_next_month = lv_month + 1.
*      lv_next_year  = lv_year.
*    ENDIF.
*
*    " Ngày đầu tiên của tháng tiếp theo
*    CONCATENATE lv_next_year lv_next_month '01' INTO lv_first_next_month.
*
*    " Lấy ngày cuối cùng của tháng bằng cách trừ đi 1 ngày
*    rv_last_day = lv_first_next_month - 1.

*    zcl_com_last_date_of_month=>get_last_day(
*      EXPORTING
*        if_date     = '20240212'
*  RECEIVING
*    if_last_day = DATA(ldf_last_day)
*    ).
*
*    out->write( ldf_last_day ).

*    SELECT *
*    FROM i_purchasinginforecordtp
*    INTO TABLE @DATA(ldt_data)
*    UP TO 1 ROWS.

*    DATA: lo_fcal_runtime TYPE REF TO if_fhc_fcal_runtime.
*
*    TRY.
*        lo_fcal_runtime = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( iv_factorycalendar_id = 'Z_JP' ).
*      CATCH cx_fhc_runtime INTO DATA(lo_error).
*    ENDTRY.
*
*    TRY.
*        lo_fcal_runtime->is_date_workingday(
*          EXPORTING
*            iv_date       = '20251321'
*          RECEIVING
*            rv_workingday = DATA(ldf_check)
*        ).
*      CATCH cx_fhc_runtime INTO FINAL(root_exception).
*        RAISE EXCEPTION NEW zcx_xco_runtime_exception( previous = root_exception ).
*        "handle exception
*    ENDTRY.

*    DATA: lv_num1   TYPE i VALUE 2147483647,  " Integer max
*          lv_num2   TYPE i VALUE 1,
*          lv_result TYPE i.
*
*    TRY.
*        lv_result = lv_num1 + lv_num2.  " Tràn số
*      CATCH cx_sy_arithmetic_overflow INTO FINAL(root_exception).
*        RAISE EXCEPTION TYPE zcx_xco_runtime_exception
*          EXPORTING
*            previous = root_exception.
*        out->write( root_exception->get_text(  ) ).
*    ENDTRY.

*    SELECT *
*    FROM I_PurchaseRequisitionItemAPI01
*    WITH PRIVILEGED ACCESS
*    INTO TABLE @DATA(ldt_data).

*    DELETE FROM zf901t_vn WHERE allocated_line_item = '00120'.
*    SELECT *
*    FROM zf901t_vn
*    WHERE company_code = '1510'
*      INTO TABLE @DATA(ldt_zf901t_vn).
*
*    MODIFY ENTITIES OF zi_ff901_02_vn
*    ENTITY _detail
*    DELETE FROM VALUE #(
*        FOR lds_zf901t_vn IN ldt_zf901t_vn
*        ( CompanyCode            = lds_zf901t_vn-company_code
*          FiscalYear             = lds_zf901t_vn-fiscal_year
*          AccountingDocumentBase = lds_zf901t_vn-accounting_document_base
*          AllocatedLineItem      = lds_zf901t_vn-allocated_line_item )
*    )
*    FAILED DATA(ldt_failed_del).

*    DATA: lt_je_deep TYPE TABLE FOR ACTION IMPORT i_journalentrytp~post,
*          lv_cid     TYPE abp_behv_cid.
*
*    TRY.
*        lv_cid = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
*      CATCH cx_uuid_error.
*        ASSERT 1 = 0.
*    ENDTRY.
*
*    APPEND INITIAL LINE TO lt_je_deep ASSIGNING FIELD-SYMBOL(<je_deep>).
*    <je_deep>-%cid = lv_cid.
*    <je_deep>-%param = VALUE #(
*    companycode = '1510' " Success
*    documentreferenceid = 'BKPFF'
*    createdbyuser = 'TESTER'
*    businesstransactiontype = 'RFBU'
*    accountingdocumenttype = 'SA'
*    documentdate = sy-datlo
*    postingdate = sy-datlo
*    taxdeterminationdate = sy-datlo
*    taxreportingdate = sy-datlo
*    accountingdocumentheadertext = 'RAP rules'
*    _glitems = VALUE #( ( glaccountlineitem = |001| glaccount = '0063009000' taxcode = 'V0' costcenter = '0015101101' taxcountry = 'JP'  _currencyamount = VALUE #( ( currencyrole = '00' journalentryitemamount = '1000.00' currency = 'JPY' ) ) )
*    ( glaccountlineitem = |002| glaccount = '0012561000' documentitemtext = 'Test' _currencyamount = VALUE #( ( currencyrole = '00' journalentryitemamount = '-1001.00' currency = 'JPY' ) ) ) )
*     _taxitems = VALUE #( ( glaccountlineitem = '003' taxcode = 'V0' conditiontype = 'MWVR'
*     _currencyamount = VALUE #( ( currencyrole = '00' currency = 'JPY' journalentryitemamount = '0'  taxbaseamount = '10' ) ) )
*     )
*    ).
*
*    MODIFY ENTITIES OF i_journalentrytp
*    ENTITY journalentry
*    EXECUTE post FROM lt_je_deep
*    FAILED DATA(ls_failed_deep)
*    REPORTED DATA(ls_reported_deep)
*    MAPPED DATA(ls_mapped_deep).
*
*    IF ls_failed_deep IS NOT INITIAL.
*
*      LOOP AT ls_reported_deep-journalentry ASSIGNING FIELD-SYMBOL(<ls_reported_deep>).
*        DATA(lv_result) = <ls_reported_deep>-%msg->if_message~get_text( ).
*        ...
*      ENDLOOP.
*    ELSE.
*
*      COMMIT ENTITIES BEGIN
*      RESPONSE OF i_journalentrytp
*      FAILED DATA(lt_commit_failed)
*      REPORTED DATA(lt_commit_reported).
*      ...
*      COMMIT ENTITIES END.
*    ENDIF.

*    DATA lt_je_deep TYPE TABLE FOR FUNCTION IMPORT i_journalentrytp~validate.
*
*    TRY.
*        DATA(lv_cid)  = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) ).
*      CATCH cx_uuid_error.
*        ASSERT 1 = 0.
*    ENDTRY.
*
*    APPEND INITIAL LINE TO lt_je_deep ASSIGNING FIELD-SYMBOL(<je_deep>).
*    <je_deep>-%cid   = lv_cid.
*    <je_deep>-%param = VALUE #(
*        companycode                  = '1510' " Success
*        documentreferenceid          = 'BKPFF'
*        createdbyuser                = 'TESTER'
*        businesstransactiontype      = 'RFBU'
*        accountingdocumenttype       = 'SA'
*        documentdate                 = sy-datlo
*        postingdate                  = sy-datlo
*        accountingdocumentheadertext = 'RAP rules'
*        TaxDeterminationDate         = sy-datum
*        TaxReportingDate             = sy-datum
*
*        _glitems                     = VALUE #(
*                             ( glaccountlineitem = |001|
*                               glaccount         = '0063009000'
*                               taxcode           = 'V0'
*                               costcenter        = '0015101101'
*                               taxcountry        = 'JP'
*                               _currencyamount   = VALUE #( ( CurrencyRole = '00' JournalEntryItemAmount = '1000.00'  Currency               = 'JPY' ) ) )
*                             ( glaccountlineitem = |002|
*                               glaccount         = '0012561000'
*                               documentitemtext  = 'Test'
*                               _currencyamount   = VALUE #( ( CurrencyRole = '00' JournalEntryItemAmount = '-1000.00' Currency               = 'JPY' ) ) ) )
*        _taxitems                    = VALUE #(
*                             ( glaccountlineitem = '003'
*                               taxcode           = 'V0'
*                               conditiontype     = 'MWVR'
*                               _currencyamount   = VALUE #(
*                                                            ( CurrencyRole = '00' Currency               = 'JPY'      JournalEntryItemAmount = '0' TaxBaseAmount = '1000000.00' ) ) ) ) ).
*
*    " GL Posting Validation --------------------------
*    READ ENTITIES OF i_journalentrytp
*         ENTITY journalentry
*         EXECUTE validate FROM lt_je_deep
*           " TODO: variable is assigned but never used (ABAP cleaner)
*         RESULT FINAL(lt_check_result)
*         " TODO: variable is assigned but only used in commented-out code (ABAP cleaner)
*         FAILED FINAL(ls_failed_deep)
*         REPORTED FINAL(ls_reported_deep).
*
*    LOOP AT ls_reported_deep-JournalEntry ASSIGNING FIELD-SYMBOL(<ls_reported_deep>).
*      " TODO: variable is assigned but never used (ABAP cleaner)
*      FINAL(lv_result) = <ls_reported_deep>-%msg->if_message~get_text( ).
*    ENDLOOP.
*
*    IF ls_failed_deep IS INITIAL.
*      COMMIT ENTITIES BEGIN IN SIMULATION MODE
*      RESPONSE OF i_journalentrytp
*      FAILED DATA(lt_commit_failed)
*      REPORTED DATA(lt_commit_reported).
*      ...
*      COMMIT ENTITIES END.
*    ENDIF.

*    MODIFY ENTITIES OF I_PurchaseOrderTP_2
*           ENTITY POSubcontractingComponent
*           UPDATE
*           FIELDS ( Material QuantityInEntryUnit )
*           WITH VALUE #( ( %key-PurchaseOrder     = '4500000660'
*                           %key-PurchaseOrderItem = '00010'
*                           %key-ReservationItem   = '0001'
*                           %key-ScheduleLine      = '0001'
*                           Material               = 'TG11'
*                           QuantityInEntryUnit    = 11 ) )
*           " TODO: variable is assigned but never used (ABAP cleaner)
*           FAILED FINAL(lds_failed)
*           " TODO: variable is assigned but never used (ABAP cleaner)
*           REPORTED FINAL(lds_reported).
*
*    COMMIT ENTITIES
*           RESPONSE OF I_PurchaseOrderTP_2
*           " TODO: variable is assigned but never used (ABAP cleaner)
*           FAILED FINAL(lds_commit_failed)
*           " TODO: variable is assigned but never used (ABAP cleaner)
*           REPORTED FINAL(lds_commit_reported).


*    DELETE FROM zf901t_vn.

*    SELECT *
*    FROM zf901t_vn
*    INTO TABLE @DATA(ldt_output).
*
*    MODIFY ENTITIES OF zi_ff901_02_vn
*           ENTITY _detail
*           UPDATE
*           FIELDS ( LogMessage LogStatus AccountingDocument FiscalYear )
*           WITH VALUE #( FOR lds_zf901t IN ldt_output
*                         ( CompanyCode            = lds_zf901t-company_code
*                           FiscalYearBase         = lds_zf901t-fiscal_year_base
*                           AccountingDocumentBase = lds_zf901t-accounting_document_base
*                           AllocatedLineItem      = lds_zf901t-allocated_line_item
**                           AccountingDocument     = lds_zf901t-accounting_document
**                           FiscalYear             = lds_zf901t-fiscal_year
*                           LogMessage             = 'Test'
*                           LogStatus              = '2'
*                         ) )
*           FAILED FINAL(ldt_failed_d)
*           REPORTED FINAL(ldt_reported_d)
*           MAPPED FINAL(ldt_mapped_d).

*    DELETE FROM zmf003t_03_vn.
*    DATA: lv_id       TYPE sysuuid_x16 VALUE '00112233445566778899AABBCCDDEEFF'.
*
*
*    DATA: lds_data TYPE ztestexport_vn.
*
*    lds_data-id = lv_id.
*    MODIFY ztestexport_vn FROM @lds_data.

*    DELETE FROM zmf007t_01_vn.
*    DELETE FROM zmf007t_02_vn.
*    DELETE FROM zmf007t_03_vn.

*    SELECT * FROM i_taxcode
*    INTO TABLE @DATA(lt_taxcode).

*    SELECT * FROM i_purchaseorderitemapi01
*    INTO TABLE @DATA(lt_po_item).

*    TRY.
*        cl_chdo_read_tools=>changedocument_read(
*                  EXPORTING
*                     i_objectclass    = 'MATERIAL'  " change document object name
**                     it_objectid      = data(ldt_objectid)
**             i_date_of_change = ldf_date_of_change
**            i_time_of_change =
**            i_date_until     =
**            i_time_until     =
**            it_username      =
**            it_read_options  =
*                   IMPORTING
*                     et_cdredadd_tab  = DATA(ldt_cdredadd)    " result returned in table
*                ).
*      CATCH cx_chdo_read_error INTO DATA(lo_error).
*        out->write( lo_error->get_longtext( ) ).
*        "handle exception
*    ENDTRY.
*CATCH cx_chdo_read_error.

*    DATA:
*      ls_error      TYPE abap_bool,
*      rt_errors     TYPE if_chdo_object_tools_rel=>ty_tr_error_tab,
*      lt_errors_err TYPE LINE OF if_chdo_object_tools_rel=>ty_tr_error_tab,
*      p_it_tcdob    TYPE if_chdo_object_tools_rel=>ty_tcdobdef_tab,
*      p_it_tcdobt   TYPE if_chdo_object_tools_rel=>ty_tcdobtext_tab,
*      p_it_tcdrp    TYPE if_chdo_object_tools_rel=>ty_tcdgen,
*      lt_tcdobt     TYPE if_chdo_object_tools_rel=>ty_tcdobt_tabtyp,
*      ls_tcdob      TYPE LINE OF if_chdo_object_tools_rel=>ty_tcdobdef_tab,
*      ls_tcdobt     TYPE LINE OF if_chdo_object_tools_rel=>ty_tcdobtext_tab.
*    DATA: lr_err                TYPE REF TO cx_chdo_generation_error.
*    ls_tcdob-tabname = 'ZF901T_VN'.
*    ls_tcdob-multcase = ' '.
*    ls_tcdob-docudel = ' '.
*    ls_tcdob-docuins = ' '.
*    ls_tcdob-docud_if = ' '.
*
*    APPEND ls_tcdob TO p_it_tcdob.
*
*    ls_tcdobt-lang_key = 'EN'.
*    ls_tcdobt-object_text = 'Single Case'.
*
*    APPEND ls_tcdobt TO p_it_tcdobt.
*
*    p_it_tcdrp-author = 'X11'.
*    p_it_tcdrp-textcase = 'X'.
*    p_it_tcdrp-devclass = 'ZC_ZF901T_VN_CHDO'.
*
*    CLEAR: rt_errors, lr_err.
*    TRY.
*        cl_chdo_object_tools_rel=>if_chdo_object_tools_rel~create_and_generate_object(
*          EXPORTING
*            iv_object          = 'ZF901T_TEST' " change document object name
*            it_cd_object_def   = p_it_tcdob   " change document object definition
*            it_cd_object_text  = p_it_tcdobt  " change document object text
*            is_cd_object_gen   = p_it_tcdrp   " change document object generation info
*            iv_cl_overwrite    = 'X'          " class overwrite flag
**            iv_corrnr          = '<transport_request>' " transport request number
*          IMPORTING
*            et_errors          = rt_errors    " generation message table
**          et_synt_errors     =
**          et_synt_error_long =
*        ).
*      CATCH cx_chdo_generation_error INTO lr_err.
*        out->write( |Exception occurred: { lr_err->get_text( ) }| ).
*        ls_error = 'X'.
*    ENDTRY.
*    IF ls_error IS INITIAL.
*      READ TABLE rt_errors WITH KEY kind = 'E-'
*                               INTO lt_errors_err.
*      IF sy-subrc IS INITIAL.
*        out->write( |Exception occurred: { lt_errors_err-text } | ).
*      ELSE.
*        out->write( |Change document object created and generated | ).
*      ENDIF.
*    ENDIF.
  ENDMETHOD.
ENDCLASS.
