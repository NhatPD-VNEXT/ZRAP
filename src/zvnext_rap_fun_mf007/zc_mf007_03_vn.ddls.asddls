@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF007_03_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_MF007_03_VN
  as projection on ZI_MF007_03_VN
{
  key ProcessUuid,
      Materialdocumentyear,
      Materialdocument,
      Materialdocumentitem,
      InvoiceUuitem,
      Invoiceid,
      InvoiceNo,
      Purchaseorder,
      Purchaseorderitem,
      Companycode,
      InvoiceItem,
      Product,
      Productname,
      Entryunit,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      Quantityinentryunit,
      Zzvcdid,
      Zzvctxt,
      Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'Purchaseordercurrency'
      Amountexpense,
      Companycodecurrency,
      @Semantics.amount.currencyCode: 'Companycodecurrency'
      Totalgoodsmvtamtincccrcy,
      Supplierinvoice,
      Supplierinvoiceitem,
      Messagelog,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Invoice : redirected to parent ZC_MF007_01_VN
}
