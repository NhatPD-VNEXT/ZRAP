@EndUserText.label: 'table function'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
define table function ZI_TEST_CDS_VIEW_03
  with parameters
    @Environment.systemField : #CLIENT
    p_mandt : mandt,
    p_pdate : datum
returns
{
  key clnt                 : abap.clnt;
  key companycode          : bukrs;
  key material             : matnr;
      totalgiqty           : abap.quan( 13, 3 );
      totalgrqty           : abap.quan( 13, 3 );
      totalstockqty        : abap.quan( 13, 3 );
      remain_stock         : abap.quan( 13, 3 );
      estimated_stock      : abap.quan( 13, 3 );
      estimated_stock_3660 : abap.quan( 13, 3 );
      estimated_stock_6084 : abap.quan( 13, 3 );
      estimated_stock_84   : abap.quan( 13, 3 );
      reversed_amount1     : abap.quan( 13, 3 );
      reversed_amount2     : abap.quan( 13, 3 );
      status               : abap.char( 2 );
      totalstockamount     : abap.curr( 17, 2 );
      unitprice            : abap.curr( 11, 2 );
      valuationclass       : bklas;
      materialgroup        : matkl;
      baseunit             : meins;
      currency             : abap.cuky;
      creationdate         : ersda;
      productname          : maktx;
}
implemented by method
  ZCL_TEST_CDS_VIEW_03=>GET_TOTAL;