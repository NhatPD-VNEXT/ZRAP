@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF003_05_VH_VN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MF003_05_VH_VN
  as select from I_MaterialDocumentHeader_2
{
  key ReferenceDocument as ReferenceDocument
}
where
  ReferenceDocument is not initial
group by
  ReferenceDocument
