@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF006_03'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define root view entity ZI_MF006_03
  as select from zmf006t_02 as _detail
{
  key referencedocumentitem as Referencedocumentitem,
      referencedocument     as Referencedocument,
      zzvcdid               as Zzvcdid,
      zzvctxt               as Zzvctxt,
      supplier              as Supplier,
      supplierfullname      as Supplierfullname,
      purchaseordercurrency as Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'purchaseordercurrency'
      amountexpense         as Amountexpense,
      amountexpense_num     as AmountexpenseNum,
      taxcode               as Taxcode,
      headertext            as Headertext,
      itemtext              as Itemtext,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
