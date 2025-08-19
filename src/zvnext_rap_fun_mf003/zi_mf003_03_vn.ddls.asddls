@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF003_03_VN'

define view entity ZI_MF003_03_VN
  as select from zmf003t_03_vn as Allocate
  association to parent ZI_MF003_01_VN as _Invoice on $projection.InvoiceId = _Invoice.InvoiceId
{
  key     Allocate.process_uuid             as ProcessId, 
          Allocate.materialdocumentyear     as Materialdocumentyear,
          Allocate.materialdocument         as Materialdocument,
          Allocate.materialdocumentitem     as Materialdocumentitem,
          Allocate.invoice_uuitem           as InvoiceUuitem,
          Allocate.invoiceid                as InvoiceId,
          Allocate.invoice_no               as InvoiceNo,
          Allocate.invoice_item             as InvoiceItem,
          Allocate.purchaseorder            as PurchaseOrder,
          Allocate.purchaseorderitem        as PurchaseOrderItem,
          Allocate.companycode              as Companycode,
          Allocate.product                  as Product,
          Allocate.productname              as ProductName,
          Allocate.entryunit                as Entryunit,
          Allocate.quantityinentryunit      as Quantityinentryunit,
          Allocate.zzvcdid                  as ExpensesCategoryID,
          Allocate.zzvctxt                  as ExpensesCategoryName,
          Allocate.purchaseordercurrency    as Purchaseordercurrency,
          Allocate.amountexpense            as Amountexpense,
          Allocate.companycodecurrency      as Companycodecurrency,
          Allocate.totalgoodsmvtamtincccrcy as Totalgoodsmvtamtincccrcy,
          Allocate.supplierinvoice          as Supplierinvoice,
          Allocate.supplierinvoiceitem      as Supplierinvoiceitem,
          Allocate.messagelog               as Messagelog,
          @Semantics.user.createdBy: true
          Allocate.local_created_by         as LocalCreatedBy,
          @Semantics.systemDateTime.createdAt: true
          Allocate.local_created_at         as LocalCreatedAt,
          @Semantics.user.localInstanceLastChangedBy: true
          Allocate.local_last_changed_by    as LocalLastChangedBy,
          @Semantics.systemDateTime.localInstanceLastChangedAt: true
          Allocate.local_last_changed_at    as LocalLastChangedAt,
          @Semantics.systemDateTime.lastChangedAt: true
          Allocate.last_changed_at          as LastChangedAt,
          _Invoice
}
