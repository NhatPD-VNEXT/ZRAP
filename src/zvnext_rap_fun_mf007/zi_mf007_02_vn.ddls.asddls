@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF007_02_VN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZI_MF007_02_VN
  as select from zmf007t_02_vn as Detail
  association to parent ZI_MF007_01_VN as _Invoice on $projection.InvoiceId = _Invoice.InvoiceId
{
  key      Detail.invoice_uuitem        as InvoiceUuitem,
  key      Detail.invoiceid             as InvoiceId,
           Detail.invoice_no            as InvoiceNo,
           Detail.invoice_item          as InvoiceItem,
           Detail.zzvcdid               as ExpensesCategoryID,
           Detail.zzvctxt               as ExpensesCategoryName,
           Detail.supplier              as Supplier,
           Detail.suppliername          as SupplierName,
           Detail.purchaseordercurrency as Purchaseordercurrency,
           @Semantics.amount.currencyCode: 'Purchaseordercurrency'
           Detail.amountexpense         as Amountexpense,
           Detail.taxcode               as Taxcode,
           Detail.headertext            as Headertext,
           Detail.itemtext              as Itemtext,
           @Semantics.user.createdBy: true
           Detail.local_created_by      as LocalCreatedBy,
           @Semantics.systemDateTime.createdAt: true
           Detail.local_created_at      as LocalCreatedAt,
           @Semantics.user.localInstanceLastChangedBy: true
           Detail.local_last_changed_by as LocalLastChangedBy,
           @Semantics.systemDateTime.localInstanceLastChangedAt: true
           Detail.local_last_changed_at as LocalLastChangedAt,
           @Semantics.systemDateTime.lastChangedAt: true
           Detail.last_changed_at       as LastChangedAt,
           _Invoice
}
