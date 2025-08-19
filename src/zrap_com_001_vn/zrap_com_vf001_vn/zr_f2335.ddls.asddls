@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data root F2335'
define root view entity ZR_F2335
  as select from I_ManufacturingOrder as ord
{
  key ord.ManufacturingOrder,
      ord.Material,
      ord.Product,
      ord.ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      cast (ord.MfgOrderPlannedTotalQty - ord.MfgOrderPlannedScrapQty - ord.ActualDeliveredQuantity - ord.ExpectedDeviationQuantity as abap.quan(23, 3)) as OrderOpenQuantity,

      case ord.MfgOrderActualStartDate
        when '00000000'
        then ord.MfgOrderScheduledStartDate
        else ord.MfgOrderActualStartDate
      end                                                                                                                                                as OrderStartDate,
      ord.MfgOrderPlannedStartDate,
      ord.MfgOrderPlannedStartTime,
      ord.MfgOrderPlannedEndDate,
      ord.MfgOrderPlannedEndTime
}
