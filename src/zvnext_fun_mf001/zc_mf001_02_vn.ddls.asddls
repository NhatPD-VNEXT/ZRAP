@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZI_MF001_02_VN'
@Metadata.allowExtensions: true

//define root view entity ZC_MF001_02_VN
define view entity ZC_MF001_02_VN
  as projection on ZI_MF001_02_VN
{
  key     Referencedocument,
  key     Referencedocumentitem,
  key     Materialdocumentyear,
  key     Materialdocument,
  key     Materialdocumentitem,
          Zzvcdid,
          Zzvctxt,
          Supplier,
          Supplierfullname,
          Purchaseordercurrency,
          @Semantics.amount.currencyCode: 'Purchaseordercurrency'
          Amountexpense,
          Taxcode,
          Headertext,
          Itemtext,
          LocalCreatedBy,
          LocalCreatedAt,
          LocalLastChangedBy,
          LocalLastChangedAt,
          LastChangedAt,
          /* Associations */
          _header : redirected to parent ZC_MF001_01_VN
}
