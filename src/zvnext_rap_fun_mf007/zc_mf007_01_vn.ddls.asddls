@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF007_01_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_MF007_01_VN
  as projection on ZI_MF007_01_VN
{
  key InvoiceId,
      InvoiceNo,
      PostingDate,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      _User.PersonFullName,
      /* Associations */
      _Detail   : redirected to composition child ZC_MF007_02_VN,
      _Allocate : redirected to composition child ZC_MF007_03_VN
}
