"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>com.sap.gateway.srvd_a2x.api_purchaseorder_2.v0001</em>
CLASS zsc_rap_comsum_model_vn_001 DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for primitive collection fields</p>
      BEGIN OF tys_types_for_prim_colls,
        "! additionalTargets
        "! Used for TYS_SAP_MESSAGE-ADDITIONAL_TARGETS
        additional_targets TYPE string,
      END OF tys_types_for_prim_colls.

    TYPES:
      "! <p class="shorttext synchronized">D_PurOrdGetOutputBinaryDataR</p>
      BEGIN OF tys_d_pur_ord_get_output_binar,
        "! MimeType
        mime_type            TYPE c LENGTH 128,
        "! OutputBinaryData
        output_binary_data   TYPE xstring,
        "! OutputChannel
        output_channel       TYPE c LENGTH 5,
        "! OutputDocumentName
        output_document_name TYPE c LENGTH 120,
        "! Recipient
        recipient            TYPE c LENGTH 10,
        "! RecipientRole
        recipient_role       TYPE c LENGTH 2,
      END OF tys_d_pur_ord_get_output_binar,
      "! <p class="shorttext synchronized">List of D_PurOrdGetOutputBinaryDataR</p>
      tyt_d_pur_ord_get_output_binar TYPE STANDARD TABLE OF tys_d_pur_ord_get_output_binar WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SAP_MESSAGE</p>
      BEGIN OF tys_value_controls_1,
        "! TARGET
        target       TYPE /iwbep/v4_value_control,
        "! LONGTEXT_URL
        longtext_url TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Message</p>
      BEGIN OF tys_sap_message,
        "! <em>Value Control Structure</em>
        value_controls     TYPE tys_value_controls_1,
        "! code
        code               TYPE string,
        "! message
        message            TYPE string,
        "! target
        target             TYPE string,
        "! additionalTargets
        additional_targets TYPE STANDARD TABLE OF tys_types_for_prim_colls-additional_targets WITH DEFAULT KEY,
        "! transition
        transition         TYPE abap_bool,
        "! numericSeverity
        numeric_severity   TYPE int1,
        "! longtextUrl
        longtext_url       TYPE string,
      END OF tys_sap_message,
      "! <p class="shorttext synchronized">List of SAP__Message</p>
      tyt_sap_message TYPE STANDARD TABLE OF tys_sap_message WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PURCHASE_ORDER_ITEM_TYPE</p>
      BEGIN OF tys_value_controls_2,
        "! GOODS_RECEIPT_LATEST_CREAT
        goods_receipt_latest_creat TYPE /iwbep/v4_value_control,
        "! TAX_DETERMINATION_DATE
        tax_determination_date     TYPE /iwbep/v4_value_control,
        "! PURG_DOC_PRICE_DATE
        purg_doc_price_date        TYPE /iwbep/v4_value_control,
        "! DOWN_PAYMENT_DUE_DATE
        down_payment_due_date      TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_INVOICING_P
        purchase_order_invoicing_p TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_ITEM_NOTE
        purchase_order_item_note   TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_SCHEDULE_LI
        purchase_order_schedule_li TYPE /iwbep/v4_value_control,
        "! PUR_ORD_ACCOUNT_ASSIGNMENT
        pur_ord_account_assignment TYPE /iwbep/v4_value_control,
        "! PUR_ORD_PRICING_ELEMENT
        pur_ord_pricing_element    TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_2.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PURCHASE_ORDER_PARTNER_TYP</p>
      BEGIN OF tys_value_controls_3,
        "! CREATION_DATE
        creation_date TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_3.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PURCHASE_ORDER_INVOICING_3</p>
      BEGIN OF tys_value_controls_4,
        "! INVOICING_PLAN_START_DATE
        invoicing_plan_start_date TYPE /iwbep/v4_value_control,
        "! INVOICING_PLAN_END_DATE
        invoicing_plan_end_date   TYPE /iwbep/v4_value_control,
        "! POINVOICING_PLAN_ITEM
        poinvoicing_plan_item     TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_4.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PURCHASE_ORDER_SCHEDULE__2</p>
      BEGIN OF tys_value_controls_5,
        "! SCHEDULE_LINE_DELIVERY_DAT
        schedule_line_delivery_dat TYPE /iwbep/v4_value_control,
        "! SCHED_LINE_STSC_DELIVERY_D
        sched_line_stsc_delivery_d TYPE /iwbep/v4_value_control,
        "! PERFORMANCE_PERIOD_START_D
        performance_period_start_d TYPE /iwbep/v4_value_control,
        "! PERFORMANCE_PERIOD_END_DAT
        performance_period_end_dat TYPE /iwbep/v4_value_control,
        "! SCHEDULE_LINE_ORDER_DATE
        schedule_line_order_date   TYPE /iwbep/v4_value_control,
        "! PRODUCT_AVAILABILITY_DATE
        product_availability_date  TYPE /iwbep/v4_value_control,
        "! LOADING_DATE
        loading_date               TYPE /iwbep/v4_value_control,
        "! TRANSPORTATION_PLANNING_DA
        transportation_planning_da TYPE /iwbep/v4_value_control,
        "! GOODS_ISSUE_DATE
        goods_issue_date           TYPE /iwbep/v4_value_control,
        "! SUBCONTRACTING_COMPONENT
        subcontracting_component   TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_5.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of POSUBCONTRACTING_COMPONE_2</p>
      BEGIN OF tys_value_controls_6,
        "! REQUIREMENT_DATE
        requirement_date        TYPE /iwbep/v4_value_control,
        "! LATEST_REQUIREMENT_DATE
        latest_requirement_date TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_6.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PUR_ORDER_ITEM_PRICING_E_2</p>
      BEGIN OF tys_value_controls_7,
        "! PRICE_CONDITION_DETERMINAT
        price_condition_determinat TYPE /iwbep/v4_value_control,
        "! CONFIGBL_PARAMETERS_AND_FO
        configbl_parameters_and_fo TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_7.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PURCHASE_ORDER_ACCOUNT_A_2</p>
      BEGIN OF tys_value_controls_8,
        "! SETTLEMENT_REFERENCE_DATE
        settlement_reference_date TYPE /iwbep/v4_value_control,
        "! VALIDITY_DATE
        validity_date             TYPE /iwbep/v4_value_control,
        "! CREATION_DATE
        creation_date             TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_8.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PURCHASE_ORDER_TYPE</p>
      BEGIN OF tys_value_controls_9,
        "! CREATION_DATE
        creation_date             TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_DATE
        purchase_order_date       TYPE /iwbep/v4_value_control,
        "! LAST_CHANGE_DATE_TIME
        last_change_date_time     TYPE /iwbep/v4_value_control,
        "! VALIDITY_START_DATE
        validity_start_date       TYPE /iwbep/v4_value_control,
        "! VALIDITY_END_DATE
        validity_end_date         TYPE /iwbep/v4_value_control,
        "! QUOTATION_SUBMISSION_DATE
        quotation_submission_date TYPE /iwbep/v4_value_control,
        "! DOWN_PAYMENT_DUE_DATE
        down_payment_due_date     TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_ITEM
        purchase_order_item       TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_NOTE
        purchase_order_note       TYPE /iwbep/v4_value_control,
        "! PURCHASE_ORDER_PARTNER
        purchase_order_partner    TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_9.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of POINVOICING_PLAN_ITEM_TYPE</p>
      BEGIN OF tys_value_controls_10,
        "! INVOICING_PLAN_SETTLEMENT
        invoicing_plan_settlement  TYPE /iwbep/v4_value_control,
        "! INVOICING_PLAN_SETTLEMEN_2
        invoicing_plan_settlemen_2 TYPE /iwbep/v4_value_control,
        "! INVOICING_PLAN_INVOICING_D
        invoicing_plan_invoicing_d TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_10.

    TYPES:
      "! <p class="shorttext synchronized">POInvoicingPlanItem_Type</p>
      BEGIN OF tys_poinvoicing_plan_item_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_10,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> InvoicingPlanItem
        invoicing_plan_item        TYPE c LENGTH 6,
        "! <em>Key property</em> InvoicingPlan
        invoicing_plan             TYPE c LENGTH 10,
        "! InvoicingPlanSettlementFromDte
        invoicing_plan_settlement  TYPE datn,
        "! InvoicingPlanSettlementToDte
        invoicing_plan_settlemen_2 TYPE datn,
        "! InvoicingPlanInvoicingDate
        invoicing_plan_invoicing_d TYPE datn,
        "! InvoicingPlanAmount
        invoicing_plan_amount      TYPE decfloat16,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 3,
        "! PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! PurchasingGroup
        purchasing_group           TYPE c LENGTH 3,
        "! PurchaseOrderType
        purchase_order_type        TYPE c LENGTH 4,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_poinvoicing_plan_item_type,
      "! <p class="shorttext synchronized">List of POInvoicingPlanItem_Type</p>
      tyt_poinvoicing_plan_item_type TYPE STANDARD TABLE OF tys_poinvoicing_plan_item_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">POSubcontractingComponent_Type</p>
      BEGIN OF tys_posubcontracting_compone_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_6,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> ScheduleLine
        schedule_line              TYPE c LENGTH 4,
        "! <em>Key property</em> ReservationItem
        reservation_item           TYPE c LENGTH 4,
        "! <em>Key property</em> RecordType
        record_type                TYPE c LENGTH 1,
        "! Material
        material                   TYPE c LENGTH 18,
        "! IsMaterialProvision
        is_material_provision      TYPE abap_bool,
        "! MaterialProvisionType
        material_provision_type    TYPE c LENGTH 1,
        "! MaterialQtyToBaseQtyNmrtr
        material_qty_to_base_qty_n TYPE p LENGTH 3 DECIMALS 0,
        "! MaterialQtyToBaseQtyDnmntr
        material_qty_to_base_qty_d TYPE p LENGTH 3 DECIMALS 0,
        "! MaterialRevisionLevel
        material_revision_level    TYPE c LENGTH 2,
        "! MaterialCompIsVariableSized
        material_comp_is_variable  TYPE abap_bool,
        "! MaterialComponentIsPhantomItem
        material_component_is_phan TYPE abap_bool,
        "! Reservation
        reservation                TYPE c LENGTH 10,
        "! RequiredQuantity
        required_quantity          TYPE p LENGTH 7 DECIMALS 3,
        "! RequirementDate
        requirement_date           TYPE datn,
        "! RequirementTime
        requirement_time           TYPE timn,
        "! ReservationIsFinallyIssued
        reservation_is_finally_iss TYPE abap_bool,
        "! BaseUnit
        base_unit                  TYPE c LENGTH 3,
        "! QuantityInEntryUnit
        quantity_in_entry_unit     TYPE p LENGTH 7 DECIMALS 3,
        "! EntryUnit
        entry_unit                 TYPE c LENGTH 3,
        "! VariableSizeItemQuantity
        variable_size_item_quantit TYPE p LENGTH 7 DECIMALS 3,
        "! VariableSizeItemUnit
        variable_size_item_unit    TYPE c LENGTH 3,
        "! VariableSizeComponentUnit
        variable_size_component_un TYPE c LENGTH 3,
        "! VariableSizeComponentQuantity
        variable_size_component_qu TYPE p LENGTH 7 DECIMALS 3,
        "! UnitOfMeasureForSize1To3
        unit_of_measure_for_size_1 TYPE c LENGTH 3,
        "! Size1
        size_1                     TYPE p LENGTH 7 DECIMALS 3,
        "! Size2
        size_2                     TYPE p LENGTH 7 DECIMALS 3,
        "! Size3
        size_3                     TYPE p LENGTH 7 DECIMALS 3,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! LatestRequirementDate
        latest_requirement_date    TYPE datn,
        "! OrderLevelValue
        order_level_value          TYPE c LENGTH 2,
        "! OrderPathValue
        order_path_value           TYPE c LENGTH 2,
        "! BillOfMaterialItemNumber
        bill_of_material_item_numb TYPE c LENGTH 4,
        "! MatlCompFreeDefinedAttribute
        matl_comp_free_defined_att TYPE c LENGTH 10,
        "! BOMItemCategory
        bomitem_category           TYPE c LENGTH 1,
        "! IsBulkMaterialComponent
        is_bulk_material_component TYPE abap_bool,
        "! AccountAssignmentCategory
        account_assignment_categor TYPE c LENGTH 1,
        "! InventorySpecialStockType
        inventory_special_stock_ty TYPE c LENGTH 1,
        "! ConsumptionPosting
        consumption_posting        TYPE c LENGTH 1,
        "! InventorySpecialStockValnType
        inventory_special_stock_va TYPE c LENGTH 1,
        "! DebitCreditCode
        debit_credit_code          TYPE c LENGTH 1,
        "! WithdrawnQuantity
        withdrawn_quantity         TYPE p LENGTH 7 DECIMALS 3,
        "! QuantityIsFixed
        quantity_is_fixed          TYPE abap_bool,
        "! ComponentScrapInPercent
        component_scrap_in_percent TYPE p LENGTH 3 DECIMALS 2,
        "! OperationScrapInPercent
        operation_scrap_in_percent TYPE p LENGTH 3 DECIMALS 2,
        "! IsNetScrap
        is_net_scrap               TYPE abap_bool,
        "! LeadTimeOffset
        lead_time_offset           TYPE p LENGTH 2 DECIMALS 0,
        "! QuantityDistributionKey
        quantity_distribution_key  TYPE c LENGTH 4,
        "! FormulaKey
        formula_key                TYPE c LENGTH 2,
        "! StorageLocation
        storage_location           TYPE c LENGTH 4,
        "! ProductionSupplyArea
        production_supply_area     TYPE c LENGTH 10,
        "! Batch
        batch                      TYPE c LENGTH 10,
        "! BOMItemDescription
        bomitem_description        TYPE c LENGTH 40,
        "! BOMItemText2
        bomitem_text_2             TYPE c LENGTH 40,
        "! ChangeNumber
        change_number              TYPE c LENGTH 12,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_posubcontracting_compone_2,
      "! <p class="shorttext synchronized">List of POSubcontractingComponent_Type</p>
      tyt_posubcontracting_compone_2 TYPE STANDARD TABLE OF tys_posubcontracting_compone_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderAccountAssignment_Type</p>
      BEGIN OF tys_purchase_order_account_a_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_8,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> AccountAssignmentNumber
        account_assignment_number  TYPE c LENGTH 2,
        "! CostCenter
        cost_center                TYPE c LENGTH 10,
        "! MasterFixedAsset
        master_fixed_asset         TYPE c LENGTH 12,
        "! ProjectNetwork
        project_network            TYPE c LENGTH 12,
        "! NetworkActivity
        network_activity           TYPE c LENGTH 4,
        "! OrderQuantityUnit
        order_quantity_unit        TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! MultipleAcctAssgmtDistrPercent
        multiple_acct_assgmt_distr TYPE p LENGTH 2 DECIMALS 1,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 3,
        "! PurgDocNetAmount
        purg_doc_net_amount        TYPE decfloat16,
        "! IsDeleted
        is_deleted                 TYPE abap_bool,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! SalesOrderScheduleLine
        sales_order_schedule_line  TYPE c LENGTH 4,
        "! FixedAsset
        fixed_asset                TYPE c LENGTH 4,
        "! OrderID
        order_id                   TYPE c LENGTH 12,
        "! UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! CostObject
        cost_object                TYPE c LENGTH 12,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! WBSElementInternalID
        wbselement_internal_id     TYPE c LENGTH 8,
        "! WBSElementExternalID
        wbselement_external_id     TYPE c LENGTH 24,
        "! ProjectNetworkInternalID
        project_network_internal_i TYPE c LENGTH 10,
        "! CommitmentItemShortID
        commitment_item_short_id   TYPE c LENGTH 14,
        "! FundsCenter
        funds_center               TYPE c LENGTH 16,
        "! Fund
        fund                       TYPE c LENGTH 10,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! GoodsRecipientName
        goods_recipient_name       TYPE c LENGTH 12,
        "! IsFinallyInvoiced
        is_finally_invoiced        TYPE abap_bool,
        "! NetworkActivityInternalID
        network_activity_internal  TYPE c LENGTH 8,
        "! PartnerAccountNumber
        partner_account_number     TYPE c LENGTH 10,
        "! JointVentureRecoveryCode
        joint_venture_recovery_cod TYPE c LENGTH 2,
        "! SettlementReferenceDate
        settlement_reference_date  TYPE datn,
        "! OrderInternalID
        order_internal_id          TYPE c LENGTH 10,
        "! OrderIntBillOfOperationsItem
        order_int_bill_of_operatio TYPE c LENGTH 8,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! NonDeductibleInputTaxAmount
        non_deductible_input_tax_a TYPE decfloat16,
        "! CostCtrActivityType
        cost_ctr_activity_type     TYPE c LENGTH 6,
        "! BusinessProcess
        business_process           TYPE c LENGTH 12,
        "! GrantID
        grant_id                   TYPE c LENGTH 20,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
        "! EarmarkedFundsDocument
        earmarked_funds_document   TYPE c LENGTH 10,
        "! EarmarkedFundsDocumentItem
        earmarked_funds_document_i TYPE c LENGTH 3,
        "! ValidityDate
        validity_date              TYPE datn,
        "! ChartOfAccounts
        chart_of_accounts          TYPE c LENGTH 4,
        "! ServiceDocumentType
        service_document_type      TYPE c LENGTH 4,
        "! ServiceDocument
        service_document           TYPE c LENGTH 10,
        "! ServiceDocumentItem
        service_document_item      TYPE c LENGTH 6,
        "! CreationDate
        creation_date              TYPE datn,
        "! IsAcctLineFinal
        is_acct_line_final         TYPE abap_bool,
        "! AcctLineFinalReason
        acct_line_final_reason     TYPE c LENGTH 2,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_account_a_2,
      "! <p class="shorttext synchronized">List of PurchaseOrderAccountAssignment_Type</p>
      tyt_purchase_order_account_a_2 TYPE STANDARD TABLE OF tys_purchase_order_account_a_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderInvoicingPlan_Type</p>
      BEGIN OF tys_purchase_order_invoicing_3,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_4,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> InvoicingPlan
        invoicing_plan             TYPE c LENGTH 10,
        "! InvoicingPlanType
        invoicing_plan_type        TYPE c LENGTH 2,
        "! InvoicingPlanStartDate
        invoicing_plan_start_date  TYPE datn,
        "! InvoicingPlanEndDate
        invoicing_plan_end_date    TYPE datn,
        "! InvoicingPlanNextInvcDateRule
        invoicing_plan_next_invc_d TYPE c LENGTH 2,
        "! PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! PurchasingGroup
        purchasing_group           TYPE c LENGTH 3,
        "! PurchaseOrderType
        purchase_order_type        TYPE c LENGTH 4,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_invoicing_3,
      "! <p class="shorttext synchronized">List of PurchaseOrderInvoicingPlan_Type</p>
      tyt_purchase_order_invoicing_3 TYPE STANDARD TABLE OF tys_purchase_order_invoicing_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderItemNote_Type</p>
      BEGIN OF tys_purchase_order_item_note_t,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> TextObjectType
        text_object_type           TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language                   TYPE c LENGTH 2,
        "! PlainLongText
        plain_long_text            TYPE string,
        "! PurchaseOrderItemUniqueID
        purchase_order_item_unique TYPE c LENGTH 15,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_item_note_t,
      "! <p class="shorttext synchronized">List of PurchaseOrderItemNote_Type</p>
      tyt_purchase_order_item_note_t TYPE STANDARD TABLE OF tys_purchase_order_item_note_t WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderItem_Type</p>
      BEGIN OF tys_purchase_order_item_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_2,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! PurchaseOrderCategory
        purchase_order_category    TYPE c LENGTH 1,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 3,
        "! PurchasingDocumentDeletionCode
        purchasing_document_deleti TYPE c LENGTH 1,
        "! MaterialGroup
        material_group             TYPE c LENGTH 9,
        "! Material
        material                   TYPE c LENGTH 18,
        "! MaterialType
        material_type              TYPE c LENGTH 4,
        "! SupplierMaterialNumber
        supplier_material_number   TYPE c LENGTH 35,
        "! SupplierSubrange
        supplier_subrange          TYPE c LENGTH 6,
        "! ManufacturerPartNmbr
        manufacturer_part_nmbr     TYPE c LENGTH 40,
        "! Manufacturer
        manufacturer               TYPE c LENGTH 10,
        "! ManufacturerMaterial
        manufacturer_material      TYPE c LENGTH 18,
        "! PurchaseOrderItemText
        purchase_order_item_text   TYPE c LENGTH 40,
        "! ProductTypeCode
        product_type_code          TYPE c LENGTH 2,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! ManualDeliveryAddressID
        manual_delivery_address_id TYPE c LENGTH 10,
        "! ReferenceDeliveryAddressID
        reference_delivery_address TYPE c LENGTH 10,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! Subcontractor
        subcontractor              TYPE c LENGTH 10,
        "! SupplierIsSubcontractor
        supplier_is_subcontractor  TYPE abap_bool,
        "! CrossPlantConfigurableProduct
        cross_plant_configurable_p TYPE c LENGTH 18,
        "! ArticleCategory
        article_category           TYPE c LENGTH 2,
        "! PlndOrderReplnmtElmntType
        plnd_order_replnmt_elmnt_t TYPE c LENGTH 1,
        "! ProductPurchasePointsQtyUnit
        product_purchase_points_qt TYPE c LENGTH 3,
        "! ProductPurchasePointsQty
        product_purchase_points__2 TYPE p LENGTH 7 DECIMALS 3,
        "! StorageLocation
        storage_location           TYPE c LENGTH 4,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! OrderItemQtyToBaseQtyNmrtr
        order_item_qty_to_base_qty TYPE p LENGTH 3 DECIMALS 0,
        "! OrderItemQtyToBaseQtyDnmntr
        order_item_qty_to_base_q_2 TYPE p LENGTH 3 DECIMALS 0,
        "! NetPriceQuantity
        net_price_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! IsCompletelyDelivered
        is_completely_delivered    TYPE abap_bool,
        "! IsFinallyInvoiced
        is_finally_invoiced        TYPE abap_bool,
        "! GoodsReceiptIsExpected
        goods_receipt_is_expected  TYPE abap_bool,
        "! InvoiceIsExpected
        invoice_is_expected        TYPE abap_bool,
        "! IsOrderAcknRqd
        is_order_ackn_rqd          TYPE abap_bool,
        "! InvoiceIsGoodsReceiptBased
        invoice_is_goods_receipt_b TYPE abap_bool,
        "! PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! PurchaseRequisition
        purchase_requisition       TYPE c LENGTH 10,
        "! PurchaseRequisitionItem
        purchase_requisition_item  TYPE c LENGTH 5,
        "! RequirementTracking
        requirement_tracking       TYPE c LENGTH 10,
        "! SupplierQuotation
        supplier_quotation         TYPE c LENGTH 10,
        "! SupplierQuotationItem
        supplier_quotation_item    TYPE c LENGTH 5,
        "! EvaldRcptSettlmtIsAllowed
        evald_rcpt_settlmt_is_allo TYPE abap_bool,
        "! UnlimitedOverdeliveryIsAllowed
        unlimited_overdelivery_is  TYPE abap_bool,
        "! OverdelivTolrtdLmtRatioInPct
        overdeliv_tolrtd_lmt_ratio TYPE p LENGTH 2 DECIMALS 1,
        "! UnderdelivTolrtdLmtRatioInPct
        underdeliv_tolrtd_lmt_rati TYPE p LENGTH 2 DECIMALS 1,
        "! RequisitionerName
        requisitioner_name         TYPE c LENGTH 12,
        "! PlannedDeliveryDurationInDays
        planned_delivery_duration  TYPE p LENGTH 2 DECIMALS 0,
        "! GoodsReceiptDurationInDays
        goods_receipt_duration_in  TYPE p LENGTH 2 DECIMALS 0,
        "! PartialDeliveryIsAllowed
        partial_delivery_is_allowe TYPE c LENGTH 1,
        "! ConsumptionPosting
        consumption_posting        TYPE c LENGTH 1,
        "! ServicePerformer
        service_performer          TYPE c LENGTH 10,
        "! ServicePackage
        service_package            TYPE c LENGTH 10,
        "! BaseUnit
        base_unit                  TYPE c LENGTH 3,
        "! PurchaseOrderItemCategory
        purchase_order_item_catego TYPE c LENGTH 1,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! OrderPriceUnit
        order_price_unit           TYPE c LENGTH 3,
        "! ItemVolumeUnit
        item_volume_unit           TYPE c LENGTH 3,
        "! ItemWeightUnit
        item_weight_unit           TYPE c LENGTH 3,
        "! MultipleAcctAssgmtDistribution
        multiple_acct_assgmt_distr TYPE c LENGTH 1,
        "! PartialInvoiceDistribution
        partial_invoice_distributi TYPE c LENGTH 1,
        "! PricingDateControl
        pricing_date_control       TYPE c LENGTH 1,
        "! IsStatisticalItem
        is_statistical_item        TYPE abap_bool,
        "! PurchasingParentItem
        purchasing_parent_item     TYPE c LENGTH 5,
        "! GoodsReceiptLatestCreationDate
        goods_receipt_latest_creat TYPE datn,
        "! IsReturnsItem
        is_returns_item            TYPE abap_bool,
        "! PurchasingOrderReason
        purchasing_order_reason    TYPE c LENGTH 3,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsTransferLocation
        incoterms_transfer_locatio TYPE c LENGTH 28,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! PriorSupplier
        prior_supplier             TYPE c LENGTH 10,
        "! InternationalArticleNumber
        international_article_numb TYPE c LENGTH 18,
        "! IntrastatServiceCode
        intrastat_service_code     TYPE c LENGTH 30,
        "! CommodityCode
        commodity_code             TYPE c LENGTH 30,
        "! MaterialFreightGroup
        material_freight_group     TYPE c LENGTH 8,
        "! DiscountInKindEligibility
        discount_in_kind_eligibili TYPE c LENGTH 1,
        "! PurgItemIsBlockedForDelivery
        purg_item_is_blocked_for_d TYPE abap_bool,
        "! SupplierConfirmationControlKey
        supplier_confirmation_cont TYPE c LENGTH 4,
        "! PurgDocOrderAcknNumber
        purg_doc_order_ackn_number TYPE c LENGTH 20,
        "! PriceIsToBePrinted
        price_is_to_be_printed     TYPE abap_bool,
        "! AccountAssignmentCategory
        account_assignment_categor TYPE c LENGTH 1,
        "! PurchasingInfoRecord
        purchasing_info_record     TYPE c LENGTH 10,
        "! NetAmount
        net_amount                 TYPE decfloat16,
        "! GrossAmount
        gross_amount               TYPE decfloat16,
        "! EffectiveAmount
        effective_amount           TYPE decfloat16,
        "! Subtotal1Amount
        subtotal_1_amount          TYPE decfloat16,
        "! Subtotal2Amount
        subtotal_2_amount          TYPE decfloat16,
        "! Subtotal3Amount
        subtotal_3_amount          TYPE decfloat16,
        "! Subtotal4Amount
        subtotal_4_amount          TYPE decfloat16,
        "! Subtotal5Amount
        subtotal_5_amount          TYPE decfloat16,
        "! Subtotal6Amount
        subtotal_6_amount          TYPE decfloat16,
        "! OrderQuantity
        order_quantity             TYPE p LENGTH 7 DECIMALS 3,
        "! NetPriceAmount
        net_price_amount           TYPE decfloat16,
        "! ItemVolume
        item_volume                TYPE p LENGTH 7 DECIMALS 3,
        "! ItemGrossWeight
        item_gross_weight          TYPE p LENGTH 7 DECIMALS 3,
        "! ItemNetWeight
        item_net_weight            TYPE p LENGTH 7 DECIMALS 3,
        "! OrderPriceUnitToOrderUnitNmrtr
        order_price_unit_to_order  TYPE p LENGTH 3 DECIMALS 0,
        "! OrdPriceUnitToOrderUnitDnmntr
        ord_price_unit_to_order_un TYPE p LENGTH 3 DECIMALS 0,
        "! GoodsReceiptIsNonValuated
        goods_receipt_is_non_valua TYPE abap_bool,
        "! IsToBeAcceptedAtOrigin
        is_to_be_accepted_at_origi TYPE abap_bool,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! ShippingInstruction
        shipping_instruction       TYPE c LENGTH 2,
        "! NonDeductibleInputTaxAmount
        non_deductible_input_tax_a TYPE decfloat16,
        "! StockType
        stock_type                 TYPE c LENGTH 1,
        "! ValuationType
        valuation_type             TYPE c LENGTH 10,
        "! ValuationCategory
        valuation_category         TYPE c LENGTH 1,
        "! ItemIsRejectedBySupplier
        item_is_rejected_by_suppli TYPE abap_bool,
        "! PurgDocPriceDate
        purg_doc_price_date        TYPE datn,
        "! PurchasingInfoRecordUpdateCode
        purchasing_info_record_upd TYPE c LENGTH 1,
        "! InventorySpecialStockType
        inventory_special_stock_ty TYPE c LENGTH 1,
        "! DeliveryDocumentType
        delivery_document_type     TYPE c LENGTH 4,
        "! IssuingStorageLocation
        issuing_storage_location   TYPE c LENGTH 4,
        "! AllocationTable
        allocation_table           TYPE c LENGTH 10,
        "! AllocationTableItem
        allocation_table_item      TYPE c LENGTH 5,
        "! RetailPromotion
        retail_promotion           TYPE c LENGTH 10,
        "! PurgConfigurableItemNumber
        purg_configurable_item_num TYPE c LENGTH 40,
        "! PurgDocAggrgdSubitemCategory
        purg_doc_aggrgd_subitem_ca TYPE c LENGTH 1,
        "! PurgExternalSortNumber
        purg_external_sort_number  TYPE c LENGTH 5,
        "! Batch
        batch                      TYPE c LENGTH 10,
        "! PurchasingItemIsFreeOfCharge
        purchasing_item_is_free_of TYPE abap_bool,
        "! DownPaymentType
        down_payment_type          TYPE c LENGTH 4,
        "! DownPaymentPercentageOfTotAmt
        down_payment_percentage_of TYPE p LENGTH 3 DECIMALS 2,
        "! DownPaymentAmount
        down_payment_amount        TYPE decfloat16,
        "! DownPaymentDueDate
        down_payment_due_date      TYPE datn,
        "! ExpectedOverallLimitAmount
        expected_overall_limit_amo TYPE decfloat16,
        "! OverallLimitAmount
        overall_limit_amount       TYPE decfloat16,
        "! PurContractForOverallLimit
        pur_contract_for_overall_l TYPE c LENGTH 10,
        "! PurContractItemForOverallLimit
        pur_contract_item_for_over TYPE c LENGTH 5,
        "! PurgProdCmplncSupplierStatus
        purg_prod_cmplnc_supplier  TYPE c LENGTH 1,
        "! PurgProductMarketabilityStatus
        purg_product_marketability TYPE c LENGTH 1,
        "! PurgSafetyDataSheetStatus
        purg_safety_data_sheet_sta TYPE c LENGTH 1,
        "! PurgProdCmplncDngrsGoodsStatus
        purg_prod_cmplnc_dngrs_goo TYPE c LENGTH 1,
        "! BR_MaterialOrigin
        br_material_origin         TYPE c LENGTH 1,
        "! BR_MaterialUsage
        br_material_usage          TYPE c LENGTH 1,
        "! BR_CFOPCategory
        br_cfopcategory            TYPE c LENGTH 2,
        "! BR_NCM
        br_ncm                     TYPE c LENGTH 16,
        "! ConsumptionTaxCtrlCode
        consumption_tax_ctrl_code  TYPE c LENGTH 16,
        "! BR_IsProducedInHouse
        br_is_produced_in_house    TYPE abap_bool,
        "! ProductSeasonYear
        product_season_year        TYPE c LENGTH 4,
        "! ProductSeason
        product_season             TYPE c LENGTH 10,
        "! ProductCollection
        product_collection         TYPE c LENGTH 10,
        "! ProductTheme
        product_theme              TYPE c LENGTH 10,
        "! SeasonCompletenessStatus
        season_completeness_status TYPE c LENGTH 1,
        "! ShippingGroupRule
        shipping_group_rule        TYPE c LENGTH 4,
        "! ShippingGroupNumber
        shipping_group_number      TYPE c LENGTH 10,
        "! ProductCharacteristic1
        product_characteristic_1   TYPE c LENGTH 18,
        "! ProductCharacteristic2
        product_characteristic_2   TYPE c LENGTH 18,
        "! ProductCharacteristic3
        product_characteristic_3   TYPE c LENGTH 18,
        "! PurgDocSubitemCategory
        purg_doc_subitem_category  TYPE c LENGTH 1,
        "! DiversionStatus
        diversion_status           TYPE c LENGTH 1,
        "! ReferenceDocumentNumber
        reference_document_number  TYPE c LENGTH 10,
        "! ReferenceDocumentItem
        reference_document_item    TYPE c LENGTH 6,
        "! PurchaseOrderReferenceType
        purchase_order_reference_t TYPE c LENGTH 1,
        "! ItemHasValueAddedService
        item_has_value_added_servi TYPE abap_bool,
        "! ValAddedSrvcParentItmNumber
        val_added_srvc_parent_itm  TYPE c LENGTH 5,
        "! StockSegment
        stock_segment              TYPE c LENGTH 40,
        "! YY1_MMPURDOC_IM_TXT01_PDI
        yy_1_mmpurdoc_im_txt_01_pd TYPE c LENGTH 30,
        "! YY1_MM_PURDOC_ITEM_002_PDI
        yy_1_mm_purdoc_item_002_pd TYPE c LENGTH 20,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_item_type,
      "! <p class="shorttext synchronized">List of PurchaseOrderItem_Type</p>
      tyt_purchase_order_item_type TYPE STANDARD TABLE OF tys_purchase_order_item_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderNote_Type</p>
      BEGIN OF tys_purchase_order_note_type,
        "! <em>Key property</em> PurchaseOrder
        purchase_order   TYPE c LENGTH 10,
        "! <em>Key property</em> TextObjectType
        text_object_type TYPE c LENGTH 4,
        "! <em>Key property</em> Language
        language         TYPE c LENGTH 2,
        "! PlainLongText
        plain_long_text  TYPE string,
        "! odata.etag
        etag             TYPE string,
      END OF tys_purchase_order_note_type,
      "! <p class="shorttext synchronized">List of PurchaseOrderNote_Type</p>
      tyt_purchase_order_note_type TYPE STANDARD TABLE OF tys_purchase_order_note_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderPartner_Type</p>
      BEGIN OF tys_purchase_order_partner_typ,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_3,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PartnerFunction
        partner_function           TYPE c LENGTH 2,
        "! SupplierSubrange
        supplier_subrange          TYPE c LENGTH 6,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! PartnerCounter
        partner_counter            TYPE c LENGTH 3,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! PurchasingDocumentPartnerType
        purchasing_document_partne TYPE c LENGTH 2,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! SupplierHierarchyCategory
        supplier_hierarchy_categor TYPE c LENGTH 1,
        "! SupplierContact
        supplier_contact           TYPE c LENGTH 10,
        "! PersonWorkAgreement
        person_work_agreement      TYPE c LENGTH 8,
        "! EmploymentInternalID
        employment_internal_id     TYPE c LENGTH 8,
        "! DefaultPartner
        default_partner            TYPE abap_bool,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_partner_typ,
      "! <p class="shorttext synchronized">List of PurchaseOrderPartner_Type</p>
      tyt_purchase_order_partner_typ TYPE STANDARD TABLE OF tys_purchase_order_partner_typ WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderScheduleLine_Type</p>
      BEGIN OF tys_purchase_order_schedule__2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_5,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> ScheduleLine
        schedule_line              TYPE c LENGTH 4,
        "! ScheduleLineDeliveryDate
        schedule_line_delivery_dat TYPE datn,
        "! SchedLineStscDeliveryDate
        sched_line_stsc_delivery_d TYPE datn,
        "! PerformancePeriodStartDate
        performance_period_start_d TYPE datn,
        "! PerformancePeriodEndDate
        performance_period_end_dat TYPE datn,
        "! ScheduleLineDeliveryTime
        schedule_line_delivery_tim TYPE timn,
        "! Batch
        batch                      TYPE c LENGTH 10,
        "! BatchBySupplier
        batch_by_supplier          TYPE c LENGTH 15,
        "! ScheduleLineOrderQuantity
        schedule_line_order_quanti TYPE p LENGTH 7 DECIMALS 3,
        "! OpenPurchaseOrderQuantity
        open_purchase_order_quanti TYPE p LENGTH 8 DECIMALS 3,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! Currency
        currency                   TYPE c LENGTH 3,
        "! PurchaseRequisition
        purchase_requisition       TYPE c LENGTH 10,
        "! PurchaseRequisitionItem
        purchase_requisition_item  TYPE c LENGTH 5,
        "! DelivDateCategory
        deliv_date_category        TYPE c LENGTH 1,
        "! ScheduleLineOrderDate
        schedule_line_order_date   TYPE datn,
        "! ProductAvailabilityDate
        product_availability_date  TYPE datn,
        "! LoadingDate
        loading_date               TYPE datn,
        "! LoadingTime
        loading_time               TYPE timn,
        "! TransportationPlanningDate
        transportation_planning_da TYPE datn,
        "! TransportationPlanningTime
        transportation_planning_ti TYPE timn,
        "! GoodsIssueDate
        goods_issue_date           TYPE datn,
        "! GoodsIssueTime
        goods_issue_time           TYPE timn,
        "! RouteSchedule
        route_schedule             TYPE c LENGTH 10,
        "! ProductAvailabilityTime
        product_availability_time  TYPE timn,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_schedule__2,
      "! <p class="shorttext synchronized">List of PurchaseOrderScheduleLine_Type</p>
      tyt_purchase_order_schedule__2 TYPE STANDARD TABLE OF tys_purchase_order_schedule__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrderSupplierAddress_Type</p>
      BEGIN OF tys_purchase_order_supplier__2,
        "! <em>Key property</em> SupplierAddressID
        supplier_address_id        TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! AddressID
        address_id                 TYPE c LENGTH 10,
        "! AddressPersonID
        address_person_id          TYPE c LENGTH 10,
        "! AddressRepresentationCode
        address_representation_cod TYPE c LENGTH 1,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! PrfrdCommMediumType
        prfrd_comm_medium_type     TYPE c LENGTH 3,
        "! AddresseeFullName
        addressee_full_name        TYPE c LENGTH 80,
        "! OrganizationName1
        organization_name_1        TYPE c LENGTH 40,
        "! OrganizationName2
        organization_name_2        TYPE c LENGTH 40,
        "! OrganizationName3
        organization_name_3        TYPE c LENGTH 40,
        "! OrganizationName4
        organization_name_4        TYPE c LENGTH 40,
        "! AddressSearchTerm1
        address_search_term_1      TYPE c LENGTH 20,
        "! AddressSearchTerm2
        address_search_term_2      TYPE c LENGTH 20,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! VillageName
        village_name               TYPE c LENGTH 40,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! Building
        building                   TYPE c LENGTH 20,
        "! Floor
        floor                      TYPE c LENGTH 10,
        "! RoomNumber
        room_number                TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! RegionalStructureCheckStatus
        regional_structure_check_s TYPE c LENGTH 1,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_supplier__2,
      "! <p class="shorttext synchronized">List of PurchaseOrderSupplierAddress_Type</p>
      tyt_purchase_order_supplier__2 TYPE STANDARD TABLE OF tys_purchase_order_supplier__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurchaseOrder_Type</p>
      BEGIN OF tys_purchase_order_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_9,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! PurchaseOrderType
        purchase_order_type_2      TYPE c LENGTH 4,
        "! PurchaseOrderSubtype
        purchase_order_subtype     TYPE c LENGTH 1,
        "! PurchasingDocumentOrigin
        purchasing_document_origin TYPE c LENGTH 1,
        "! PurchasingDocumentProcessCode
        purchasing_document_proces TYPE c LENGTH 3,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! PurchaseOrderDate
        purchase_order_date        TYPE datn,
        "! LastChangeDateTime
        last_change_date_time      TYPE timestampl,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
        "! Language
        language                   TYPE c LENGTH 2,
        "! PurchaseOrderDeletionCode
        purchase_order_deletion_co TYPE c LENGTH 1,
        "! ReleaseIsNotCompleted
        release_is_not_completed   TYPE abap_bool,
        "! PurchasingCompletenessStatus
        purchasing_completeness_st TYPE abap_bool,
        "! PurchasingProcessingStatus
        purchasing_processing_stat TYPE c LENGTH 2,
        "! PurgReleaseSequenceStatus
        purg_release_sequence_stat TYPE c LENGTH 8,
        "! ReleaseCode
        release_code               TYPE c LENGTH 1,
        "! PurchasingReleaseStrategy
        purchasing_release_strateg TYPE c LENGTH 2,
        "! PurgReasonForDocCancellation
        purg_reason_for_doc_cancel TYPE c LENGTH 2,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! PurchasingGroup
        purchasing_group           TYPE c LENGTH 3,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! ManualSupplierAddressID
        manual_supplier_address_id TYPE c LENGTH 10,
        "! SupplierAddressID
        supplier_address_id        TYPE c LENGTH 10,
        "! SupplierRespSalesPersonName
        supplier_resp_sales_person TYPE c LENGTH 30,
        "! SupplierPhoneNumber
        supplier_phone_number      TYPE c LENGTH 16,
        "! SupplyingSupplier
        supplying_supplier         TYPE c LENGTH 10,
        "! SupplyingPlant
        supplying_plant            TYPE c LENGTH 4,
        "! InvoicingParty
        invoicing_party            TYPE c LENGTH 10,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! SupplierQuotationExternalID
        supplier_quotation_externa TYPE c LENGTH 10,
        "! QuotationSubmissionDate
        quotation_submission_date  TYPE datn,
        "! ItemNumberIntervalForSubItems
        item_number_interval_for_s TYPE c LENGTH 5,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! CashDiscount1Days
        cash_discount_1_days       TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount2Days
        cash_discount_2_days       TYPE p LENGTH 2 DECIMALS 0,
        "! NetPaymentDays
        net_payment_days           TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount1Percent
        cash_discount_1_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! CashDiscount2Percent
        cash_discount_2_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! DownPaymentType
        down_payment_type          TYPE c LENGTH 4,
        "! DownPaymentPercentageOfTotAmt
        down_payment_percentage_of TYPE p LENGTH 3 DECIMALS 2,
        "! DownPaymentAmount
        down_payment_amount        TYPE decfloat16,
        "! DownPaymentDueDate
        down_payment_due_date      TYPE datn,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsTransferLocation
        incoterms_transfer_locatio TYPE c LENGTH 28,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IsIntrastatReportingRelevant
        is_intrastat_reporting_rel TYPE abap_bool,
        "! IsIntrastatReportingExcluded
        is_intrastat_reporting_exc TYPE abap_bool,
        "! CorrespncExternalReference
        correspnc_external_referen TYPE c LENGTH 12,
        "! CorrespncInternalReference
        correspnc_internal_referen TYPE c LENGTH 12,
        "! PricingDocument
        pricing_document           TYPE c LENGTH 10,
        "! PricingProcedure
        pricing_procedure          TYPE c LENGTH 6,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 3,
        "! ExchangeRate
        exchange_rate              TYPE p LENGTH 5 DECIMALS 5,
        "! ExchangeRateIsFixed
        exchange_rate_is_fixed     TYPE abap_bool,
        "! TaxReturnCountry
        tax_return_country         TYPE c LENGTH 3,
        "! VATRegistrationCountry
        vatregistration_country    TYPE c LENGTH 3,
        "! PurgAggrgdProdCmplncSuplrSts
        purg_aggrgd_prod_cmplnc_su TYPE c LENGTH 1,
        "! PurgAggrgdProdMarketabilitySts
        purg_aggrgd_prod_marketabi TYPE c LENGTH 1,
        "! PurgAggrgdSftyDataSheetStatus
        purg_aggrgd_sfty_data_shee TYPE c LENGTH 1,
        "! PurgProdCmplncTotDngrsGoodsSts
        purg_prod_cmplnc_tot_dngrs TYPE c LENGTH 1,
        "! PurchasingCollectiveNumber
        purchasing_collective_numb TYPE c LENGTH 10,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_purchase_order_type,
      "! <p class="shorttext synchronized">List of PurchaseOrder_Type</p>
      tyt_purchase_order_type TYPE STANDARD TABLE OF tys_purchase_order_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurOrderItemDeliveryAddress_Type</p>
      BEGIN OF tys_pur_order_item_delivery__2,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> DeliveryAddressID
        delivery_address_id        TYPE c LENGTH 10,
        "! AddressID
        address_id                 TYPE c LENGTH 10,
        "! AddressPersonID
        address_person_id          TYPE c LENGTH 10,
        "! AddressRepresentationCode
        address_representation_cod TYPE c LENGTH 1,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! PrfrdCommMediumType
        prfrd_comm_medium_type     TYPE c LENGTH 3,
        "! AddresseeFullName
        addressee_full_name        TYPE c LENGTH 80,
        "! OrganizationName1
        organization_name_1        TYPE c LENGTH 40,
        "! OrganizationName2
        organization_name_2        TYPE c LENGTH 40,
        "! OrganizationName3
        organization_name_3        TYPE c LENGTH 40,
        "! OrganizationName4
        organization_name_4        TYPE c LENGTH 40,
        "! AddressSearchTerm1
        address_search_term_1      TYPE c LENGTH 20,
        "! AddressSearchTerm2
        address_search_term_2      TYPE c LENGTH 20,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! VillageName
        village_name               TYPE c LENGTH 40,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! Building
        building                   TYPE c LENGTH 20,
        "! Floor
        floor                      TYPE c LENGTH 10,
        "! RoomNumber
        room_number                TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! Region
        region                     TYPE c LENGTH 3,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxIsWithoutNumber
        pobox_is_without_number    TYPE abap_bool,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! POBoxLobbyName
        pobox_lobby_name           TYPE c LENGTH 40,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! POBoxDeviatingRegion
        pobox_deviating_region     TYPE c LENGTH 3,
        "! POBoxDeviatingCountry
        pobox_deviating_country    TYPE c LENGTH 3,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! DeliveryServiceTypeCode
        delivery_service_type_code TYPE c LENGTH 4,
        "! DeliveryServiceNumber
        delivery_service_number    TYPE c LENGTH 10,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! RegionalStructureCheckStatus
        regional_structure_check_s TYPE c LENGTH 1,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_pur_order_item_delivery__2,
      "! <p class="shorttext synchronized">List of PurOrderItemDeliveryAddress_Type</p>
      tyt_pur_order_item_delivery__2 TYPE STANDARD TABLE OF tys_pur_order_item_delivery__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PurOrderItemPricingElement_Type</p>
      BEGIN OF tys_pur_order_item_pricing_e_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_7,
        "! <em>Key property</em> PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! <em>Key property</em> PricingDocument
        pricing_document           TYPE c LENGTH 10,
        "! <em>Key property</em> PricingDocumentItem
        pricing_document_item      TYPE c LENGTH 6,
        "! <em>Key property</em> PricingProcedureStep
        pricing_procedure_step     TYPE c LENGTH 3,
        "! <em>Key property</em> PricingProcedureCounter
        pricing_procedure_counter  TYPE c LENGTH 3,
        "! ConditionApplication
        condition_application      TYPE c LENGTH 2,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! PriceConditionDeterminationDte
        price_condition_determinat TYPE datn,
        "! ConditionCalculationType
        condition_calculation_type TYPE c LENGTH 3,
        "! ConditionBaseAmount
        condition_base_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionBaseValue
        condition_base_value       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateRatioUnit
        condition_rate_ratio_unit  TYPE c LENGTH 3,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 3,
        "! PriceDetnExchangeRate
        price_detn_exchange_rate   TYPE p LENGTH 5 DECIMALS 5,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionQuantityUnit
        condition_quantity_unit    TYPE c LENGTH 3,
        "! ConditionToBaseQtyNmrtr
        condition_to_base_qty_nmrt TYPE p LENGTH 6 DECIMALS 0,
        "! ConditionToBaseQtyDnmntr
        condition_to_base_qty_dnmn TYPE p LENGTH 6 DECIMALS 0,
        "! ConditionCategory
        condition_category         TYPE c LENGTH 1,
        "! ConditionIsForStatistics
        condition_is_for_statistic TYPE abap_bool,
        "! PricingScaleType
        pricing_scale_type         TYPE c LENGTH 1,
        "! IsRelevantForAccrual
        is_relevant_for_accrual    TYPE abap_bool,
        "! CndnIsRelevantForInvoiceList
        cndn_is_relevant_for_invoi TYPE abap_bool,
        "! ConditionOrigin
        condition_origin           TYPE c LENGTH 1,
        "! IsGroupCondition
        is_group_condition         TYPE abap_bool,
        "! AccessNumberOfAccessSequence
        access_number_of_access_se TYPE c LENGTH 3,
        "! ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! ConditionSequentialNumber
        condition_sequential_numbe TYPE c LENGTH 3,
        "! AccountKeyForGLAccount
        account_key_for_glaccount  TYPE c LENGTH 3,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! AcctKeyForAccrualsGLAccount
        acct_key_for_accruals_glac TYPE c LENGTH 3,
        "! AccrualsGLAccount
        accruals_glaccount         TYPE c LENGTH 10,
        "! WithholdingTaxCode
        withholding_tax_code       TYPE c LENGTH 2,
        "! FreightSupplier
        freight_supplier           TYPE c LENGTH 10,
        "! CndnRoundingOffDiffAmount
        cndn_rounding_off_diff_amo TYPE decfloat16,
        "! ConditionAmount
        condition_amount           TYPE decfloat16,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 3,
        "! ConditionControl
        condition_control          TYPE c LENGTH 1,
        "! ConditionInactiveReason
        condition_inactive_reason  TYPE c LENGTH 1,
        "! ConditionClass
        condition_class            TYPE c LENGTH 1,
        "! PrcgProcedureCounterForHeader
        prcg_procedure_counter_for TYPE c LENGTH 3,
        "! FactorForConditionBasisValue
        factor_for_condition_basis TYPE /iwbep/v4_float,
        "! StructureCondition
        structure_condition        TYPE c LENGTH 1,
        "! PeriodFactorForCndnBasisValue
        period_factor_for_cndn_bas TYPE /iwbep/v4_float,
        "! PricingScaleBasis
        pricing_scale_basis        TYPE c LENGTH 3,
        "! ConditionScaleBasisValue
        condition_scale_basis_valu TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionScaleBasisUnit
        condition_scale_basis_unit TYPE c LENGTH 3,
        "! ConditionScaleBasisCurrency
        condition_scale_basis_curr TYPE c LENGTH 3,
        "! ConditionAlternativeCurrency
        condition_alternative_curr TYPE c LENGTH 3,
        "! ConditionAmountInLocalCrcy
        condition_amount_in_local  TYPE decfloat16,
        "! CndnIsRelevantForIntcoBilling
        cndn_is_relevant_for_intco TYPE abap_bool,
        "! ConditionIsManuallyChanged
        condition_is_manually_chan TYPE abap_bool,
        "! BillingPriceSource
        billing_price_source       TYPE c LENGTH 1,
        "! TaxJurisdictionLevel
        tax_jurisdiction_level     TYPE c LENGTH 1,
        "! ConditionByteSequence
        condition_byte_sequence    TYPE xstring,
        "! CndnIsRelevantForLimitValue
        cndn_is_relevant_for_limit TYPE abap_bool,
        "! ConditionBasisLimitExceeded
        condition_basis_limit_exce TYPE c LENGTH 1,
        "! ConditionAmountLimitExceeded
        condition_amount_limit_exc TYPE c LENGTH 1,
        "! CumulatedConditionBasisValue
        cumulated_condition_basis  TYPE p LENGTH 13 DECIMALS 9,
        "! CustomerRebateRecipient
        customer_rebate_recipient  TYPE c LENGTH 10,
        "! ConditionIsForConfiguration
        condition_is_for_configura TYPE abap_bool,
        "! VariantCondition
        variant_condition          TYPE c LENGTH 26,
        "! ConditionAcctAssgmtRelevance
        condition_acct_assgmt_rele TYPE c LENGTH 1,
        "! ConditionMatrixMaintRelevance
        condition_matrix_maint_rel TYPE c LENGTH 1,
        "! ConfigblParametersAndFormulas
        configbl_parameters_and_fo TYPE sysuuid_x16,
        "! ConditionAdjustedQuantity
        condition_adjusted_quantit TYPE p LENGTH 16 DECIMALS 14,
        "! ConditionTypeName
        condition_type_name        TYPE c LENGTH 30,
        "! ConditionBaseValueIntlUnit
        condition_base_value_intl  TYPE c LENGTH 5,
        "! ConditionBaseValueUnit
        condition_base_value_unit  TYPE c LENGTH 5,
        "! ConditionRateValueIntlUnit
        condition_rate_value_intl  TYPE c LENGTH 5,
        "! ConditionRateValueUnit
        condition_rate_value_unit  TYPE c LENGTH 5,
        "! TaxCodeName
        tax_code_name              TYPE c LENGTH 50,
        "! ConditionIsDeletable
        condition_is_deletable     TYPE abap_bool,
        "! PricingProcedure
        pricing_procedure          TYPE c LENGTH 6,
        "! SuperordinateDocument
        superordinate_document     TYPE c LENGTH 32,
        "! SuperordinateDocumentItem
        superordinate_document_ite TYPE c LENGTH 70,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_pur_order_item_pricing_e_2,
      "! <p class="shorttext synchronized">List of PurOrderItemPricingElement_Type</p>
      tyt_pur_order_item_pricing_e_2 TYPE STANDARD TABLE OF tys_pur_order_item_pricing_e_2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! POSubcontractingComponent
        "! <br/> Collection of type 'POSubcontractingComponent_Type'
        posubcontracting_component TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'POSUBCONTRACTING_COMPONENT',
        "! PurchaseOrder
        "! <br/> Collection of type 'PurchaseOrder_Type'
        purchase_order             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER',
        "! PurchaseOrderAccountAssignment
        "! <br/> Collection of type 'PurchaseOrderAccountAssignment_Type'
        purchase_order_account_ass TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_ACCOUNT_ASS',
        "! PurchaseOrderInvoicingPlanItem
        "! <br/> Collection of type 'POInvoicingPlanItem_Type'
        purchase_order_invoicing_2 TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_INVOICING_2',
        "! PurchaseOrderInvoicingPlan
        "! <br/> Collection of type 'PurchaseOrderInvoicingPlan_Type'
        purchase_order_invoicing_p TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_INVOICING_P',
        "! PurchaseOrderItem
        "! <br/> Collection of type 'PurchaseOrderItem_Type'
        purchase_order_item        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_ITEM',
        "! PurchaseOrderItemNote
        "! <br/> Collection of type 'PurchaseOrderItemNote_Type'
        purchase_order_item_note   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_ITEM_NOTE',
        "! PurchaseOrderNote
        "! <br/> Collection of type 'PurchaseOrderNote_Type'
        purchase_order_note        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_NOTE',
        "! PurchaseOrderPartner
        "! <br/> Collection of type 'PurchaseOrderPartner_Type'
        purchase_order_partner     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_PARTNER',
        "! PurchaseOrderScheduleLine
        "! <br/> Collection of type 'PurchaseOrderScheduleLine_Type'
        purchase_order_schedule_li TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_SCHEDULE_LI',
        "! PurchaseOrderSupplierAddress
        "! <br/> Collection of type 'PurchaseOrderSupplierAddress_Type'
        purchase_order_supplier_ad TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PURCHASE_ORDER_SUPPLIER_AD',
        "! PurOrderItemDeliveryAddress
        "! <br/> Collection of type 'PurOrderItemDeliveryAddress_Type'
        pur_order_item_delivery_ad TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PUR_ORDER_ITEM_DELIVERY_AD',
        "! PurOrderItemPricingElement
        "! <br/> Collection of type 'PurOrderItemPricingElement_Type'
        pur_order_item_pricing_ele TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PUR_ORDER_ITEM_PRICING_ELE',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
        "! GetOutputBinaryData
        "! <em>bound against entity type</em> PurchaseOrder_Type
        get_output_binary_data TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'GET_OUTPUT_BINARY_DATA',
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for D_PurOrdGetOutputBinaryDataR</p>
        "! See also structure type {@link ..tys_d_pur_ord_get_output_binar}
        BEGIN OF d_pur_ord_get_output_binar,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF d_pur_ord_get_output_binar,
        "! <p class="shorttext synchronized">Internal names for SAP__Message</p>
        "! See also structure type {@link ..tys_sap_message}
        BEGIN OF sap_message,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_message,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for POInvoicingPlanItem_Type</p>
        "! See also structure type {@link ..tys_poinvoicing_plan_item_type}
        BEGIN OF poinvoicing_plan_item_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderInvoicingPlan
            purchase_order_invoicing_p TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_INVOICING_P',
            "! _PurchaseOrderItem
            purchase_order_item_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
          END OF navigation,
        END OF poinvoicing_plan_item_type,
        "! <p class="shorttext synchronized">Internal names for POSubcontractingComponent_Type</p>
        "! See also structure type {@link ..tys_posubcontracting_compone_2}
        BEGIN OF posubcontracting_compone_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
            "! _ScheduleLine
            schedule_line_2       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SCHEDULE_LINE_2',
          END OF navigation,
        END OF posubcontracting_compone_2,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderAccountAssignment_Type</p>
        "! See also structure type {@link ..tys_purchase_order_account_a_2}
        BEGIN OF purchase_order_account_a_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
          END OF navigation,
        END OF purchase_order_account_a_2,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderInvoicingPlan_Type</p>
        "! See also structure type {@link ..tys_purchase_order_invoicing_3}
        BEGIN OF purchase_order_invoicing_3,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _POInvoicingPlanItem
            poinvoicing_plan_item TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'POINVOICING_PLAN_ITEM',
            "! _PurchaseOrder
            purchase_order_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
          END OF navigation,
        END OF purchase_order_invoicing_3,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderItemNote_Type</p>
        "! See also structure type {@link ..tys_purchase_order_item_note_t}
        BEGIN OF purchase_order_item_note_t,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
          END OF navigation,
        END OF purchase_order_item_note_t,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderItem_Type</p>
        "! See also structure type {@link ..tys_purchase_order_item_type}
        BEGIN OF purchase_order_item_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _DeliveryAddress
            delivery_address           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'DELIVERY_ADDRESS',
            "! _PurchaseOrder
            purchase_order_2           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderInvoicingPlan
            purchase_order_invoicing_p TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_INVOICING_P',
            "! _PurchaseOrderItemNote
            purchase_order_item_note   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_NOTE',
            "! _PurchaseOrderScheduleLineTP
            purchase_order_schedule_li TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_SCHEDULE_LI',
            "! _PurOrdAccountAssignment
            pur_ord_account_assignment TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PUR_ORD_ACCOUNT_ASSIGNMENT',
            "! _PurOrdPricingElement
            pur_ord_pricing_element    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PUR_ORD_PRICING_ELEMENT',
          END OF navigation,
        END OF purchase_order_item_type,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderNote_Type</p>
        "! See also structure type {@link ..tys_purchase_order_note_type}
        BEGIN OF purchase_order_note_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
          END OF navigation,
        END OF purchase_order_note_type,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderPartner_Type</p>
        "! See also structure type {@link ..tys_purchase_order_partner_typ}
        BEGIN OF purchase_order_partner_typ,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrderTP
            purchase_order_tp TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_TP',
          END OF navigation,
        END OF purchase_order_partner_typ,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderScheduleLine_Type</p>
        "! See also structure type {@link ..tys_purchase_order_schedule__2}
        BEGIN OF purchase_order_schedule__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
            "! _SubcontractingComponent
            subcontracting_component TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SUBCONTRACTING_COMPONENT',
          END OF navigation,
        END OF purchase_order_schedule__2,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrderSupplierAddress_Type</p>
        "! See also structure type {@link ..tys_purchase_order_supplier__2}
        BEGIN OF purchase_order_supplier__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrderTP
            purchase_order_tp TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_TP',
          END OF navigation,
        END OF purchase_order_supplier__2,
        "! <p class="shorttext synchronized">Internal names for PurchaseOrder_Type</p>
        "! See also structure type {@link ..tys_purchase_order_type}
        BEGIN OF purchase_order_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrderItem
            purchase_order_item    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM',
            "! _PurchaseOrderNote
            purchase_order_note    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_NOTE',
            "! _PurchaseOrderPartner
            purchase_order_partner TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_PARTNER',
            "! _SupplierAddress
            supplier_address       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SUPPLIER_ADDRESS',
          END OF navigation,
        END OF purchase_order_type,
        "! <p class="shorttext synchronized">Internal names for PurOrderItemDeliveryAddress_Type</p>
        "! See also structure type {@link ..tys_pur_order_item_delivery__2}
        BEGIN OF pur_order_item_delivery__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
          END OF navigation,
        END OF pur_order_item_delivery__2,
        "! <p class="shorttext synchronized">Internal names for PurOrderItemPricingElement_Type</p>
        "! See also structure type {@link ..tys_pur_order_item_pricing_e_2}
        BEGIN OF pur_order_item_pricing_e_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _PurchaseOrder
            purchase_order_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_2',
            "! _PurchaseOrderItem
            purchase_order_item_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PURCHASE_ORDER_ITEM_2',
          END OF navigation,
        END OF pur_order_item_pricing_e_2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define D_PurOrdGetOutputBinaryDataR</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_d_pur_ord_get_output_binar RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Message</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_message RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define POInvoicingPlanItem_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_poinvoicing_plan_item_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define POSubcontractingComponent_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_posubcontracting_compone_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderAccountAssignment_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_account_a_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderInvoicingPlan_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_invoicing_3 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderItemNote_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_item_note_t RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderItem_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_item_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderNote_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_note_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderPartner_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_partner_typ RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderScheduleLine_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_schedule__2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrderSupplierAddress_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_supplier__2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurchaseOrder_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_purchase_order_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurOrderItemDeliveryAddress_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_pur_order_item_delivery__2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PurOrderItemPricingElement_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_pur_order_item_pricing_e_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define GetOutputBinaryData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_output_binary_data RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSC_RAP_COMSUM_MODEL_VN_001 IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'com.sap.gateway.srvd_a2x.api_purchaseorder_2.v0001' ) ##NO_TEXT.

    def_d_pur_ord_get_output_binar( ).
    def_sap_message( ).
    def_poinvoicing_plan_item_type( ).
    def_posubcontracting_compone_2( ).
    def_purchase_order_account_a_2( ).
    def_purchase_order_invoicing_3( ).
    def_purchase_order_item_note_t( ).
    def_purchase_order_item_type( ).
    def_purchase_order_note_type( ).
    def_purchase_order_partner_typ( ).
    def_purchase_order_schedule__2( ).
    def_purchase_order_supplier__2( ).
    def_purchase_order_type( ).
    def_pur_order_item_delivery__2( ).
    def_pur_order_item_pricing_e_2( ).
    def_get_output_binary_data( ).

  ENDMETHOD.


  METHOD def_d_pur_ord_get_output_binar.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'D_PUR_ORD_GET_OUTPUT_BINAR'
                                    is_structure              = VALUE tys_d_pur_ord_get_output_binar( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'D_PurOrdGetOutputBinaryDataR' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'MIME_TYPE' ).
    lo_primitive_property->set_edm_name( 'MimeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'OUTPUT_BINARY_DATA' ).
    lo_primitive_property->set_edm_name( 'OutputBinaryData' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'OUTPUT_CHANNEL' ).
    lo_primitive_property->set_edm_name( 'OutputChannel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'OUTPUT_DOCUMENT_NAME' ).
    lo_primitive_property->set_edm_name( 'OutputDocumentName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 120 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECIPIENT' ).
    lo_primitive_property->set_edm_name( 'Recipient' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'RECIPIENT_ROLE' ).
    lo_primitive_property->set_edm_name( 'RecipientRole' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_get_output_binary_data.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_OUTPUT_BINARY_DATA' ).
    lo_function->set_edm_name( 'GetOutputBinaryData' ) ##NO_TEXT.


    lo_parameter = lo_function->create_parameter( 'IT' ).
    lo_parameter->set_edm_name( '_it' ) ##NO_TEXT.
    lo_parameter->set_entity_type( 'PURCHASE_ORDER_TYPE' ).
    lo_parameter->set_is_binding_parameter( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'D_PUR_ORD_GET_OUTPUT_BINAR' ).

  ENDMETHOD.


  METHOD def_poinvoicing_plan_item_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'POINVOICING_PLAN_ITEM_TYPE'
                                    is_structure              = VALUE tys_poinvoicing_plan_item_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'POInvoicingPlanItem_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_INVOICING_2' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderInvoicingPlanItem' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_ITEM' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlan' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_SETTLEMENT' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanSettlementFromDte' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_SETTLEMEN_2' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanSettlementToDte' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_INVOICING_D' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanInvoicingDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_GROUP' ).
    lo_primitive_property->set_edm_name( 'PurchasingGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_TYPE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_INVOICING_P' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderInvoicingPlan' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_INVOICING_3' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_posubcontracting_compone_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'POSUBCONTRACTING_COMPONE_2'
                                    is_structure              = VALUE tys_posubcontracting_compone_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'POSubcontractingComponent_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'POSUBCONTRACTING_COMPONENT' ).
    lo_entity_set->set_edm_name( 'POSubcontractingComponent' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'ScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESERVATION_ITEM' ).
    lo_primitive_property->set_edm_name( 'ReservationItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECORD_TYPE' ).
    lo_primitive_property->set_edm_name( 'RecordType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_MATERIAL_PROVISION' ).
    lo_primitive_property->set_edm_name( 'IsMaterialProvision' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_PROVISION_TYPE' ).
    lo_primitive_property->set_edm_name( 'MaterialProvisionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_QTY_TO_BASE_QTY_N' ).
    lo_primitive_property->set_edm_name( 'MaterialQtyToBaseQtyNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_QTY_TO_BASE_QTY_D' ).
    lo_primitive_property->set_edm_name( 'MaterialQtyToBaseQtyDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_REVISION_LEVEL' ).
    lo_primitive_property->set_edm_name( 'MaterialRevisionLevel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_COMP_IS_VARIABLE' ).
    lo_primitive_property->set_edm_name( 'MaterialCompIsVariableSized' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_COMPONENT_IS_PHAN' ).
    lo_primitive_property->set_edm_name( 'MaterialComponentIsPhantomItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESERVATION' ).
    lo_primitive_property->set_edm_name( 'Reservation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIRED_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'RequiredQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIREMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'RequirementDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIREMENT_TIME' ).
    lo_primitive_property->set_edm_name( 'RequirementTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESERVATION_IS_FINALLY_ISS' ).
    lo_primitive_property->set_edm_name( 'ReservationIsFinallyIssued' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UNIT' ).
    lo_primitive_property->set_edm_name( 'BaseUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_IN_ENTRY_UNIT' ).
    lo_primitive_property->set_edm_name( 'QuantityInEntryUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRY_UNIT' ).
    lo_primitive_property->set_edm_name( 'EntryUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIABLE_SIZE_ITEM_QUANTIT' ).
    lo_primitive_property->set_edm_name( 'VariableSizeItemQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIABLE_SIZE_ITEM_UNIT' ).
    lo_primitive_property->set_edm_name( 'VariableSizeItemUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIABLE_SIZE_COMPONENT_UN' ).
    lo_primitive_property->set_edm_name( 'VariableSizeComponentUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIABLE_SIZE_COMPONENT_QU' ).
    lo_primitive_property->set_edm_name( 'VariableSizeComponentQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIT_OF_MEASURE_FOR_SIZE_1' ).
    lo_primitive_property->set_edm_name( 'UnitOfMeasureForSize1To3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SIZE_1' ).
    lo_primitive_property->set_edm_name( 'Size1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SIZE_2' ).
    lo_primitive_property->set_edm_name( 'Size2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SIZE_3' ).
    lo_primitive_property->set_edm_name( 'Size3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LATEST_REQUIREMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'LatestRequirementDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_LEVEL_VALUE' ).
    lo_primitive_property->set_edm_name( 'OrderLevelValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PATH_VALUE' ).
    lo_primitive_property->set_edm_name( 'OrderPathValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILL_OF_MATERIAL_ITEM_NUMB' ).
    lo_primitive_property->set_edm_name( 'BillOfMaterialItemNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_COMP_FREE_DEFINED_ATT' ).
    lo_primitive_property->set_edm_name( 'MatlCompFreeDefinedAttribute' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOMITEM_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'BOMItemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_BULK_MATERIAL_COMPONENT' ).
    lo_primitive_property->set_edm_name( 'IsBulkMaterialComponent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_CATEGOR' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVENTORY_SPECIAL_STOCK_TY' ).
    lo_primitive_property->set_edm_name( 'InventorySpecialStockType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSUMPTION_POSTING' ).
    lo_primitive_property->set_edm_name( 'ConsumptionPosting' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVENTORY_SPECIAL_STOCK_VA' ).
    lo_primitive_property->set_edm_name( 'InventorySpecialStockValnType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEBIT_CREDIT_CODE' ).
    lo_primitive_property->set_edm_name( 'DebitCreditCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHDRAWN_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'WithdrawnQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_IS_FIXED' ).
    lo_primitive_property->set_edm_name( 'QuantityIsFixed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPONENT_SCRAP_IN_PERCENT' ).
    lo_primitive_property->set_edm_name( 'ComponentScrapInPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPERATION_SCRAP_IN_PERCENT' ).
    lo_primitive_property->set_edm_name( 'OperationScrapInPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_NET_SCRAP' ).
    lo_primitive_property->set_edm_name( 'IsNetScrap' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEAD_TIME_OFFSET' ).
    lo_primitive_property->set_edm_name( 'LeadTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_DISTRIBUTION_KEY' ).
    lo_primitive_property->set_edm_name( 'QuantityDistributionKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORMULA_KEY' ).
    lo_primitive_property->set_edm_name( 'FormulaKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_LOCATION' ).
    lo_primitive_property->set_edm_name( 'StorageLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCTION_SUPPLY_AREA' ).
    lo_primitive_property->set_edm_name( 'ProductionSupplyArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOMITEM_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'BOMItemDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOMITEM_TEXT_2' ).
    lo_primitive_property->set_edm_name( 'BOMItemText2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ChangeNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SCHEDULE_LINE_2' ).
    lo_navigation_property->set_edm_name( '_ScheduleLine' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_SCHEDULE__2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_account_a_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_ACCOUNT_A_2'
                                    is_structure              = VALUE tys_purchase_order_account_a_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderAccountAssignment_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_ACCOUNT_ASS' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderAccountAssignment' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'CostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MASTER_FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'MasterFixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK' ).
    lo_primitive_property->set_edm_name( 'ProjectNetwork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK_ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'NetworkActivity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_ACCT_ASSGMT_DISTR' ).
    lo_primitive_property->set_edm_name( 'MultipleAcctAssgmtDistrPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'PurgDocNetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'IsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'SalesOrderScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'FixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_ID' ).
    lo_primitive_property->set_edm_name( 'OrderID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLOADING_POINT_NAME' ).
    lo_primitive_property->set_edm_name( 'UnloadingPointName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_OBJECT' ).
    lo_primitive_property->set_edm_name( 'CostObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT_INTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'WBSElementInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT_EXTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'WBSElementExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK_INTERNAL_I' ).
    lo_primitive_property->set_edm_name( 'ProjectNetworkInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMITMENT_ITEM_SHORT_ID' ).
    lo_primitive_property->set_edm_name( 'CommitmentItemShortID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CENTER' ).
    lo_primitive_property->set_edm_name( 'FundsCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTIONAL_AREA' ).
    lo_primitive_property->set_edm_name( 'FunctionalArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECIPIENT_NAME' ).
    lo_primitive_property->set_edm_name( 'GoodsRecipientName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_FINALLY_INVOICED' ).
    lo_primitive_property->set_edm_name( 'IsFinallyInvoiced' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK_ACTIVITY_INTERNAL' ).
    lo_primitive_property->set_edm_name( 'NetworkActivityInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_ACCOUNT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PartnerAccountNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOINT_VENTURE_RECOVERY_COD' ).
    lo_primitive_property->set_edm_name( 'JointVentureRecoveryCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SETTLEMENT_REFERENCE_DATE' ).
    lo_primitive_property->set_edm_name( 'SettlementReferenceDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_INTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'OrderInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_INT_BILL_OF_OPERATIO' ).
    lo_primitive_property->set_edm_name( 'OrderIntBillOfOperationsItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NON_DEDUCTIBLE_INPUT_TAX_A' ).
    lo_primitive_property->set_edm_name( 'NonDeductibleInputTaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CTR_ACTIVITY_TYPE' ).
    lo_primitive_property->set_edm_name( 'CostCtrActivityType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PROCESS' ).
    lo_primitive_property->set_edm_name( 'BusinessProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_ID' ).
    lo_primitive_property->set_edm_name( 'GrantID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT_I' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHART_OF_ACCOUNTS' ).
    lo_primitive_property->set_edm_name( 'ChartOfAccounts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'ServiceDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ServiceDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'ServiceDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_ACCT_LINE_FINAL' ).
    lo_primitive_property->set_edm_name( 'IsAcctLineFinal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCT_LINE_FINAL_REASON' ).
    lo_primitive_property->set_edm_name( 'AcctLineFinalReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_invoicing_3.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_INVOICING_3'
                                    is_structure              = VALUE tys_purchase_order_invoicing_3( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderInvoicingPlan_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_INVOICING_P' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderInvoicingPlan' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlan' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_TYPE' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_START_DATE' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_END_DATE' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PLAN_NEXT_INVC_D' ).
    lo_primitive_property->set_edm_name( 'InvoicingPlanNextInvcDateRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_GROUP' ).
    lo_primitive_property->set_edm_name( 'PurchasingGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_TYPE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'POINVOICING_PLAN_ITEM' ).
    lo_navigation_property->set_edm_name( '_POInvoicingPlanItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'POINVOICING_PLAN_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_item_note_t.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_ITEM_NOTE_T'
                                    is_structure              = VALUE tys_purchase_order_item_note_t( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderItemNote_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_ITEM_NOTE' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderItemNote' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TextObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAIN_LONG_TEXT' ).
    lo_primitive_property->set_edm_name( 'PlainLongText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM_UNIQUE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItemUniqueID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_item_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_ITEM_TYPE'
                                    is_structure              = VALUE tys_purchase_order_item_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderItem_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_ITEM' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_DELETI' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentDeletionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_GROUP' ).
    lo_primitive_property->set_edm_name( 'MaterialGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_TYPE' ).
    lo_primitive_property->set_edm_name( 'MaterialType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_MATERIAL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SupplierMaterialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_SUBRANGE' ).
    lo_primitive_property->set_edm_name( 'SupplierSubrange' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUFACTURER_PART_NMBR' ).
    lo_primitive_property->set_edm_name( 'ManufacturerPartNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUFACTURER' ).
    lo_primitive_property->set_edm_name( 'Manufacturer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUFACTURER_MATERIAL' ).
    lo_primitive_property->set_edm_name( 'ManufacturerMaterial' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_TYPE_CODE' ).
    lo_primitive_property->set_edm_name( 'ProductTypeCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_DELIVERY_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'ManualDeliveryAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DELIVERY_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'ReferenceDeliveryAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBCONTRACTOR' ).
    lo_primitive_property->set_edm_name( 'Subcontractor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_IS_SUBCONTRACTOR' ).
    lo_primitive_property->set_edm_name( 'SupplierIsSubcontractor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CROSS_PLANT_CONFIGURABLE_P' ).
    lo_primitive_property->set_edm_name( 'CrossPlantConfigurableProduct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARTICLE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'ArticleCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLND_ORDER_REPLNMT_ELMNT_T' ).
    lo_primitive_property->set_edm_name( 'PlndOrderReplnmtElmntType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_PURCHASE_POINTS_QT' ).
    lo_primitive_property->set_edm_name( 'ProductPurchasePointsQtyUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_PURCHASE_POINTS__2' ).
    lo_primitive_property->set_edm_name( 'ProductPurchasePointsQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_LOCATION' ).
    lo_primitive_property->set_edm_name( 'StorageLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_ITEM_QTY_TO_BASE_QTY' ).
    lo_primitive_property->set_edm_name( 'OrderItemQtyToBaseQtyNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_ITEM_QTY_TO_BASE_Q_2' ).
    lo_primitive_property->set_edm_name( 'OrderItemQtyToBaseQtyDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'NetPriceQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_COMPLETELY_DELIVERED' ).
    lo_primitive_property->set_edm_name( 'IsCompletelyDelivered' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_FINALLY_INVOICED' ).
    lo_primitive_property->set_edm_name( 'IsFinallyInvoiced' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_IS_EXPECTED' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptIsExpected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IS_EXPECTED' ).
    lo_primitive_property->set_edm_name( 'InvoiceIsExpected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_ORDER_ACKN_RQD' ).
    lo_primitive_property->set_edm_name( 'IsOrderAcknRqd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IS_GOODS_RECEIPT_B' ).
    lo_primitive_property->set_edm_name( 'InvoiceIsGoodsReceiptBased' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisitionItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIREMENT_TRACKING' ).
    lo_primitive_property->set_edm_name( 'RequirementTracking' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_QUOTATION' ).
    lo_primitive_property->set_edm_name( 'SupplierQuotation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_QUOTATION_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierQuotationItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EVALD_RCPT_SETTLMT_IS_ALLO' ).
    lo_primitive_property->set_edm_name( 'EvaldRcptSettlmtIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLIMITED_OVERDELIVERY_IS' ).
    lo_primitive_property->set_edm_name( 'UnlimitedOverdeliveryIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERDELIV_TOLRTD_LMT_RATIO' ).
    lo_primitive_property->set_edm_name( 'OverdelivTolrtdLmtRatioInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDERDELIV_TOLRTD_LMT_RATI' ).
    lo_primitive_property->set_edm_name( 'UnderdelivTolrtdLmtRatioInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUISITIONER_NAME' ).
    lo_primitive_property->set_edm_name( 'RequisitionerName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANNED_DELIVERY_DURATION' ).
    lo_primitive_property->set_edm_name( 'PlannedDeliveryDurationInDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_DURATION_IN' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptDurationInDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTIAL_DELIVERY_IS_ALLOWE' ).
    lo_primitive_property->set_edm_name( 'PartialDeliveryIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSUMPTION_POSTING' ).
    lo_primitive_property->set_edm_name( 'ConsumptionPosting' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_PERFORMER' ).
    lo_primitive_property->set_edm_name( 'ServicePerformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_PACKAGE' ).
    lo_primitive_property->set_edm_name( 'ServicePackage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UNIT' ).
    lo_primitive_property->set_edm_name( 'BaseUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM_CATEGO' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME_UNIT' ).
    lo_primitive_property->set_edm_name( 'ItemVolumeUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_WEIGHT_UNIT' ).
    lo_primitive_property->set_edm_name( 'ItemWeightUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_ACCT_ASSGMT_DISTR' ).
    lo_primitive_property->set_edm_name( 'MultipleAcctAssgmtDistribution' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTIAL_INVOICE_DISTRIBUTI' ).
    lo_primitive_property->set_edm_name( 'PartialInvoiceDistribution' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DATE_CONTROL' ).
    lo_primitive_property->set_edm_name( 'PricingDateControl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_STATISTICAL_ITEM' ).
    lo_primitive_property->set_edm_name( 'IsStatisticalItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PARENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchasingParentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_LATEST_CREAT' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptLatestCreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_RETURNS_ITEM' ).
    lo_primitive_property->set_edm_name( 'IsReturnsItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORDER_REASON' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrderReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_TRANSFER_LOCATIO' ).
    lo_primitive_property->set_edm_name( 'IncotermsTransferLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIOR_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'PriorSupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_ARTICLE_NUMB' ).
    lo_primitive_property->set_edm_name( 'InternationalArticleNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTRASTAT_SERVICE_CODE' ).
    lo_primitive_property->set_edm_name( 'IntrastatServiceCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMODITY_CODE' ).
    lo_primitive_property->set_edm_name( 'CommodityCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_FREIGHT_GROUP' ).
    lo_primitive_property->set_edm_name( 'MaterialFreightGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISCOUNT_IN_KIND_ELIGIBILI' ).
    lo_primitive_property->set_edm_name( 'DiscountInKindEligibility' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_ITEM_IS_BLOCKED_FOR_D' ).
    lo_primitive_property->set_edm_name( 'PurgItemIsBlockedForDelivery' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_CONFIRMATION_CONT' ).
    lo_primitive_property->set_edm_name( 'SupplierConfirmationControlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_ORDER_ACKN_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PurgDocOrderAcknNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_IS_TO_BE_PRINTED' ).
    lo_primitive_property->set_edm_name( 'PriceIsToBePrinted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_CATEGOR' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_INFO_RECORD' ).
    lo_primitive_property->set_edm_name( 'PurchasingInfoRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'NetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'GrossAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EFFECTIVE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'EffectiveAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_1_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal1Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_2_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal2Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_3_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal3Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_4_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal4Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_5_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal5Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_6_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal6Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'OrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'NetPriceAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME' ).
    lo_primitive_property->set_edm_name( 'ItemVolume' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_GROSS_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'ItemGrossWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_NET_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'ItemNetWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT_TO_ORDER' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnitToOrderUnitNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORD_PRICE_UNIT_TO_ORDER_UN' ).
    lo_primitive_property->set_edm_name( 'OrdPriceUnitToOrderUnitDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_IS_NON_VALUA' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptIsNonValuated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_TO_BE_ACCEPTED_AT_ORIGI' ).
    lo_primitive_property->set_edm_name( 'IsToBeAcceptedAtOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_INSTRUCTION' ).
    lo_primitive_property->set_edm_name( 'ShippingInstruction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NON_DEDUCTIBLE_INPUT_TAX_A' ).
    lo_primitive_property->set_edm_name( 'NonDeductibleInputTaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STOCK_TYPE' ).
    lo_primitive_property->set_edm_name( 'StockType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ValuationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUATION_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'ValuationCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_IS_REJECTED_BY_SUPPLI' ).
    lo_primitive_property->set_edm_name( 'ItemIsRejectedBySupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_PRICE_DATE' ).
    lo_primitive_property->set_edm_name( 'PurgDocPriceDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_INFO_RECORD_UPD' ).
    lo_primitive_property->set_edm_name( 'PurchasingInfoRecordUpdateCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVENTORY_SPECIAL_STOCK_TY' ).
    lo_primitive_property->set_edm_name( 'InventorySpecialStockType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'DeliveryDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISSUING_STORAGE_LOCATION' ).
    lo_primitive_property->set_edm_name( 'IssuingStorageLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOCATION_TABLE' ).
    lo_primitive_property->set_edm_name( 'AllocationTable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOCATION_TABLE_ITEM' ).
    lo_primitive_property->set_edm_name( 'AllocationTableItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETAIL_PROMOTION' ).
    lo_primitive_property->set_edm_name( 'RetailPromotion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_CONFIGURABLE_ITEM_NUM' ).
    lo_primitive_property->set_edm_name( 'PurgConfigurableItemNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_AGGRGD_SUBITEM_CA' ).
    lo_primitive_property->set_edm_name( 'PurgDocAggrgdSubitemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_EXTERNAL_SORT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PurgExternalSortNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ITEM_IS_FREE_OF' ).
    lo_primitive_property->set_edm_name( 'PurchasingItemIsFreeOfCharge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'DownPaymentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_PERCENTAGE_OF' ).
    lo_primitive_property->set_edm_name( 'DownPaymentPercentageOfTotAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'DownPaymentAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_DUE_DATE' ).
    lo_primitive_property->set_edm_name( 'DownPaymentDueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPECTED_OVERALL_LIMIT_AMO' ).
    lo_primitive_property->set_edm_name( 'ExpectedOverallLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_LIMIT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'OverallLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTRACT_FOR_OVERALL_L' ).
    lo_primitive_property->set_edm_name( 'PurContractForOverallLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTRACT_ITEM_FOR_OVER' ).
    lo_primitive_property->set_edm_name( 'PurContractItemForOverallLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncSupplierStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PRODUCT_MARKETABILITY' ).
    lo_primitive_property->set_edm_name( 'PurgProductMarketabilityStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_SAFETY_DATA_SHEET_STA' ).
    lo_primitive_property->set_edm_name( 'PurgSafetyDataSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_DNGRS_GOO' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncDngrsGoodsStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_MATERIAL_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'BR_MaterialOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_MATERIAL_USAGE' ).
    lo_primitive_property->set_edm_name( 'BR_MaterialUsage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_CFOPCATEGORY' ).
    lo_primitive_property->set_edm_name( 'BR_CFOPCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NCM' ).
    lo_primitive_property->set_edm_name( 'BR_NCM' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSUMPTION_TAX_CTRL_CODE' ).
    lo_primitive_property->set_edm_name( 'ConsumptionTaxCtrlCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_IS_PRODUCED_IN_HOUSE' ).
    lo_primitive_property->set_edm_name( 'BR_IsProducedInHouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_SEASON_YEAR' ).
    lo_primitive_property->set_edm_name( 'ProductSeasonYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_SEASON' ).
    lo_primitive_property->set_edm_name( 'ProductSeason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_COLLECTION' ).
    lo_primitive_property->set_edm_name( 'ProductCollection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_THEME' ).
    lo_primitive_property->set_edm_name( 'ProductTheme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEASON_COMPLETENESS_STATUS' ).
    lo_primitive_property->set_edm_name( 'SeasonCompletenessStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_GROUP_RULE' ).
    lo_primitive_property->set_edm_name( 'ShippingGroupRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_GROUP_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ShippingGroupNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_CHARACTERISTIC_1' ).
    lo_primitive_property->set_edm_name( 'ProductCharacteristic1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_CHARACTERISTIC_2' ).
    lo_primitive_property->set_edm_name( 'ProductCharacteristic2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_CHARACTERISTIC_3' ).
    lo_primitive_property->set_edm_name( 'ProductCharacteristic3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_SUBITEM_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'PurgDocSubitemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIVERSION_STATUS' ).
    lo_primitive_property->set_edm_name( 'DiversionStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DOCUMENT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ReferenceDocumentNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'ReferenceDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_REFERENCE_T' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderReferenceType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_HAS_VALUE_ADDED_SERVI' ).
    lo_primitive_property->set_edm_name( 'ItemHasValueAddedService' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAL_ADDED_SRVC_PARENT_ITM' ).
    lo_primitive_property->set_edm_name( 'ValAddedSrvcParentItmNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STOCK_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'StockSegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'YY_1_MMPURDOC_IM_TXT_01_PD' ).
    lo_primitive_property->set_edm_name( 'YY1_MMPURDOC_IM_TXT01_PDI' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'YY_1_MM_PURDOC_ITEM_002_PD' ).
    lo_primitive_property->set_edm_name( 'YY1_MM_PURDOC_ITEM_002_PDI' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'DELIVERY_ADDRESS' ).
    lo_navigation_property->set_edm_name( '_DeliveryAddress' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PUR_ORDER_ITEM_DELIVERY__2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_INVOICING_P' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderInvoicingPlan' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_INVOICING_3' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_NOTE' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItemNote' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_NOTE_T' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_SCHEDULE_LI' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderScheduleLineTP' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_SCHEDULE__2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PUR_ORD_ACCOUNT_ASSIGNMENT' ).
    lo_navigation_property->set_edm_name( '_PurOrdAccountAssignment' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ACCOUNT_A_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PUR_ORD_PRICING_ELEMENT' ).
    lo_navigation_property->set_edm_name( '_PurOrdPricingElement' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PUR_ORDER_ITEM_PRICING_E_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_purchase_order_note_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_NOTE_TYPE'
                                    is_structure              = VALUE tys_purchase_order_note_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderNote_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_NOTE' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderNote' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TextObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAIN_LONG_TEXT' ).
    lo_primitive_property->set_edm_name( 'PlainLongText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_partner_typ.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_PARTNER_TYP'
                                    is_structure              = VALUE tys_purchase_order_partner_typ( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderPartner_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_PARTNER' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderPartner' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_FUNCTION' ).
    lo_primitive_property->set_edm_name( 'PartnerFunction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_SUBRANGE' ).
    lo_primitive_property->set_edm_name( 'SupplierSubrange' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_COUNTER' ).
    lo_primitive_property->set_edm_name( 'PartnerCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_PARTNE' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentPartnerType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_HIERARCHY_CATEGOR' ).
    lo_primitive_property->set_edm_name( 'SupplierHierarchyCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_CONTACT' ).
    lo_primitive_property->set_edm_name( 'SupplierContact' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSON_WORK_AGREEMENT' ).
    lo_primitive_property->set_edm_name( 'PersonWorkAgreement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPLOYMENT_INTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'EmploymentInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEFAULT_PARTNER' ).
    lo_primitive_property->set_edm_name( 'DefaultPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_TP' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderTP' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_schedule__2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_SCHEDULE__2'
                                    is_structure              = VALUE tys_purchase_order_schedule__2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderScheduleLine_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_SCHEDULE_LI' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderScheduleLine' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'ScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_DELIVERY_DAT' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHED_LINE_STSC_DELIVERY_D' ).
    lo_primitive_property->set_edm_name( 'SchedLineStscDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERFORMANCE_PERIOD_START_D' ).
    lo_primitive_property->set_edm_name( 'PerformancePeriodStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERFORMANCE_PERIOD_END_DAT' ).
    lo_primitive_property->set_edm_name( 'PerformancePeriodEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_DELIVERY_TIM' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineDeliveryTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH_BY_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'BatchBySupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_ORDER_QUANTI' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineOrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPEN_PURCHASE_ORDER_QUANTI' ).
    lo_primitive_property->set_edm_name( 'OpenPurchaseOrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisitionItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIV_DATE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'DelivDateCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_ORDER_DATE' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineOrderDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_AVAILABILITY_DATE' ).
    lo_primitive_property->set_edm_name( 'ProductAvailabilityDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOADING_DATE' ).
    lo_primitive_property->set_edm_name( 'LoadingDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOADING_TIME' ).
    lo_primitive_property->set_edm_name( 'LoadingTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORTATION_PLANNING_DA' ).
    lo_primitive_property->set_edm_name( 'TransportationPlanningDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORTATION_PLANNING_TI' ).
    lo_primitive_property->set_edm_name( 'TransportationPlanningTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_ISSUE_DATE' ).
    lo_primitive_property->set_edm_name( 'GoodsIssueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_ISSUE_TIME' ).
    lo_primitive_property->set_edm_name( 'GoodsIssueTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE_SCHEDULE' ).
    lo_primitive_property->set_edm_name( 'RouteSchedule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_AVAILABILITY_TIME' ).
    lo_primitive_property->set_edm_name( 'ProductAvailabilityTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SUBCONTRACTING_COMPONENT' ).
    lo_navigation_property->set_edm_name( '_SubcontractingComponent' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'POSUBCONTRACTING_COMPONE_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_purchase_order_supplier__2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_SUPPLIER__2'
                                    is_structure              = VALUE tys_purchase_order_supplier__2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrderSupplierAddress_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER_SUPPLIER_AD' ).
    lo_entity_set->set_edm_name( 'PurchaseOrderSupplierAddress' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'SupplierAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'AddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_PERSON_ID' ).
    lo_primitive_property->set_edm_name( 'AddressPersonID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_REPRESENTATION_COD' ).
    lo_primitive_property->set_edm_name( 'AddressRepresentationCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDENCE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'CorrespondenceLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRFRD_COMM_MEDIUM_TYPE' ).
    lo_primitive_property->set_edm_name( 'PrfrdCommMediumType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESSEE_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'AddresseeFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_1' ).
    lo_primitive_property->set_edm_name( 'OrganizationName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_2' ).
    lo_primitive_property->set_edm_name( 'OrganizationName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_3' ).
    lo_primitive_property->set_edm_name( 'OrganizationName3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_4' ).
    lo_primitive_property->set_edm_name( 'OrganizationName4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_SEARCH_TERM_1' ).
    lo_primitive_property->set_edm_name( 'AddressSearchTerm1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_SEARCH_TERM_2' ).
    lo_primitive_property->set_edm_name( 'AddressSearchTerm2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRICT_NAME' ).
    lo_primitive_property->set_edm_name( 'DistrictName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VILLAGE_NAME' ).
    lo_primitive_property->set_edm_name( 'VillageName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'HouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER_SUPPLEMENT_TE' ).
    lo_primitive_property->set_edm_name( 'HouseNumberSupplementText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUILDING' ).
    lo_primitive_property->set_edm_name( 'Building' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLOOR' ).
    lo_primitive_property->set_edm_name( 'Floor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROOM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'RoomNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORM_OF_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'FormOfAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORT_ZONE' ).
    lo_primitive_property->set_edm_name( 'TransportZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX' ).
    lo_primitive_property->set_edm_name( 'POBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_IS_WITHOUT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'POBoxIsWithoutNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'POBoxPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_LOBBY_NAME' ).
    lo_primitive_property->set_edm_name( 'POBoxLobbyName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingCityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_REGION' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingRegion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CARE_OF_NAME' ).
    lo_primitive_property->set_edm_name( 'CareOfName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_SERVICE_TYPE_CODE' ).
    lo_primitive_property->set_edm_name( 'DeliveryServiceTypeCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_SERVICE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DeliveryServiceNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_TIME_ZONE' ).
    lo_primitive_property->set_edm_name( 'AddressTimeZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIONAL_STRUCTURE_CHECK_S' ).
    lo_primitive_property->set_edm_name( 'RegionalStructureCheckStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_TP' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderTP' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_purchase_order_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PURCHASE_ORDER_TYPE'
                                    is_structure              = VALUE tys_purchase_order_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurchaseOrder_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PURCHASE_ORDER' ).
    lo_entity_set->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_TYPE_2' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_SUBTYPE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderSubtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_PROCES' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentProcessCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_DATE' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGE_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangeDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_START_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_END_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_DELETION_CO' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderDeletionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELEASE_IS_NOT_COMPLETED' ).
    lo_primitive_property->set_edm_name( 'ReleaseIsNotCompleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_COMPLETENESS_ST' ).
    lo_primitive_property->set_edm_name( 'PurchasingCompletenessStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PROCESSING_STAT' ).
    lo_primitive_property->set_edm_name( 'PurchasingProcessingStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_RELEASE_SEQUENCE_STAT' ).
    lo_primitive_property->set_edm_name( 'PurgReleaseSequenceStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELEASE_CODE' ).
    lo_primitive_property->set_edm_name( 'ReleaseCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_RELEASE_STRATEG' ).
    lo_primitive_property->set_edm_name( 'PurchasingReleaseStrategy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_REASON_FOR_DOC_CANCEL' ).
    lo_primitive_property->set_edm_name( 'PurgReasonForDocCancellation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_GROUP' ).
    lo_primitive_property->set_edm_name( 'PurchasingGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_SUPPLIER_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'ManualSupplierAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'SupplierAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_RESP_SALES_PERSON' ).
    lo_primitive_property->set_edm_name( 'SupplierRespSalesPersonName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SupplierPhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLYING_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'SupplyingSupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLYING_PLANT' ).
    lo_primitive_property->set_edm_name( 'SupplyingPlant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY' ).
    lo_primitive_property->set_edm_name( 'InvoicingParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_QUOTATION_EXTERNA' ).
    lo_primitive_property->set_edm_name( 'SupplierQuotationExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUOTATION_SUBMISSION_DATE' ).
    lo_primitive_property->set_edm_name( 'QuotationSubmissionDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_NUMBER_INTERVAL_FOR_S' ).
    lo_primitive_property->set_edm_name( 'ItemNumberIntervalForSubItems' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'PaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PAYMENT_DAYS' ).
    lo_primitive_property->set_edm_name( 'NetPaymentDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'DownPaymentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_PERCENTAGE_OF' ).
    lo_primitive_property->set_edm_name( 'DownPaymentPercentageOfTotAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'DownPaymentAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWN_PAYMENT_DUE_DATE' ).
    lo_primitive_property->set_edm_name( 'DownPaymentDueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_TRANSFER_LOCATIO' ).
    lo_primitive_property->set_edm_name( 'IncotermsTransferLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_VERSION' ).
    lo_primitive_property->set_edm_name( 'IncotermsVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_INTRASTAT_REPORTING_REL' ).
    lo_primitive_property->set_edm_name( 'IsIntrastatReportingRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_INTRASTAT_REPORTING_EXC' ).
    lo_primitive_property->set_edm_name( 'IsIntrastatReportingExcluded' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_INTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncInternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'PricingDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE' ).
    lo_primitive_property->set_edm_name( 'PricingProcedure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCHANGE_RATE' ).
    lo_primitive_property->set_edm_name( 'ExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCHANGE_RATE_IS_FIXED' ).
    lo_primitive_property->set_edm_name( 'ExchangeRateIsFixed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_RETURN_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxReturnCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATREGISTRATION_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'VATRegistrationCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_PROD_CMPLNC_SU' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdProdCmplncSuplrSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_PROD_MARKETABI' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdProdMarketabilitySts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_SFTY_DATA_SHEE' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdSftyDataSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_TOT_DNGRS' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncTotDngrsGoodsSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_COLLECTIVE_NUMB' ).
    lo_primitive_property->set_edm_name( 'PurchasingCollectiveNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_NOTE' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderNote' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_NOTE_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_PARTNER' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderPartner' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_PARTNER_TYP' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SUPPLIER_ADDRESS' ).
    lo_navigation_property->set_edm_name( '_SupplierAddress' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_SUPPLIER__2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_pur_order_item_delivery__2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PUR_ORDER_ITEM_DELIVERY__2'
                                    is_structure              = VALUE tys_pur_order_item_delivery__2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurOrderItemDeliveryAddress_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PUR_ORDER_ITEM_DELIVERY_AD' ).
    lo_entity_set->set_edm_name( 'PurOrderItemDeliveryAddress' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'AddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_PERSON_ID' ).
    lo_primitive_property->set_edm_name( 'AddressPersonID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_REPRESENTATION_COD' ).
    lo_primitive_property->set_edm_name( 'AddressRepresentationCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDENCE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'CorrespondenceLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRFRD_COMM_MEDIUM_TYPE' ).
    lo_primitive_property->set_edm_name( 'PrfrdCommMediumType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESSEE_FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'AddresseeFullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_1' ).
    lo_primitive_property->set_edm_name( 'OrganizationName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_2' ).
    lo_primitive_property->set_edm_name( 'OrganizationName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_3' ).
    lo_primitive_property->set_edm_name( 'OrganizationName3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_NAME_4' ).
    lo_primitive_property->set_edm_name( 'OrganizationName4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_SEARCH_TERM_1' ).
    lo_primitive_property->set_edm_name( 'AddressSearchTerm1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_SEARCH_TERM_2' ).
    lo_primitive_property->set_edm_name( 'AddressSearchTerm2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRICT_NAME' ).
    lo_primitive_property->set_edm_name( 'DistrictName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VILLAGE_NAME' ).
    lo_primitive_property->set_edm_name( 'VillageName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'HouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER_SUPPLEMENT_TE' ).
    lo_primitive_property->set_edm_name( 'HouseNumberSupplementText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUILDING' ).
    lo_primitive_property->set_edm_name( 'Building' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLOOR' ).
    lo_primitive_property->set_edm_name( 'Floor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROOM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'RoomNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORM_OF_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'FormOfAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORT_ZONE' ).
    lo_primitive_property->set_edm_name( 'TransportZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX' ).
    lo_primitive_property->set_edm_name( 'POBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_IS_WITHOUT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'POBoxIsWithoutNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'POBoxPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_LOBBY_NAME' ).
    lo_primitive_property->set_edm_name( 'POBoxLobbyName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingCityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_REGION' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingRegion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CARE_OF_NAME' ).
    lo_primitive_property->set_edm_name( 'CareOfName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_SERVICE_TYPE_CODE' ).
    lo_primitive_property->set_edm_name( 'DeliveryServiceTypeCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_SERVICE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DeliveryServiceNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_TIME_ZONE' ).
    lo_primitive_property->set_edm_name( 'AddressTimeZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIONAL_STRUCTURE_CHECK_S' ).
    lo_primitive_property->set_edm_name( 'RegionalStructureCheckStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_pur_order_item_pricing_e_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PUR_ORDER_ITEM_PRICING_E_2'
                                    is_structure              = VALUE tys_pur_order_item_pricing_e_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PurOrderItemPricingElement_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PUR_ORDER_ITEM_PRICING_ELE' ).
    lo_entity_set->set_edm_name( 'PurOrderItemPricingElement' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'PricingDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PricingDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_STEP' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureStep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_COUNTER' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_APPLICATION' ).
    lo_primitive_property->set_edm_name( 'ConditionApplication' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_CONDITION_DETERMINAT' ).
    lo_primitive_property->set_edm_name( 'PriceConditionDeterminationDte' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CALCULATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionCalculationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_DETN_EXCHANGE_RATE' ).
    lo_primitive_property->set_edm_name( 'PriceDetnExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_NMRT' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_DNMN' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'ConditionCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_FOR_STATISTIC' ).
    lo_primitive_property->set_edm_name( 'ConditionIsForStatistics' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_TYPE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_RELEVANT_FOR_ACCRUAL' ).
    lo_primitive_property->set_edm_name( 'IsRelevantForAccrual' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_IS_RELEVANT_FOR_INVOI' ).
    lo_primitive_property->set_edm_name( 'CndnIsRelevantForInvoiceList' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'ConditionOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_GROUP_CONDITION' ).
    lo_primitive_property->set_edm_name( 'IsGroupCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCESS_NUMBER_OF_ACCESS_SE' ).
    lo_primitive_property->set_edm_name( 'AccessNumberOfAccessSequence' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SEQUENTIAL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ConditionSequentialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_KEY_FOR_GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'AccountKeyForGLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCT_KEY_FOR_ACCRUALS_GLAC' ).
    lo_primitive_property->set_edm_name( 'AcctKeyForAccrualsGLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCRUALS_GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'AccrualsGLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHHOLDING_TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'WithholdingTaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREIGHT_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'FreightSupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_ROUNDING_OFF_DIFF_AMO' ).
    lo_primitive_property->set_edm_name( 'CndnRoundingOffDiffAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CONTROL' ).
    lo_primitive_property->set_edm_name( 'ConditionControl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_INACTIVE_REASON' ).
    lo_primitive_property->set_edm_name( 'ConditionInactiveReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CLASS' ).
    lo_primitive_property->set_edm_name( 'ConditionClass' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRCG_PROCEDURE_COUNTER_FOR' ).
    lo_primitive_property->set_edm_name( 'PrcgProcedureCounterForHeader' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FACTOR_FOR_CONDITION_BASIS' ).
    lo_primitive_property->set_edm_name( 'FactorForConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STRUCTURE_CONDITION' ).
    lo_primitive_property->set_edm_name( 'StructureCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERIOD_FACTOR_FOR_CNDN_BAS' ).
    lo_primitive_property->set_edm_name( 'PeriodFactorForCndnBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_BASIS' ).
    lo_primitive_property->set_edm_name( 'PricingScaleBasis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_BASIS_VALU' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_BASIS_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleBasisUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_BASIS_CURR' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleBasisCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ALTERNATIVE_CURR' ).
    lo_primitive_property->set_edm_name( 'ConditionAlternativeCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_AMOUNT_IN_LOCAL' ).
    lo_primitive_property->set_edm_name( 'ConditionAmountInLocalCrcy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_IS_RELEVANT_FOR_INTCO' ).
    lo_primitive_property->set_edm_name( 'CndnIsRelevantForIntcoBilling' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_MANUALLY_CHAN' ).
    lo_primitive_property->set_edm_name( 'ConditionIsManuallyChanged' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_PRICE_SOURCE' ).
    lo_primitive_property->set_edm_name( 'BillingPriceSource' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION_LEVEL' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdictionLevel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BYTE_SEQUENCE' ).
    lo_primitive_property->set_edm_name( 'ConditionByteSequence' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_IS_RELEVANT_FOR_LIMIT' ).
    lo_primitive_property->set_edm_name( 'CndnIsRelevantForLimitValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASIS_LIMIT_EXCE' ).
    lo_primitive_property->set_edm_name( 'ConditionBasisLimitExceeded' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_AMOUNT_LIMIT_EXC' ).
    lo_primitive_property->set_edm_name( 'ConditionAmountLimitExceeded' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUMULATED_CONDITION_BASIS' ).
    lo_primitive_property->set_edm_name( 'CumulatedConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_REBATE_RECIPIENT' ).
    lo_primitive_property->set_edm_name( 'CustomerRebateRecipient' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_FOR_CONFIGURA' ).
    lo_primitive_property->set_edm_name( 'ConditionIsForConfiguration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIANT_CONDITION' ).
    lo_primitive_property->set_edm_name( 'VariantCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 26 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ACCT_ASSGMT_RELE' ).
    lo_primitive_property->set_edm_name( 'ConditionAcctAssgmtRelevance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_MATRIX_MAINT_REL' ).
    lo_primitive_property->set_edm_name( 'ConditionMatrixMaintRelevance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONFIGBL_PARAMETERS_AND_FO' ).
    lo_primitive_property->set_edm_name( 'ConfigblParametersAndFormulas' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ADJUSTED_QUANTIT' ).
    lo_primitive_property->set_edm_name( 'ConditionAdjustedQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 14 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE_NAME' ).
    lo_primitive_property->set_edm_name( 'ConditionTypeName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_VALUE_INTL' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseValueIntlUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE_INTL' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValueIntlUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE_NAME' ).
    lo_primitive_property->set_edm_name( 'TaxCodeName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_DELETABLE' ).
    lo_primitive_property->set_edm_name( 'ConditionIsDeletable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE' ).
    lo_primitive_property->set_edm_name( 'PricingProcedure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPERORDINATE_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'SuperordinateDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPERORDINATE_DOCUMENT_ITE' ).
    lo_primitive_property->set_edm_name( 'SuperordinateDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PURCHASE_ORDER_ITEM_2' ).
    lo_navigation_property->set_edm_name( '_PurchaseOrderItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PURCHASE_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sap_message.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'SAP_MESSAGE'
                                    is_structure              = VALUE tys_sap_message( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'SAP__Message' ) ##NO_TEXT.
    lo_complex_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_primitive_property = lo_complex_type->get_primitive_property( 'CODE' ).
    lo_primitive_property->set_edm_name( 'code' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TARGET' ).
    lo_primitive_property->set_edm_name( 'target' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'ADDITIONAL_TARGETS' ).
    lo_primitive_property->set_edm_name( 'additionalTargets' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_collection( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TRANSITION' ).
    lo_primitive_property->set_edm_name( 'transition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'NUMERIC_SEVERITY' ).
    lo_primitive_property->set_edm_name( 'numericSeverity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Byte' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'LONGTEXT_URL' ).
    lo_primitive_property->set_edm_name( 'longtextUrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.
ENDCLASS.
