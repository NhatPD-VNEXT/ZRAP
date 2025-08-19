@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZI_MF001_05_VN'
@Metadata.allowExtensions: true
define view entity ZC_MF001_05_VN
  as projection on ZI_MF001_05_VN
{
  key Materialdocumentyear,
  key Materialdocument,
  key Materialdocumentitem,
  key Referencedocumentitem,
      Referencedocument,
      Deliverydocument,
      Deliverydocumentitem,
      Companycode,
      Material,
      Materialdescription,
      Entryunit,
      Quantityinentryunit,
      Zzvcdid,
      Zzvctxt,
      Totalgoodsmvtamtincccrcy,
      Companycodecurrency,
      Purchaseordercurrency,
      Amountexpense,
      Messagelog,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _header : redirected to parent ZC_MF001_01_VN
}
