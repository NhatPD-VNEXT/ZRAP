@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root data header FR003'
define root view entity ZR_FR003_DATA_H_VN
  as select from zfr003_h_vn
{
  key companycode                 as Companycode,
  key fiscalyear                  as Fiscalyear,
  key accountingdocument          as Accountingdocument,
      glaccount                   as Glaccount,
      offsettingaccount           as Offsettingaccount,
      companycodecurrency         as Companycodecurrency,
      amountintransactioncurrency as Amountintransactioncurrency,
      costcenter                  as Costcenter,
      taxcode                     as Taxcode,
      status                      as Status,
      allocatedmonths             as Allocatedmonths,
      @Semantics.user.createdBy: true
      created_by                  as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                  as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by       as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at       as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at             as LastChangedAt
}
