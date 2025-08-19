@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view data FR003'
@Metadata.allowExtensions: true

@UI: {
    headerInfo: {
        typeName: 'Detail',
        typeNamePlural: 'Detail',
        title: {
            type: #STANDARD, value: 'Rootaccountingdocument'
        }
    }
}

define root view entity ZC_FR003_D_VN
  provider contract transactional_query
  as projection on ZR_FR003_D_VN
{
@UI.facet: [ { id: 'idIdentification', 
               type: #IDENTIFICATION_REFERENCE, 
               label: 'Detail', position: 10, 
               targetQualifier: 'idIdentification' }]

  key KeyUuid,
      @UI.lineItem                : [{ position: 10 }]
      @UI.identification          : [{ position: 10, qualifier: 'idIdentification' }]
      @EndUserText.label          : 'Company code'
      Companycode,
      @UI.lineItem                : [{ position: 20 }]
      @UI.identification          : [{ position: 20 }]
      @EndUserText.label          : 'Fiscal year'
      Fiscalyear,
      @UI.lineItem                : [{ position: 21 }]
      @UI.identification          : [{ position: 21 }]
      @EndUserText.label          : 'Posting date'
      Postingdate,
      @UI.lineItem                : [{ position: 30 }]
      @UI.identification          : [{ position: 30 }]
      @EndUserText.label          : 'Accounting document'
      Accountingdocument,
      @UI.lineItem                : [{ position: 40 }]
      @UI.identification          : [{ position: 40 }]
      @EndUserText.label          : 'Root accounting document'
      Rootaccountingdocument,
      @UI.lineItem                : [{ position: 50 }]
      @UI.identification          : [{ position: 50 }]
      @EndUserText.label          : 'Gl account'
      Glaccount,
      @UI.lineItem                : [{ position: 60 }]
      @UI.identification          : [{ position: 60 }]
      @EndUserText.label          : 'Offsetting account'
      Offsettingaccount,
      Companycodecurrency,
      @UI.lineItem                : [{ position: 80 }]
      @UI.identification          : [{ position: 80 }]
      @EndUserText.label          : 'Amount'
      Amountintransactioncurrency,
      @UI.lineItem                : [{ position: 90 }]
      @UI.identification          : [{ position: 90 }]
      @EndUserText.label          : 'Cost center'
      Costcenter,
      @UI.lineItem                : [{ position: 100 }]
      @UI.identification          : [{ position: 100 }]
      @EndUserText.label          : 'Tax code'
      Taxcode,
      @UI.lineItem                : [{ position: 110, criticality: 'CriticalityStatus' }]
      @EndUserText.label          : 'Message'
      Message,
      CriticalityStatus
}
