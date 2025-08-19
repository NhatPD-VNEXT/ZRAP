@ObjectModel.query.implementedBy:'ABAP:ZCL_CUS_VH_SO_VN'
@EndUserText.label: 'Value Help Sales Order'
@ObjectModel.dataCategory: #VALUE_HELP

define custom entity ZI_CUS_VH_SO_VN
    with parameters 
        p_product :  matnr,
        p_vkorg : maktx
{
      @Search.defaultSearchElement: true
  key product     : matnr;
      @Search.defaultSearchElement: false
      productname : maktx;
      @Search.defaultSearchElement: true
      SalesOrganization       :vkorg;
}
