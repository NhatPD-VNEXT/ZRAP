@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF003_2_VN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MF003_2_VN
  as select from zmf003t_2_vn as Detail
  association to parent ZI_MF003_1_VN as _Invoice on  $projection.InvoiceId = _Invoice.InvoiceId

{
  key invoice_uuitem        as InvoiceUuitem,
  key invoice_id            as InvoiceId,
      invoice_no            as InvoiceNo,
      invoice_item          as InvoiceItem,
      zzvcdid               as Zzvcdid,
      zzvctxt               as Zzvctxt,
      supplier              as Supplier,
      suppliername          as Suppliername,
      purchaseordercurrency as Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'Purchaseordercurrency'
      amountexpense         as Amountexpense,
      taxcode               as Taxcode,
      headertext            as Headertext,
      itemtext              as Itemtext,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Invoice
}
