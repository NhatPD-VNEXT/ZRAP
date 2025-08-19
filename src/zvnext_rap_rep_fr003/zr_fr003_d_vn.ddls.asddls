@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root data detail FR003'
define root view entity ZR_FR003_D_VN
  as select from zfr003_d_vn as _detail
{
  key key_uuid                    as KeyUuid,
      @UI.lineItem                : [{ position: 10 }]
      @EndUserText.label          : 'Company code'
      companycode                 as Companycode,
      @UI.lineItem                : [{ position: 20 }]
      @EndUserText.label          : 'Fiscal year'
      fiscalyear                  as Fiscalyear,
      @UI.lineItem                : [{ position: 30 },
                                     { type: #FOR_ACTION, dataAction: 'Edit', label: 'Change'}]
      @EndUserText.label          : 'Posting date'
      postingdate                 as Postingdate,
      @UI.lineItem                : [{ position: 40 }]
      @EndUserText.label          : 'Accounting document'
      accountingdocument          as Accountingdocument,
      rootaccountingdocument      as Rootaccountingdocument,
      @UI.lineItem                : [{ position: 60 }]
      @EndUserText.label          : 'Glaccount'
      glaccount                   as Glaccount,
      @UI.lineItem                : [{ position: 70 }]
      @EndUserText.label          : 'Offsetting account'
      offsettingaccount           as Offsettingaccount,
      companycodecurrency         as Companycodecurrency,
      @UI.lineItem                : [{ position: 80 }]
      @EndUserText.label          : 'Amount'
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      amountintransactioncurrency as Amountintransactioncurrency,
      @UI.lineItem                : [{ position: 90 }]
      @EndUserText.label          : 'Cost center'
      costcenter                  as Costcenter,
      @UI.lineItem                : [{ position: 100 }]
      @EndUserText.label          : 'Taxcode'
      taxcode                     as Taxcode,
      @UI.lineItem                : [{ position: 110 }]
      @EndUserText.label          : 'Message'
      message                     as Message,
      case when message is not initial then '2'
                 end              as CriticalityStatus
}
