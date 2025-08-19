@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Header FR003'
@Metadata.allowExtensions: true

@UI: {
    headerInfo: {
        typeName: 'Allocate',
        typeNamePlural: 'Allocate',
        title: {
            type: #STANDARD, value: 'AccountingDocument'
        }
    }
}

define root view entity ZC_FR003_H_VN
  as projection on ZR_FR003_H_VN
{
      @UI.facet: [ {
           id: 'idIdentification',
           type: #IDENTIFICATION_REFERENCE,
           label: 'General infomation',
           position: 10
         },
           {
         label: 'Detail',
         id: 'Data',
         type: #LINEITEM_REFERENCE,
         position: 20,
         targetElement: '_detail',
         purpose: #STANDARD
       }
       ]
      @UI.selectionField          : [{ position: 10 }]
      @UI.identification          : [{ position: 10 }
                                  ,{ type: #FOR_ACTION, dataAction: 'Allocate', label: 'Allocate'}]
      @UI.lineItem                : [{ position: 10 }]
      @EndUserText.label          : 'Company code'
      @Consumption.filter         : {mandatory: true}
  key CompanyCode,
      @UI.selectionField          : [{ position: 20 }]
      @UI.identification          : [{ position: 20 },
                                     { type: #FOR_ACTION, dataAction: 'Post', label: 'Post', 
                                       determining: true, criticality: 'CriticalityAction01' },
                                     { type: #FOR_ACTION, dataAction: 'Reverse', label: 'Reverse', 
                                       determining: true, criticality: 'CriticalityAction02' }]
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
      DebitCreditCode,
      CompanyCodeCurrency,
      @UI.lineItem                : [{ position: 70 }]
      @EndUserText.label          : 'Tax Code'
      TaxCode,
      @UI.lineItem                : [{ position: 80 }]
      @EndUserText.label          : 'Cost Center'
      CostCenter,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      @UI. identification: [ { position: 90 } ]
      @UI.lineItem                : [{ position: 90 }]
      @EndUserText.label          : 'Amount'
      AmountInTransactionCurrency,
      @UI.lineItem                : [{ position: 91 }]
      @EndUserText.label          : 'Allocated months'
      allocatedmonths,
      Root,
      @UI.lineItem                : [{ position: 100, criticality: 'CriticalityStatus' }]
      @EndUserText.label          : 'Message Status'
      MessageStatus,
      CriticalityStatus,
      CriticalityAction01,
      CriticalityAction02,
      /* Associations */
      _detail
}
