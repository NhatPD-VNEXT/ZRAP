@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF003_06_VN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MF003_06_VN
  as select from I_MaterialDocumentItem_2 as MatDocItem
  association [0..1] to I_ProductDescription_2  as _ProductDes            on  $projection.Material = _ProductDes.Product
                                                                          and _ProductDes.Language = $session.system_language
  association [0..1] to I_SupplierPurchasingOrg as _SupplierPurchasingOrg on  $projection.Supplier   = _SupplierPurchasingOrg.Supplier
                                                                          and MatDocItem.CompanyCode = _SupplierPurchasingOrg.PurchasingOrganization
{
  key MatDocItem.MaterialDocumentYear,
  key MatDocItem.MaterialDocument,
  key MatDocItem.MaterialDocumentItem,
  key MatDocItem._MaterialDocumentHeader.ReferenceDocument as InvoiceNO,
      MatDocItem.Material,
      MatDocItem.Supplier,
      MatDocItem.CompanyCode,
      MatDocItem.PurchaseOrder,
      MatDocItem.PurchaseOrderItem,
      MatDocItem.EntryUnit,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      MatDocItem.QuantityInEntryUnit,
      MatDocItem.CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'Companycodecurrency'
      MatDocItem.TotalGoodsMvtAmtInCCCrcy,
      _ProductDes.ProductDescription                       as ProductName,
      _SupplierPurchasingOrg.PurchaseOrderCurrency         as PurchaseOrderCurrency
}
where
  MatDocItem._MaterialDocumentHeader.ReferenceDocument is not initial
