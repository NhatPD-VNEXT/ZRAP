@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF003_01_VN'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_MF003_01_VN
  provider contract transactional_query
  as projection on ZI_MF003_01_VN
{
  key   InvoiceId,
        InvoiceNo,
        PostingDate,
//        DocumentDate,
        LocalCreatedBy,
        LocalCreatedAt,
        LocalLastChangedBy,
        LocalLastChangedAt,
        LastChangedAt,
        _User.PersonFullName,
        /* Associations */
        _Detail   : redirected to composition child ZC_MF003_02_VN,
        _Allocate : redirected to composition child ZC_MF003_03_VN
}
