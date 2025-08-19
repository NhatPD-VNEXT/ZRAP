@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_FF901_03_VN'
@Metadata.allowExtensions: true

define root view entity ZC_FF901_03_VN
  as projection on ZI_FF901_03_VN
{
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
      AccountingDocumentType,
      PostingDate,
      CostCenter,
      Taxcode,
      GLAccount,
      GLAccountName,
      OffsettingAccount,
      OffsettingAccountName,
      CompanyCodeCurrency,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      AmountInCompanyCodeCurrency,
      AccountingDocumentBase,
      AccountingDocumentHeaderText,
      /* Associations */
      _Detail
}
