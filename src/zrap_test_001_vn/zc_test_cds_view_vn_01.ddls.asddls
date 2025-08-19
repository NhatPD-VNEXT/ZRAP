@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_TEST_CDS_VIEW_VN_01'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZC_TEST_CDS_VIEW_VN_01
  as select from I_CalendarDate
{
  key CalendarDate               as CalendarDate,
      cast( '' as abap.char(2) ) as FactoryCalendarLegacyID
}
