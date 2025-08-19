@ObjectModel.query.implementedBy:'ABAP:ZCL_VNTESTVH'
@EndUserText.label: 'CE for Service Consumption Scenario'
@ObjectModel.dataCategory: #VALUE_HELP
define custom entity ZI_TESTVH_VN
{
      @Search.defaultSearchElement: true
  key product     : matnr;
      productname : maktx;
}
