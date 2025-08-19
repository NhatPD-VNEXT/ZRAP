@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FR901_03_VN'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_FR901_03_VN
  as select from ZI_FR901_01_VN as _Header
  association [0..*] to ZI_FR901_02_VN as _Detail on  $projection.AccountingDocument = _Detail.AccountingDocumentBase
                                                  and $projection.CompanyCode        = _Detail.CompanyCode
                                                  and $projection.FiscalYear         = _Detail.FiscalYearBase
{
  key        _Header.CompanyCode,
  key        _Header.FiscalYear,
  key        _Header.AccountingDocument,
  key        _Header.LedgerGLLineItem,
             _Header.GLAccount,
             _Header.PostingDate,
             _Header.CostCenter,
             _Header.Taxcode,
             _Header.GLAccountName,
             _Header.OffsettingAccount,
             _Header.OffsettingAccountName,
             _Header.CompanyCodeCurrency,
             @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
             _Header.AmountInCompanyCodeCurrency,
             _Header.Status,
             _Header.Message,
             _Header.AccountingDocumentBase,
             _Header.AccountingDocumentHeaderText,
             _Detail
}
where
  AccountingDocumentBase is null
