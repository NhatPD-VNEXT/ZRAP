@AbapCatalog.sqlViewName: 'ZFF901_05_VN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_FF901_05_VN'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view ZI_FF901_05_VN
  as select from I_FiscalYear
{
  FiscalYear as FiscalYear
}
where
  FiscalYear = '2024'
