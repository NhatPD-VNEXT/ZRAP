@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF003_1_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_MF003_1_VN
  provider contract transactional_query
  as projection on ZI_MF003_1_VN
{
  key InvoiceId,
      InvoiceNo,
      PostingDate,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Detail : redirected to composition child ZC_MF003_2_VN
}
