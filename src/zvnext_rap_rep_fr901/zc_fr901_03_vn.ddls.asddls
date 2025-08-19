@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_FR901_03_VN'
@Metadata.allowExtensions: true
define root view entity ZC_FR901_03_VN
  //  provider contract transactional_query
  as projection on ZI_FR901_03_VN
{
  key    CompanyCode,
  key    FiscalYear,
  key    AccountingDocument,
  key    LedgerGLLineItem,
         GLAccount,
         PostingDate,
         CostCenter,
         Taxcode,
         GLAccountName,
         OffsettingAccount,
         OffsettingAccountName,
         CompanyCodeCurrency,
         @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
         AmountInCompanyCodeCurrency,
         Status,
         Message,
         AccountingDocumentBase,
         AccountingDocumentHeaderText,
         /* Associations */
         _Detail
}
