@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projetion view data header FR003'
define root view entity ZC_FR003_DATA_H_VN
  as projection on ZR_FR003_DATA_H_VN
{
  key Companycode,
  key Fiscalyear,
  key Accountingdocument,
      Glaccount,
      Offsettingaccount,
      Companycodecurrency,
      Amountintransactioncurrency,
      Costcenter,
      Taxcode,
      Status,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
