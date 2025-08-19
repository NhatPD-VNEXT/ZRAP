@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF007_01_VN'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
@Metadata.allowExtensions: true

define root view entity ZI_MF007_01_VN
  as select from zmf007t_01_vn as Invoice
  composition [0..*] of ZI_MF007_02_VN      as _Detail
  composition [0..*] of ZI_MF007_03_VN      as _Allocate
  association [0..1] to I_BusinessUserBasic as _User on $projection.LocalCreatedBy = _User.UserID
{

  key    Invoice.invoiceid             as InvoiceId,
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
         _Detail,
         _Allocate,
         _User
}
