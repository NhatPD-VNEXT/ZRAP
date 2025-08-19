@ObjectModel.query.implementedBy:'ABAP:ZCL_FR001_VN'
@EndUserText.label: ''
@Metadata.allowExtensions: true
define custom entity ZI_FR001_VN
{
      @UI.selectionField          : [{ position: 10 }]
      @UI.lineItem                : [{ position: 10 }]
//                    { type        : #FOR_ACTION, dataAction: 'Post', label: 'Post'  }]
      @EndUserText.label          : 'Company code'
      @Consumption.filter         : {mandatory: true}
  key CompanyCode                 : bukrs;

      @UI.selectionField          : [{ position: 20 }]
      @UI.lineItem                : [{ position: 20 }]
      @EndUserText.label          : 'Fiscal Year Period'
      @Consumption.filter         : {mandatory: true }
  key FiscalYearPeriod            : fis_jahrper_conv;

      @UI.selectionField          : [{ position: 40 }]
      @UI.lineItem                : [{ position: 30 }]
      @EndUserText.label          : 'Accounting Document'
  key AccountingDocument          : belnr_d;

      @UI.lineItem                : [{ position: 31 }]
      @EndUserText.label          : 'Fiscal Year'
      FiscalYear                  : gjahr;

      @UI.selectionField          : [{ position: 40 }]
      @UI.lineItem                : [{ position: 40 }]
      @EndUserText.label          : 'Offsetting Account'
      //      @Consumption.filter         : {mandatory: true}
      OffsettingAccount           : hkont;

      @UI.lineItem                : [{ position: 41 }]
      @EndUserText.label          : 'GL Account'
      GLAccount                   : hkont;

      @UI.lineItem                : [{ position: 50 }]
      @EndUserText.label          : 'Accounting Document Type'
      AccountingDocumentType      : blart;

      @UI.lineItem                : [{ position: 60 }]
      @EndUserText.label          : 'Debit-Credit Code'
      DebitCreditCode             : shkzg;

      @UI.lineItem                : [{ position: 70 }]
      @EndUserText.label          : 'Reversal Reference Document'
      ReversalReferenceDocument   : belnr_d;

      //      @UI.lineItem                : [{ position: 110 }]
      //      @EndUserText.label          : 'Currency'
      CompanyCodeCurrency         : waers;

      @UI.lineItem                : [{ position: 80 }]
      @EndUserText.label          : 'Amount'
      @Semantics                  : { amount : {currencyCode: 'CompanyCodeCurrency'} }
      AmountInTransactionCurrency : dmbtr;

      @UI.lineItem                : [{ position: 90 }]
      @EndUserText.label          : 'Tax code'
      taxcode                     : mwskz;

      @UI.lineItem                : [{ position: 100 }]
      @EndUserText.label          : 'Cost Center'
      CostCenter                  : kostl;

      @UI.lineItem                : [{ position: 110 }]
      @EndUserText.label          : 'Allocated months'
      Allocatedmonths             : int4;
}
