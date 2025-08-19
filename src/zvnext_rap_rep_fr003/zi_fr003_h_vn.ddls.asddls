@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Combine data header FR003'

define view entity ZI_FR003_H_VN
  as select from I_JournalEntryItem as _header

  association [0..*] to ZR_FR003_D_VN as _detail
    on  $projection.AccountingDocument = _detail.Accountingdocument
    and $projection.CompanyCode        = _detail.Companycode
    and $projection.FiscalYear         = _detail.Fiscalyear

  association [1..1] to zfr003_h_vn   as _log
    on  $projection.AccountingDocument = _log.accountingdocument
    and $projection.CompanyCode        = _log.companycode
    and $projection.FiscalYear         = _log.fiscalyear

{
  key _header.CompanyCode,
  key _header.FiscalYear,
  key _header.AccountingDocument,

      _header.OffsettingAccount,
      //      _header._AlternativeGLAccountText.GLAccountName,
      _header.GLAccount,
      _header.AccountingDocumentType,
      _header.DebitCreditCode,
      _header.CompanyCodeCurrency,
      _header.TaxCode,
      _header.CostCenter,
      _log.status,
      _log.allocatedmonths,

      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      _header.AmountInTransactionCurrency,

      _detail.Rootaccountingdocument       as Root,

      _detail
}

where Ledger                    = '0L'
  and GLAccount                 = '0012561000'
  and FiscalPeriod              = '012'
  and ReversalReferenceDocument = ''
