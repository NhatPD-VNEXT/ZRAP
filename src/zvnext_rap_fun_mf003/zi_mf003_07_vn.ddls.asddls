//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'ZI_MF003_07_VN'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
//define view entity ZI_MF003_07_VN
//  as select from I_TaxCodeStdVH
//{
//  key TaxCode as TaxCode
//}
//group by
//  TaxCode

  
  
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Model：税コード'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
@ObjectModel: { dataCategory: #VALUE_HELP,
                representativeKey: 'TaxCode',
                usageType: { sizeCategory: #S,
                             dataClass: #CUSTOMIZING,
                             serviceQuality: #A },
                supportedCapabilities: [#VALUE_HELP_PROVIDER],
                modelingPattern: #VALUE_HELP_PROVIDER }
@Analytics.technicalName: 'IFITAXCODESVH'
@Search.searchable: true
@Consumption.valueHelpDefault.fetchValues: #AUTOMATICALLY_WHEN_DISPLAYED

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity ZI_MF003_07_VN
  as select from I_TaxCodeStdVH
  association [0..1] to I_TaxCode as _Taxcode on $projection.TaxCode = _Taxcode.TaxCode

{
  key I_TaxCodeStdVH.TaxCalculationProcedure as TaxCalculationProcedure,
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.association: '_Text'
  key TaxCode                                as TaxCode,
      _Text
      //      _Text[1:Language = $session.system_language ].TaxCodeName as TaxCodeName
}
where
  _Taxcode.TaxCodeIsInactive <> 'X'
