@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF007_02_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_MF007_02_VN
  as projection on ZI_MF007_02_VN
{
  key InvoiceUuitem,
  key InvoiceId,
      InvoiceNo,
      InvoiceItem,
      ExpensesCategoryID,
      ExpensesCategoryName,
      Supplier,
      SupplierName,
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
      _Invoice : redirected to parent ZC_MF007_01_VN
}
