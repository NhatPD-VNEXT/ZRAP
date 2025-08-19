@ObjectModel.query.implementedBy:'ABAP:ZCL_TEST_CDS_VIEW_04'
@EndUserText.label: 'Value Help Sales Order'
@ObjectModel.dataCategory: #VALUE_HELP

define custom entity ZI_TEST_CDS_VIEW_04
{
      @UI.selectionField        : [{ position: 10 }]
      @UI.lineItem              : [{ position: 10 }]
  key PurchaseOrder             : ebeln;
      @UI.selectionField        : [{ position: 10 }]
      @UI.lineItem              : [{ position: 10 }]
      PurchaseOrderItem         : ebelp;
      @UI.selectionField        : [{ position: 10 }]
      @UI.lineItem              : [{ position: 10 }]
      PurchaseOrderQuantityUnit : meins;
//      @UI.selectionField        : [{ position: 10 }]
//      @UI.lineItem              : [{ position: 10 }]
//      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
//      OrderQuantity             : abap.quan( 15, 3 );
}
