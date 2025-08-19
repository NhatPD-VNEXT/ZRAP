@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for table zmf002t_03_vn'
@Metadata.allowExtensions: true
define root view entity ZI_MF002_03_VN
  as select from zmf002t_03_vn as _allocate
  association [0..1] to I_MaterialDocumentItem_2 as _MatDocItem on  $projection.Materialdocumentyear = _MatDocItem.MaterialDocumentYear
                                                                and $projection.Materialdocument     = _MatDocItem.MaterialDocument
                                                                and $projection.Materialdocumentitem = _MatDocItem.MaterialDocumentItem
  association [0..1] to I_ProductDescription_2   as _ProductDes on  $projection.Material = _ProductDes.Product
                                                                and _ProductDes.Language = $session.system_language
  association [0..1] to zmf002t_02_vn            as _detail     on  $projection.Referencedocumentitem = _detail.referencedocumentitem
{
  key materialdocumentyear             as Materialdocumentyear,
  key materialdocument                 as Materialdocument,
  key materialdocumentitem             as Materialdocumentitem,
  key referencedocumentitem            as Referencedocumentitem,
      referencedocument                as Referencedocument,
      _detail.referencedocumentno      as ReferencedocumentNo,
      material                         as Material,
      zzvcdid                          as Zzvcdid,
      zzvctxt                          as Zzvctxt,
      entryunit                        as Entryunit,
      quantityinentryunit              as Quantityinentryunit,
      companycodecurrency              as Companycodecurrency,
      _MatDocItem.DeliveryDocument     as DeliveryDocument,
      _MatDocItem.DeliveryDocumentItem as DeliveryDocumentItem,
      _MatDocItem.CompanyCode          as Companycode,
      _ProductDes.ProductDescription   as ProductDescription,
      totalgoodsmvtamtincccrcy         as Totalgoodsmvtamtincccrcy,
      purchaseordercurrency            as Purchaseordercurrency,
      amountexpense                    as Amountexpense,
      messagelog                       as Messagelog,
      @Semantics.user.createdBy: true
      local_created_by                 as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at                 as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by            as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at            as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                  as LastChangedAt
}
