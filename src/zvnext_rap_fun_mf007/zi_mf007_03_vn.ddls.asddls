@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF007_03_VN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZI_MF007_03_VN
  as select from zmf007t_03_vn as Allocate
  association to parent ZI_MF007_01_VN as _Invoice on $projection.Invoiceid = _Invoice.InvoiceId
{
  key process_uuid             as ProcessUuid,
      materialdocumentyear     as Materialdocumentyear,
      materialdocument         as Materialdocument,
      materialdocumentitem     as Materialdocumentitem,
      invoice_uuitem           as InvoiceUuitem,
      invoiceid                as Invoiceid,
      invoice_no               as InvoiceNo,
      purchaseorder            as Purchaseorder,
      purchaseorderitem        as Purchaseorderitem,
      companycode              as Companycode,
      invoice_item             as InvoiceItem,
      product                  as Product,
      productname              as Productname,
      entryunit                as Entryunit,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      quantityinentryunit      as Quantityinentryunit,
      zzvcdid                  as Zzvcdid,
      zzvctxt                  as Zzvctxt,
      purchaseordercurrency    as Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'Purchaseordercurrency'
      amountexpense            as Amountexpense,
      companycodecurrency      as Companycodecurrency,
      @Semantics.amount.currencyCode: 'Companycodecurrency'
      totalgoodsmvtamtincccrcy as Totalgoodsmvtamtincccrcy,
      supplierinvoice          as Supplierinvoice,
      supplierinvoiceitem      as Supplierinvoiceitem,
      messagelog               as Messagelog,
      local_created_by         as LocalCreatedBy,
      local_created_at         as LocalCreatedAt,
      local_last_changed_by    as LocalLastChangedBy,
      local_last_changed_at    as LocalLastChangedAt,
      last_changed_at          as LastChangedAt,
      _Invoice
}
