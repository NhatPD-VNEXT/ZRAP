@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine data log detail'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_MF002_LOG_VN
  as select from zmf002t_01_vn
  association [0..1] to I_MaterialDocumentHeader_2 as _MatDocHead on $projection.Referencedocument = _MatDocHead.ReferenceDocument
{

  key zmf002t_01_vn.referencedocument     as Referencedocument,
  key _MatDocHead.MaterialDocument        as MaterialDocument,
  key _MatDocHead.MaterialDocumentYear    as MaterialDocumentYear,
      zmf002t_01_vn.status                as Status,
      zmf002t_01_vn.creationdate          as Creationdate,
      zmf002t_01_vn.postingdate           as Postingdate,
      zmf002t_01_vn.local_created_by      as LocalCreatedBy,
      zmf002t_01_vn.local_created_at      as LocalCreatedAt,
      zmf002t_01_vn.local_last_changed_by as LocalLastChangedBy,
      zmf002t_01_vn.local_last_changed_at as LocalLastChangedAt,
      zmf002t_01_vn.last_changed_at       as LastChangedAt
}
