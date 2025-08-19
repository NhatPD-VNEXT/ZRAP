@EndUserText.label: 'View F2335'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_F2335
  provider contract transactional_query
  as projection on ZR_F2335
{
          @UI.selectionField: [{ position: 10 }]
          @UI.lineItem: [{ position: 10 }]
          @EndUserText.label: 'Order'
  key     ManufacturingOrder,
          @UI.selectionField: [{ position: 20 }]
          @UI.lineItem: [{ position: 20 }]
          @EndUserText.label: 'Material'
          Material,
          Product,
          @UI.lineItem: [{ position: 30 }]
          @EndUserText.label: 'Unit'
          ProductionUnit,
          @UI.lineItem: [{ position: 40 }]
          @EndUserText.label: 'Order Quantity'
          OrderOpenQuantity,
          @UI.lineItem: [{ position: 40 }]
          @EndUserText.label: 'Order Date'
          OrderStartDate,
          MfgOrderPlannedStartDate,
          MfgOrderPlannedStartTime,
          MfgOrderPlannedEndDate,
          MfgOrderPlannedEndTime,
          @UI.selectionField: [{ position: 50 }]
          @UI.lineItem: [{ position: 50 }]
          @EndUserText.label: 'Status'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GET_DATA_F2335'
  virtual Status                       : abap.char(2),
          @UI.lineItem: [{ position: 60 }]
          @EndUserText.label: 'Start date'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GET_DATA_F2335'
  virtual MfgOrderPlannedStartDateTime : timestamp,
          @UI.lineItem: [{ position: 60 }]
          @EndUserText.label: 'End date'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GET_DATA_F2335'
  virtual MfgOrderPlannedEndDateTime   : timestamp

}
