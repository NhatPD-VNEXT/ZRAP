@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS for table zmf002t_02_vn'

define root view entity ZI_MF002_02_VN
  as select from zmf002t_02_vn
  association [0..1] to ZI_MF002_VH_01_VN as _valuehelp on $projection.Zzvcdid = _valuehelp.Zzvcdid
{
  key referencedocumentitem as Referencedocumentitem,
      referencedocument     as Referencedocument,
      referencedocumentno   as ReferencedocumentNo,
      // text value help
//      @ObjectModel.text.element: [ '_valuehelp.Zzvctxt' ]
      zzvcdid               as Zzvcdid,
      zzvctxt               as Zzvctxt,
      supplier              as Supplier,
      supplierfullname      as Supplierfullname,
      purchaseordercurrency as Purchaseordercurrency,
      amountexpense         as Amountexpense,
      amountexpense_num     as Amountexpense_num,
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
      last_changed_at       as LastChangedAt,
      _valuehelp
}
