@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_TEST_CDS_VIEW_02'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TEST_CDS_VIEW_02
  as select from ZI_TEST_CDS_VIEW_01 as Data
  association [0..1] to zff001t_01_vn as _PaymentDate on  $projection.PaymentRunID      = _PaymentDate.paymentrunid
                                                      and $projection.PaymentRunDate    = _PaymentDate.paymentrundate
                                                      and $projection.PayingCompanyCode = _PaymentDate.paycompanycode

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
      _PaymentDate.paymentduedate     as PaymentDueDate,
      _PaymentDate.paybaselinedate    as PayBaseLineDate,
      _PaymentDate.locallastchangedat as Locallastchangedat,
      /* Associations */
      _PaymentDoc,
      _PaymentProgramControl
}
