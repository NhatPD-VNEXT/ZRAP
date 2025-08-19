@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine data header FR002'

define view entity ZI_FR002_H_VN
  as select from I_JournalEntryItem as _header
  association [0..*] to ZI_FR002_VN as _detail_2 on  $projection.AccountingDocument = _detail_2.Accountingdocument
                                                 and $projection.CompanyCode        = _detail_2.Companycode
                                                 and $projection.FiscalYear         = _detail_2.Fiscalyear
{
  key _header.CompanyCode,
  key _header.FiscalYear,
  key _header.AccountingDocument,
      _header.OffsettingAccount,
      _header.GLAccount,
      _header.AccountingDocumentType,
      _header.DebitCreditCode,
      _header.CompanyCodeCurrency,
      _header.TaxCode,
      _header.CostCenter,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      _header.AmountInTransactionCurrency,
      _detail_2.Rootaccountingdocument as Child
}

where
      Ledger       = '0L'
  and GLAccount    = '0012561000'
  and FiscalPeriod = '012'
