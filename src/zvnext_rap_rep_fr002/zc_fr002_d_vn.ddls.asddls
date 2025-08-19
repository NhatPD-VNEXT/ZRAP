@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Detail FR002'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_FR002_D_VN
  as projection on ZI_FR002_VN
{
      @UI.lineItem                : [{ position: 10 }]
      //                    { type        : #FOR_ACTION, dataAction: 'Post', label: 'Post'  }]
      @EndUserText.label          : 'Company code'
      @Consumption.filter         : {mandatory: true}
  key Companycode,
      @UI.lineItem                : [{ position: 20 }]
      @EndUserText.label          : 'Fiscal Year'
      @Consumption.filter         : {mandatory: true }
  key Fiscalyear,
      @UI.lineItem                : [{ position: 30 }]
      @EndUserText.label          : 'Accounting Document'
  key Accountingdocument,
      @UI.lineItem                : [{ position: 31 }]
      @EndUserText.label          : 'Root accounting document'
      Rootaccountingdocument,
      @UI.selectionField          : [{ position: 40 }]
      @UI.lineItem                : [{ position: 40 }]
      @EndUserText.label          : 'Offsetting Account'
      Offsettingaccount,
      @UI.selectionField          : [{ position: 50 }]
      @UI.lineItem                : [{ position: 50 }]
      @EndUserText.label          : 'GL Account'
      Glaccount,
      @UI.lineItem                : [{ position: 70 }]
      @EndUserText.label          : 'Tax Code'
      Taxcode,
      @UI.lineItem                : [{ position: 80 }]
      @EndUserText.label          : 'Cost Center'
      Costcenter,
      Companycodecurrency,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      @UI.lineItem                : [{ position: 90 }]
      @EndUserText.label          : 'Amount'
      Amountintransactioncurrency,
      /* Associations */
      _header : redirected to parent ZC_FR002_H_VN
}
