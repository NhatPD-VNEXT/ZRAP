@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Header FR002'
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZC_FR002_H_VN
  as projection on ZR_FR002_VN
{
      @UI.selectionField          : [{ position: 10 }]
      @UI.lineItem                : [{ position: 10 }]
      //                    { type        : #FOR_ACTION, dataAction: 'Post', label: 'Post'  }]
      @EndUserText.label          : 'Company code'
      @Consumption.filter         : {mandatory: true}
  key CompanyCode,
      @UI.selectionField          : [{ position: 20 }]
      @UI.lineItem                : [{ position: 20 }]
      @EndUserText.label          : 'Fiscal Year'
      @Consumption.filter         : {mandatory: true }
  key FiscalYear,
      @UI.selectionField          : [{ position: 30 }]
      @UI.lineItem                : [{ position: 30 }]
      @EndUserText.label          : 'Accounting Document'
  key AccountingDocument,
      @UI.selectionField          : [{ position: 40 }]
      @UI.lineItem                : [{ position: 40 }]
      @EndUserText.label          : 'Offsetting Account'
      OffsettingAccount,
      @UI.selectionField          : [{ position: 50 }]
      @UI.lineItem                : [{ position: 50 }]
      @EndUserText.label          : 'GL Account'
      GLAccount,
      @UI.lineItem                : [{ position: 60 }]
      @EndUserText.label          : 'Accounting Document Type'
      AccountingDocumentType,
      @UI.lineItem                : [{ position: 70 }]
      @EndUserText.label          : 'Tax Code'
      TaxCode,
      @UI.lineItem                : [{ position: 80 }]
      @EndUserText.label          : 'Cost Center'
      CostCenter,
      CompanyCodeCurrency,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      @UI.lineItem                : [{ position: 90 }]
      @EndUserText.label          : 'Amount'
      AmountInTransactionCurrency
      /* Associations */
//      _detail : redirected to composition child ZC_FR002_D_VN
}
