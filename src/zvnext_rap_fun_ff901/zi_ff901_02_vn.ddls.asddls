@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FF901_02_VN'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_FF901_02_VN
  as select from zf901t_vn
{
         @UI.lineItem                : [{ position: 10 }]
  key    company_code                   as CompanyCode,
         @UI.lineItem                : [{ position: 20 }]
  key    fiscal_year_base               as FiscalYearBase,
         @UI.lineItem                : [{ position: 30 }]
  key    accounting_document_base       as AccountingDocumentBase,
         @UI.lineItem                : [{ position: 60 }]
  key    allocated_line_item            as AllocatedLineItem,
         @UI.lineItem                : [{ position: 40 }]
         fiscal_year                    as FiscalYear,
         @UI.lineItem                : [{ position: 50 }]
         accounting_document            as AccountingDocument,
         @UI.lineItem                : [{ position: 70 }]
         source_ledger                  as SourceLedger,
         @UI.lineItem                : [{ position: 80 }]
         posting_date                   as PostingDate,
         @UI.lineItem                : [{ position: 90 }]
         glaccount_s                    as GlaccountS,
         @UI.lineItem                : [{ position: 100 }]
         glaccount_name_s               as GlaccountNameS,
         @UI.lineItem                : [{ position: 110 }]
         glaccount_h                    as GlaccountH,
         @UI.lineItem                : [{ position: 120 }]
         glaccount_name_h               as GlaccountNameH,
         @UI.lineItem                : [{ position: 130 }]
         @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
         amounting_transaction_currency as AmountingTransactionCurrency,
         @UI.lineItem                : [{ position: 140 }]
         company_code_currency          as CompanyCodeCurrency,
         @UI.lineItem                : [{ position: 150 }]
         header_text                    as HeaderText,
         @UI.lineItem                : [{ position: 160 }]
         allocate_months                as AllocateMonths,
         @UI.lineItem                : [{ position: 170 }]
         log_status                     as LogStatus,
         @UI.lineItem                : [{ position: 180 }]
         log_message                    as Logmessage,
         created_by                     as CreatedBy,
         created_at                     as CreatedAt,
         local_last_changed_by          as LocalLastChangedBy,
         local_last_changed_at          as LocalLastChangedAt,
         last_changed_at                as LastChangedAt
}
