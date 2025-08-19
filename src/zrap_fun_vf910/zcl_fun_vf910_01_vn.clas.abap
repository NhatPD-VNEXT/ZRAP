CLASS zcl_fun_vf910_01_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    INTERFACES if_apj_dt_exec_object .
    INTERFACES if_apj_rt_exec_object .
    INTERFACES if_oo_adt_classrun .

    METHODS constructor.
  PROTECTED SECTION.

  PRIVATE SECTION.

    TYPES:
      BEGIN OF gts_vbeln_range,
        sign   TYPE c LENGTH 1, "I: インクルード, E: 除外
        option TYPE c LENGTH 2, "EQ: 等しい, BT: 範囲, CP: 包含
        low    TYPE vbeln,          "プラントの下限
        high   TYPE vbeln,          "プラントの上限
      END OF gts_vbeln_range,

      BEGIN OF gts_budat_range,
        sign   TYPE c LENGTH 1, "I: インクルード, E: 除外
        option TYPE c LENGTH 2, "EQ: 等しい, BT: 範囲, CP: 包含
        low    TYPE banfn,      "購買依頼番号の下限
        high   TYPE banfn,      "購買依頼番号の上限
      END OF gts_budat_range.

    CONSTANTS application_log_object_name   TYPE if_bali_object_handler=>ty_object VALUE 'ZAL_VI908_01'.
    CONSTANTS application_log_sub_obj1_name TYPE if_bali_object_handler=>ty_object VALUE 'JOB'.

    CLASS-DATA:
      out             TYPE REF TO if_oo_adt_classrun_out,
      application_log TYPE REF TO if_bali_log.

    "ジョブパラメータからのデータ取得
    METHODS m_move_to_range
      IMPORTING
        it_sel   TYPE if_apj_rt_exec_object=>tt_templ_val
        if_key   TYPE if_apj_dt_exec_object=>ty_templ_val-selname
      CHANGING
        ct_range TYPE STANDARD TABLE.
ENDCLASS.



CLASS ZCL_FUN_VF910_01_VN IMPLEMENTATION.


  METHOD constructor.
    TRY.
        application_log =
          cl_bali_log=>create_with_header(
            header = cl_bali_header_setter=>create(
              object       = application_log_object_name
              subobject    = application_log_sub_obj1_name
              external_id  = ''
          ) ).

      CATCH cx_bali_runtime.
    ENDTRY.
  ENDMETHOD.


  METHOD if_apj_rt_exec_object~execute.

    DATA:
      ldr_vbeln TYPE STANDARD TABLE OF gts_vbeln_range,
      ldr_budat TYPE STANDARD TABLE OF gts_budat_range.

    "パラメーター値の設定
    m_move_to_range(
      EXPORTING
        it_sel   = it_parameters
        if_key   = 'S_VBELN'
      CHANGING
        ct_range = ldr_vbeln
    ).

    m_move_to_range(
      EXPORTING
        it_sel   = it_parameters
        if_key   = 'P_BUDAT'
      CHANGING
        ct_range = ldr_budat
    ).

    "get data
    SELECT *
    FROM i_purchaseorderitemapi01 WITH PRIVILEGED ACCESS
    WHERE purchaseorder IN @ldr_vbeln
    INTO TABLE @DATA(ldt_purchaseorderitem).

    SELECT *
    FROM i_suplrinvcitempurordrefapi01
    WHERE purchaseorder IN @ldr_vbeln
    INTO TABLE @DATA(ldt_suplrinvcitempurordref).

    SORT ldt_purchaseorderitem.
    DATA(lds_purchaseorderitem) = ldt_purchaseorderitem[ 1 ].

    DATA:
      ldt_create TYPE TABLE FOR ACTION IMPORT i_supplierinvoicetp~create,
      lds_create TYPE STRUCTURE FOR ACTION IMPORT i_supplierinvoicetp~create.

*    lds_create-%cid                                  = '00001'.                                 "GUID: s-innovations の MM サプライヤ請求書
*    lds_create-%param-supplierinvoiceiscreditmemo    = abap_false.                             "クレジットメモである
*    lds_create-%param-companycode                    = lds_purchaseorderitem-companycode.          "会社コード
*    lds_create-%param-documentdate                   = sy-datum.       "伝票の請求書日付
*    lds_create-%param-postingdate                    = ldr_budat[ 1 ]-low.          "伝票の転記日付
*    lds_create-%param-invoicegrossamount             = 100.   "伝票通貨での請求書総額
*    lds_create-%param-invoicingparty                 = lds_purchaseorderitem-documentcurrency.       "他請求元
**    lds_create-%param-supplierinvoiceidbyinvcgparty  = lds_purchaseorderitem-supplierinvoiceidbyinvcgparty.     "参照伝票番号
*    lds_create-%param-documentcurrency               = lds_purchaseorderitem-documentcurrency.            "通貨コード
**    lds_create-%param-documentheadertext             = lds_purchaseorderitem-documentheadertext.                "伝票ヘッダテキスト
**    lds_create-%param-supplierpostinglineitemtext    = lds_purchaseorderitem-supplierpostinglineitemtext.       "明細テキスト
*    lds_create-%param-accountingdocumenttype         = 'RE'.            "伝票タイプ
**    lds_create-%param-taxiscalculatedautomatically   = lds_purchaseorderitem-taxiscalculatedautomatically.      "税額自動計算
**    lds_create-%param-taxdeterminationdate           = lds_purchaseorderitem-postingdate.                       "税率定義の日付
*
*    APPEND VALUE #(
*    supplierinvoiceitem         = '10'             "請求書伝票の伝票明細
*    purchaseorder               = lds_purchaseorderitem-purchaseorder                   "買伝票番号
*    purchaseorderitem           = lds_purchaseorderitem-purchaseorderitem               "購買伝票の明細番号
*    referencedocument           = '5000000739'               "参照伝票の伝票番号
*    referencedocumentfiscalyear = '2025'                     "会計年度
*    referencedocumentitem       = '0001'                     "参照伝票の明細
*    documentcurrency            = lds_purchaseorderitem-documentcurrency                 "通貨コード
*    supplierinvoiceitemamount   = 100                                                   "伝票通貨額
*    taxcode                     = lds_purchaseorderitem-taxcode                         "消費税コード
*    quantityinpurchaseorderunit = lds_purchaseorderitem-orderquantity     "購買発注価格単位での数量
**    supplierinvoiceitemtext     = lds_purchaseorderitem-supplierinvoiceitemtext         "明細テキスト
*    "v1.01
*    suplrinvcissubsqntdebitcrdt = abap_true
*
*    ) TO lds_create-%param-_itemswithporeference.

    TRY.
        DATA(lv_cid) = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ).
      CATCH cx_uuid_error.
        "Error handling
    ENDTRY.

    lds_create-%cid                                 = lv_cid.
    lds_create-%param-supplierinvoiceiscreditmemo   = abap_false.
    lds_create-%param-companycode                   = lds_purchaseorderitem-companycode.
    lds_create-%param-invoicingparty                = '0015401510'.
    lds_create-%param-postingdate                   = '20250808'.
    lds_create-%param-documentdate                  = '20250808'.
    lds_create-%param-documentcurrency              = lds_purchaseorderitem-documentcurrency.
    lds_create-%param-invoicegrossamount            = 100.
    lds_create-%param-taxiscalculatedautomatically  = abap_true.
    lds_create-%param-supplierinvoiceidbyinvcgparty = 'INV0001'.
    lds_create-%param-taxiscalculatedautomatically   = abap_true.      "税額自動計算
    lds_create-%param-taxdeterminationdate           = '20250808'.                       "税率定義の日付

    lds_create-%param-_itemswithporeference = VALUE #(
      ( supplierinvoiceitem         = '00001'
        purchaseorder               = lds_purchaseorderitem-purchaseorder
        purchaseorderitem           = '010'
        documentcurrency            = lds_purchaseorderitem-documentcurrency
        supplierinvoiceitemamount   = 100
        purchaseorderquantityunit   = 'ST'
        quantityinpurchaseorderunit = 200
        taxcode                     = 'V0'
        referencedocument           = '5000000739'
        referencedocumentfiscalyear = '2025'
        referencedocumentitem       = '0001' )
     ).
    INSERT lds_create INTO TABLE ldt_create.

*   請求照合伝票の作成
    MODIFY ENTITIES OF i_supplierinvoicetp
            ENTITY supplierinvoice
            EXECUTE create FROM ldt_create
            FAILED DATA(ldt_failed_early)
            REPORTED DATA(ldt_reported_early)
            MAPPED DATA(ldt_mapped_early).

    IF ldt_failed_early IS INITIAL.
      COMMIT ENTITIES
      RESPONSE OF i_supplierinvoicetp
      FAILED DATA(ldt_failed_late)
      REPORTED DATA(ldt_reported_late).
    ELSE.
      DATA: lds_message TYPE string.

      LOOP AT ldt_reported_early-supplierinvoice INTO DATA(lds_reported_late_supply).
        "エラーメッセージの取得
        DATA(ldf_message) = lds_reported_late_supply-%msg->if_message~get_text( ).
        IF ldf_message IS NOT INITIAL.
          CONDENSE ldf_message.
        ENDIF.
        IF lds_message IS INITIAL.
          lds_message = |{ ldf_message }|.
        ELSEIF ldf_message IS NOT INITIAL.
          lds_message = |{ lds_message } / { ldf_message }|.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD if_apj_dt_exec_object~get_parameters.
    et_parameter_def = VALUE #(
        (
        kind           = if_apj_dt_exec_object=>select_option
        datatype       = 'C'
        length         = '10'
        selname        = 'S_VBELN'
        changeable_ind = abap_true
        mandatory_ind  = abap_false
        param_text     = 'Purchasing Document'
        )

        (
        kind           = if_apj_dt_exec_object=>parameter
        datatype       = 'D'
        length         = '8'
        selname        = 'P_BUDAT'
        changeable_ind = abap_true
        mandatory_ind  = abap_true
        param_text     = 'Posting Date'
        )
    ).
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    TRY.
        me->out = out.
        DATA: lt_sel   TYPE if_apj_rt_exec_object=>tt_templ_val.

        lt_sel = VALUE #(

            ( selname = 'S_VBELN'
              kind    = if_apj_dt_exec_object=>select_option
              sign    = 'I'
              option  = 'EQ'
              low     = '4500001409' )

            ( selname = 'P_BUDAT'
              kind    = if_apj_dt_exec_object=>select_option
              sign    = 'I'
              option  = 'EQ'
              low     = '20250808'
            )

        ).

        if_apj_rt_exec_object~execute( lt_sel ).
      CATCH cx_root INTO DATA(lds_cx_root).
        DATA(ldf_emsg) = lds_cx_root->get_text(  ).
    ENDTRY.
  ENDMETHOD.


  METHOD m_move_to_range.
    LOOP AT it_sel INTO DATA(lw_sel) WHERE selname = if_key.
      APPEND INITIAL LINE TO ct_range ASSIGNING FIELD-SYMBOL(<fs_range>).
      MOVE-CORRESPONDING lw_sel TO <fs_range>.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
