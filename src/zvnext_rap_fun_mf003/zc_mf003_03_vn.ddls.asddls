@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF003_03_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_MF003_03_VN
  as projection on ZI_MF003_03_VN
{

  key ProcessId,
      Materialdocumentyear,
      Materialdocument,
      Materialdocumentitem,
      InvoiceUuitem,
      InvoiceId,
      InvoiceNo,
      InvoiceItem,
      PurchaseOrder,
      PurchaseOrderItem,
      Companycode,
      Product,
      ProductName,
      Entryunit,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      Quantityinentryunit,
      ExpensesCategoryID,
      ExpensesCategoryName,
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
      _Invoice : redirected to parent ZC_MF003_01_VN

}
