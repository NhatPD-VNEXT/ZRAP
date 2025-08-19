@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF006_05'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_MF006_05
  as select from I_MaterialDocumentItem_2
{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
  key _MaterialDocumentHeader.ReferenceDocument as ReferenceDocument
}
