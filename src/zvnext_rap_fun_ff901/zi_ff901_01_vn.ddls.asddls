@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FF901_01_VN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK", "KEY_CHECK" ]  } */
define view entity ZI_FF901_01_VN
  as select from I_JournalEntryItem as Data
  association [1..1] to I_GLAccountText as _GLAccountText         on  $projection.GLAccount   = _GLAccountText.GLAccount
                                                                  and _GLAccountText.Language = $session.system_language
  association [1..1] to I_GLAccountText as _OffsettingAccountText on  $projection.OffsettingAccount   = _OffsettingAccountText.GLAccount
                                                                  and _OffsettingAccountText.Language = $session.system_language
  association [1..1] to zf901t_vn       as _Log                   on  $projection.CompanyCode        = _Log.company_code
                                                                  and $projection.AccountingDocument = _Log.accounting_document
                                                                  and $projection.FiscalYear         = _Log.fiscal_year
  association [1..1] to zf901t_vn       as _Logbase               on  $projection.CompanyCode        = _Logbase.company_code
                                                                  and $projection.AccountingDocument = _Logbase.accounting_document_base
                                                                  and $projection.FiscalYear         = _Logbase.fiscal_year_base
  association [1..1] to I_JournalEntry  as _JournalEntry          on  $projection.AccountingDocument = _JournalEntry.AccountingDocument
                                                                  and $projection.CompanyCode        = _JournalEntry.CompanyCode
                                                                  and $projection.FiscalYear         = _JournalEntry.FiscalYear
{
  key       Data.CompanyCode                           as CompanyCode,
  key       Data.FiscalYear                            as FiscalYear,
  key       Data.AccountingDocument                    as AccountingDocument,
  key       Data.LedgerGLLineItem                      as LedgerGLLineItem,
            Data.AccountingDocumentType                as AccountingDocumentType,
            Data.PostingDate                           as PostingDate,
            Data.CostCenter                            as CostCenter,
            Data.TaxCode                               as Taxcode,
            Data.GLAccount                             as GLAccount,
            _GLAccountText.GLAccountName               as GLAccountName,
            Data.OffsettingAccount                     as OffsettingAccount,
            _OffsettingAccountText.GLAccountName       as OffsettingAccountName,
            Data.CompanyCodeCurrency                   as CompanyCodeCurrency,
            @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
            Data.AmountInCompanyCodeCurrency           as AmountInCompanyCodeCurrency,
            _Log.accounting_document_base              as AccountingDocumentBase,
            _Logbase.log_status                        as LogStatus,
            _JournalEntry.AccountingDocumentHeaderText as AccountingDocumentHeaderText
}
where
      Ledger                    = '0L'
  and AccountingDocumentType    = 'SA'
  and FiscalPeriod              = '004'
  and ReversalReferenceDocument = ''
