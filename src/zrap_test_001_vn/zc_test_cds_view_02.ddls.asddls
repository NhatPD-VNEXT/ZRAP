@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_TEST_CDS_VIEW_02'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TEST_CDS_VIEW_02
  as projection on ZI_TEST_CDS_VIEW_02
{
  key PaymentRunDate,
  key PaymentRunID,
  key PayingCompanyCode,
      CompanyCodeName,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      PaytAmountInCoCodeCurrency,
      CompanyCodeCurrency,
      HouseBank,
      BankName,
      HouseBankAccount,
      BankCountry,
      NullValIndicator,
      PaymentDueDate,
      PayBaseLineDate,
      Locallastchangedat,
      /* Associations */
      _PaymentDoc,
      _PaymentProgramControl
}
