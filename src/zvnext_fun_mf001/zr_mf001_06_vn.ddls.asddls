@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root data table ZMF001T_02'
@Metadata.allowExtensions: true
define root view entity ZR_MF001_06_VN
  as select from zmf001t_02
{
  key referencedocument     as Referencedocument,
  key referencedocumentitem as Referencedocumentitem,
  key materialdocumentyear  as Materialdocumentyear,
  key materialdocument      as Materialdocument,
  key materialdocumentitem  as Materialdocumentitem,
      zzvcdid               as Zzvcdid,
      zzvctxt               as Zzvctxt,
      supplier              as Supplier,
      supplierfullname      as Supplierfullname,
      purchaseordercurrency as Purchaseordercurrency,
      amountexpense         as Amountexpense,
      taxcode               as Taxcode,
      headertext            as Headertext,
      itemtext              as Itemtext,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
