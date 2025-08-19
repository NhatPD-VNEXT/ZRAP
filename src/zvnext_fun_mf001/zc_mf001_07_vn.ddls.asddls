@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZI_MF001_07_VN'
@Metadata.allowExtensions: true

define root view entity ZC_MF001_07_VN
  provider contract transactional_query
  as projection on ZR_MF001_07_VN
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
      @Semantics.quantity.unitOfMeasure : 'Entryunit'
      Quantityinentryunit,
      Zzvcdid,
      Zzvctxt,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      Totalgoodsmvtamtincccrcy,
      Companycodecurrency,
      Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'Purchaseordercurrency'
      Amountexpense,
      Messagelog,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
