@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF003_1_VN'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_MF003_1_VN
  as select from zmf003t_1_vn as Invoice
  composition [0..*] of ZI_MF003_2_VN as _Detail
{
  key Invoice.invoice_id            as InvoiceId,
      Invoice.invoice_no            as InvoiceNo,
      Invoice.posting_date          as PostingDate,
      @Semantics.user.createdBy: true
      Invoice.local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      Invoice.local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      Invoice.local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Invoice.local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      Invoice.last_changed_at       as LastChangedAt,
      _Detail
}
