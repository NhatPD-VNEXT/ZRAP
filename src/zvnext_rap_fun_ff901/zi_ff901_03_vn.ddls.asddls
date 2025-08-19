@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FF901_03_VN'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_FF901_03_VN
  as select from ZI_FF901_01_VN as Header
  association [0..*] to ZI_FF901_02_VN as _Detail on  $projection.AccountingDocument = _Detail.AccountingDocumentBase
                                                  and $projection.CompanyCode        = _Detail.CompanyCode
                                                  and $projection.FiscalYear         = _Detail.FiscalYearBase
{
  key Header.CompanyCode,
  key Header.FiscalYear,
  key Header.AccountingDocument,
  key Header.LedgerGLLineItem,
      Header.AccountingDocumentType,
      Header.PostingDate,
      Header.CostCenter,
      Header.Taxcode,
      Header.GLAccount,
      Header.GLAccountName,
      Header.OffsettingAccount,
      Header.OffsettingAccountName,
      Header.CompanyCodeCurrency,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      Header.AmountInCompanyCodeCurrency,
      Header.AccountingDocumentBase,
      Header.AccountingDocumentHeaderText,
      _Detail
}
where
  AccountingDocumentBase is null
