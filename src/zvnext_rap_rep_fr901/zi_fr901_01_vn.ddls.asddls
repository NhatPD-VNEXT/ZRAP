//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FR901_01_VN'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK", "KEY_CHECK" ]  } */
define view entity ZI_FR901_01_VN
  as select from I_JournalEntryItem as _Data
  association [1..1] to I_GLAccountText as _GLAccountText         on  $projection.GLAccount   = _GLAccountText.GLAccount
                                                                  and _GLAccountText.Language = $session.system_language
  association [1..1] to I_GLAccountText as _OffsettingAccountText on  $projection.OffsettingAccount   = _OffsettingAccountText.GLAccount
                                                                  and _OffsettingAccountText.Language = $session.system_language
  association [1..1] to zf901t_vn       as _LogHeader             on  $projection.CompanyCode        = _LogHeader.company_code
                                                                  and $projection.AccountingDocument = _LogHeader.accounting_document_base
                                                                  and $projection.FiscalYear         = _LogHeader.fiscal_year_base
  association [1..1] to zf901t_vn       as _LogDetail             on  $projection.CompanyCode        = _LogDetail.company_code
                                                                  and $projection.AccountingDocument = _LogDetail.accounting_document
                                                                  and $projection.FiscalYear         = _LogDetail.fiscal_year
  association [1..1] to I_JournalEntry  as _JournalEntry          on  $projection.AccountingDocument = _JournalEntry.AccountingDocument
                                                                  and $projection.CompanyCode        = _JournalEntry.CompanyCode
                                                                  and $projection.FiscalYear         = _JournalEntry.FiscalYear
{
  key       _Data.CompanyCode                          as CompanyCode,
  key       _Data.FiscalYear                           as FiscalYear,
  key       _Data.AccountingDocument                   as AccountingDocument,
  key       _Data.LedgerGLLineItem                     as LedgerGLLineItem,
            _Data.AccountingDocumentType               as AccountingDocumentType,
            _Data.PostingDate                          as PostingDate,
            _Data.CostCenter                           as CostCenter,
            _Data.TaxCode                              as Taxcode,
            _Data.GLAccount                            as GLAccount,
            _GLAccountText.GLAccountName               as GLAccountName,
            _Data.OffsettingAccount                    as OffsettingAccount,
            _OffsettingAccountText.GLAccountName       as OffsettingAccountName,
            _Data.CompanyCodeCurrency                  as CompanyCodeCurrency,
            @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
            _Data.AmountInCompanyCodeCurrency          as AmountInCompanyCodeCurrency,
            _LogHeader.log_status                      as Status,
            _LogHeader.log_message                     as Message,
            _LogDetail.accounting_document_base        as AccountingDocumentBase,
            _JournalEntry.AccountingDocumentHeaderText as AccountingDocumentHeaderText
}
where
      Ledger                    = '0L'
  and AccountingDocumentType    = 'SA'
  //  and GLAccount                 = '0012561000'
  and FiscalPeriod              = '004'
  and ReversalReferenceDocument = ''
