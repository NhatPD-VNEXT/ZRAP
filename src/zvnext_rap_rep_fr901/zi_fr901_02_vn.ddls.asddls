@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FR901_02_VN'

/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define root view entity ZI_FR901_02_VN
  as select from zf901t_d_vn
{
  key key_uuid                       as KeyUuid,
      @UI.lineItem                : [{ position: 10 }]
      company_code                   as CompanyCode,
      @UI.lineItem                : [{ position: 10 }]
      fiscal_year_base               as FiscalYearBase,
      @UI.lineItem                : [{ position: 10 }]
      accounting_document_base       as AccountingDocumentBase,
      @UI.lineItem                : [{ position: 10 }]
      fiscal_year                    as FiscalYear,
      @UI.lineItem                : [{ position: 10 }]
      accounting_document            as AccountingDocument,
      @UI.lineItem                : [{ position: 10 }]
      posting_date                   as PostingDate,
      @UI.lineItem                : [{ position: 10 }]
      glaccount_s                    as GlaccountS,
      @UI.lineItem                : [{ position: 10 }]
      glaccount_name_s               as GlaccountNameS,
      @UI.lineItem                : [{ position: 10 }]
      glaccount_h                    as GlaccountH,
      @UI.lineItem                : [{ position: 10 }]
      glaccount_name_h               as GlaccountNameH,
      @UI.lineItem                : [{ position: 10 }]
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      amounting_transaction_currency as AmountingTransactionCurrency,
      @UI.lineItem                : [{ position: 10 }]
      company_code_currency          as CompanyCodeCurrency,
      @UI.lineItem                : [{ position: 10 }]
      header_text                    as HeaderText,
      costcenter                     as Costcenter,
      taxcode                        as Taxcode,
      created_by                     as CreatedBy,
      created_at                     as CreatedAt,
      local_last_changed_by          as LocalLastChangedBy,
      local_last_changed_at          as LocalLastChangedAt,
      last_changed_at                as LastChangedAt
}
