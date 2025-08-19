@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF006_01'
@Metadata.allowExtensions: true

define root view entity ZI_MF006_01
  as select from I_MaterialDocumentItem_2 as _MatDocItem
  composition [0..*] of ZI_MF006_02             as _detail
  association [0..1] to ZI_MF006_LOG            as _log                   on  $projection.MaterialDocument     = _log.MaterialDocument
                                                                          and $projection.MaterialDocumentYear = _log.MaterialDocumentYear
  association [0..1] to I_ProductDescription_2  as _ProductDes            on  $projection.Material = _ProductDes.Product
                                                                          and _ProductDes.Language = $session.system_language
  association [0..1] to I_SupplierPurchasingOrg as _SupplierPurchasingOrg on  $projection.Supplier    = _SupplierPurchasingOrg.Supplier
                                                                          and _MatDocItem.CompanyCode = _SupplierPurchasingOrg.PurchasingOrganization
{
  key      _MaterialDocumentHeader.ReferenceDocument as ReferenceDocument,
  key      MaterialDocument,
  key      MaterialDocumentYear,
  key      MaterialDocumentItem,
           _MaterialDocumentHeader.CreatedByUser,
           _MaterialDocumentHeader.CreationDate,
           _MaterialDocumentHeader.CreationTime,
           _MaterialDocumentHeader.PostingDate,
           _Supplier.SupplierFullName,
           _SupplierPurchasingOrg.PurchaseOrderCurrency,
           Supplier,
           @Semantics.quantity.unitOfMeasure: 'EntryUnit'
           QuantityInEntryUnit,
           EntryUnit,
           @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
           TotalGoodsMvtAmtInCCCrcy,
           CompanyCodeCurrency,
           CompanyCode,
           Material,
           _log.LocalCreatedAt,
           _log.LocalCreatedBy,
           _log.LocalLastChangedAt,
           _log.LocalLastChangedBy,
           _log.LastChangedAt,
           _detail,
           _ProductDes
}
where
  _MaterialDocumentHeader.ReferenceDocument is not initial
