@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_TEST_CDS_VIEW_01'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_TEST_CDS_VIEW_01
  as select distinct from I_PaymentProposalPayment
  association [0..1] to I_PaymentProgramControl as _PaymentProgramControl on  $projection.PaymentRunID                      =  _PaymentProgramControl.PaymentRunID
                                                                          and $projection.PaymentRunDate                    =  _PaymentProgramControl.PaymentRunDate
                                                                          and _PaymentProgramControl.NumberOfPostedPayments <> 0
  association [0..1] to zff001t_01_vn           as _PaymentDate           on  $projection.PaymentRunID      = _PaymentDate.paymentrunid
                                                                          and $projection.PaymentRunDate    = _PaymentDate.paymentrundate
                                                                          and $projection.PayingCompanyCode = _PaymentDate.paycompanycode

  association [0..*] to ZI_FF001_03_VN          as _PaymentDoc            on  $projection.PaymentRunID   = _PaymentDoc.PaymentRunID
                                                                          and $projection.PaymentRunDate = _PaymentDoc.PaymentRunDate

  //  composition [0..*] of ZI_FF001_03_VN          as _PaymentDoc

{
        @Semantics.businessDate.from: true
  key   PaymentRunDate,
  key   PaymentRunID,
        @ObjectModel.text.element: [ 'CompanyCodeName' ]
  key   PayingCompanyCode,
        _CompanyCode.CompanyCodeName      as CompanyCodeName,
        @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
        sum( PaytAmountInCoCodeCurrency ) as PaytAmountInCoCodeCurrency,
        CompanyCodeCurrency,
        @ObjectModel.text.element: [ 'BankName' ]
        HouseBank,
        _Bank.BankName                    as BankName,
        HouseBankAccount,
        BankCountry,
        @Semantics.nullValueIndicatorFor: 'PaymentRunDate'
        cast ('X' as boole_d)             as NullValIndicator,
        //        _PaymentDate.paymentduedate       as PaymentDueDate,
        //        _PaymentDate.paybaselinedate      as PayBaseLineDate,
        //        _PaymentDate.locallastchangedat   as Locallastchangedat,
        _PaymentProgramControl,
        _PaymentDoc

}
where
      PaymentRunIsProposal               = ' '
  and I_PaymentProposalPayment.HouseBank = 'JPBK2'
group by
  PaymentRunDate,
  PaymentRunID,
  PayingCompanyCode,
  CompanyCodeCurrency,
  HouseBank,
  HouseBankAccount,
  _CompanyCode.CompanyCodeName,
  BankCountry,
  _Bank.BankName
//  _PaymentDate.paymentduedate,
//  _PaymentDate.paybaselinedate,
//  _PaymentDate.locallastchangedat
