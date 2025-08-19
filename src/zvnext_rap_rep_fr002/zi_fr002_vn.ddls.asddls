@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine data FR002'

define view entity ZI_FR002_VN
  as select from zfr002_d_vn as _detail
  association to parent ZR_FR002_VN as _header on  $projection.Rootaccountingdocument = _header.AccountingDocument
                                               and $projection.Companycode            = _header.CompanyCode
                                               and $projection.Fiscalyear             = _header.FiscalYear
{
  key _detail.companycode                 as Companycode,
  key _detail.fiscalyear                  as Fiscalyear,
  key _detail.accountingdocument          as Accountingdocument,
      _detail.rootaccountingdocument      as Rootaccountingdocument,
      _detail.glaccount                   as Glaccount,
      _detail.offsettingaccount           as Offsettingaccount,
      _detail.companycodecurrency         as Companycodecurrency,
      _detail.amountintransactioncurrency as Amountintransactioncurrency,
      _detail.taxcode                     as Taxcode,
      _detail.costcenter                  as Costcenter,
      _header
}
