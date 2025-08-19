@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine Masterial Document Item'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_MF001_01_VN
  as select from    I_MaterialDocumentItem_2 as _MatDocItem
    left outer join zmf001t_04               as _Data on  _MatDocItem.MaterialDocumentYear = _Data.materialdocumentyear
                                                      and _MatDocItem.MaterialDocument     = _Data.materialdocument
                                                      and _MatDocItem.MaterialDocumentItem = _Data.materialdocumentitem
//    association [0..*] to ZI_MF001_02_VN             as _detail                on  $projection.Referencedocument = _detail.Referencedocument
  composition [0..*] of ZI_MF001_02_VN             as _detail
  composition [0..*] of ZI_MF001_05_VN             as _Allocate
  association [0..1] to I_MaterialDocumentHeader_2 as _MatDocHead            on  _MatDocItem.MaterialDocument     = _MatDocHead.MaterialDocument
                                                                             and _MatDocItem.MaterialDocumentYear = _MatDocHead.MaterialDocumentYear

//  association [0..*] to ZC_MF001_07_VN             as _allocate_2            on  $projection.Referencedocument = _allocate_2.Referencedocument
  association [0..1] to I_ProductDescription_2     as _ProductDes            on  $projection.Material = _ProductDes.Product
                                                                             and _ProductDes.Language = $session.system_language
  association [0..1] to I_Supplier                 as _Supplier              on  _MatDocItem.Supplier = _Supplier.Supplier
  association [0..1] to I_SupplierPurchasingOrg    as _SupplierPurchasingOrg on  $projection.Supplier    = _SupplierPurchasingOrg.Supplier
                                                                             and $projection.Companycode = _SupplierPurchasingOrg.PurchasingOrganization

{
  key    coalesce(_Data.materialdocumentyear , _MatDocItem.MaterialDocumentYear )       as Materialdocumentyear,
  key    coalesce(_Data.materialdocument  , _MatDocItem.MaterialDocument )              as Materialdocument,
  key    coalesce(_Data.materialdocumentitem , _MatDocItem.MaterialDocumentItem )       as Materialdocumentitem,
  key    coalesce(_Data.referencedocument, _MatDocHead.ReferenceDocument)               as Referencedocument,
         coalesce(_Data.material, _MatDocItem.Material)                                 as Material,
         //         coalesce(_Data.supplier, _MatDocItem.Supplier)                                 as Supplier,
         coalesce(_Data.entryunit, _MatDocItem.EntryUnit)                               as Entryunit,
         _MatDocItem.Supplier                                                           as Supplier,
         @Semantics.quantity.unitOfMeasure: 'EntryUnit'
         coalesce(_Data.quantityinentryunit, _MatDocItem.QuantityInEntryUnit)           as Quantityinentryunit,
         @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
         coalesce(_Data.totalgoodsmvtamtincccrcy, _MatDocItem.TotalGoodsMvtAmtInCCCrcy) as Totalgoodsmvtamtincccrcy,
         coalesce(_Data.companycodecurrency, _MatDocItem.CompanyCodeCurrency)           as Companycodecurrency,
         coalesce(_Data.deliverydocument, _MatDocItem.DeliveryDocument)                 as Deliverydocument,
         coalesce(_Data.deliverydocumentitem, _MatDocItem.DeliveryDocumentItem)         as Deliverydocumentitem,
         coalesce(_Data.companycode, _MatDocItem.CompanyCode)                           as Companycode,
         coalesce(_Data.createdbyuser, _MatDocHead.CreatedByUser)                       as Createdbyuser,
         coalesce(_Data.creationdate, _MatDocHead.CreationDate)                         as Creationdate,
         coalesce(_Data.creationtime, _MatDocHead.CreationTime)                         as Creationtime,
         coalesce(_Data.postingdate, _MatDocItem.PostingDate)                           as Postingdate,
         coalesce(_Data.purchaseordercurrency, _MatDocItem.CompanyCodeCurrency)         as Purchaseordercurrency,
         _Supplier.SupplierFullName                                                     as SupplierFullName,
         /* Status */
         _Data.status                                                                   as Status,
         @Semantics.user.createdBy: true
         _Data.local_created_by                                                         as LocalCreatedBy,
         @Semantics.systemDateTime.createdAt: true
         _Data.local_created_at                                                         as LocalCreatedAt,
         @Semantics.user.localInstanceLastChangedBy: true
         _Data.local_last_changed_by                                                    as LocalLastChangedBy,
         @Semantics.systemDateTime.localInstanceLastChangedAt: true
         _Data.local_last_changed_at                                                    as LocalLastChangedAt,
         @Semantics.systemDateTime.lastChangedAt: true
         _Data.last_changed_at                                                          as LastChangedAt,
         _detail,
         _ProductDes,
         //         _Supplier,
         _SupplierPurchasingOrg,
         _Allocate
//         _allocate_2
}
