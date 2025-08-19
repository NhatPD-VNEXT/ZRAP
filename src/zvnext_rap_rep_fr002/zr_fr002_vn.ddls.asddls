@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root data FR002'

define root view entity ZR_FR002_VN
  as select from ZI_FR002_H_VN as _header
//  composition [0..*] of ZI_FR002_VN as _detail
{
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
      OffsettingAccount,
      GLAccount,
      AccountingDocumentType,
      DebitCreditCode,
      CompanyCodeCurrency,
      TaxCode,
      CostCenter,
      Child,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      AmountInTransactionCurrency
      /* Associations */
//      _detail
}

where
  Child is null
