@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF003_2_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_MF003_2_VN
  as projection on ZI_MF003_2_VN
{
  key InvoiceUuitem,
  key InvoiceId,
      InvoiceNo,
      InvoiceItem,
      Zzvcdid,
      Zzvctxt,
      Supplier,
      Suppliername,
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
      _Invoice: redirected to parent ZC_MF003_1_VN
}
