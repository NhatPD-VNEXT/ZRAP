@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF006_02'
@Metadata.allowExtensions: true

define view entity ZI_MF006_02
  as select from ZI_MF006_LOG as _detail
  association to parent ZI_MF006_01 as _header on  $projection.Referencedocument    = _header.ReferenceDocument
                                               and $projection.MaterialDocumentYear = _header.MaterialDocumentYear
                                               and $projection.MaterialDocument     = _header.MaterialDocument
                                               and $projection.MaterialDocumentItem = _header.MaterialDocumentItem
{
  key Referencedocumentitem,
  key MaterialDocument,
  key MaterialDocumentItem,
  key MaterialDocumentYear,
      Referencedocument,
      Zzvcdid,
      Zzvctxt,
      Supplier,
      Supplierfullname,
      Purchaseordercurrency,
      Amountexpense,
      AmountexpenseNum,
      Taxcode,
      Headertext,
      Itemtext,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      _header
}
