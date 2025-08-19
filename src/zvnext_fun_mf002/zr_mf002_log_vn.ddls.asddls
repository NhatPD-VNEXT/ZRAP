@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_MF002_LOG_VN'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_MF002_LOG_VN
  as select from zmf002t_01_vn
{

  key referencedocument     as Referencedocument,
      status                as Status,
      creationdate          as Creationdate,
      postingdate           as Postingdate,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
