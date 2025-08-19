@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Screen 01: List Invoice No'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */

define root view entity ZI_MF002_01_VN
  as select from I_MaterialDocumentItem_2 as _MatDocItem
  association [0..1] to ZI_MF002_LOG_VN         as _log                   on  $projection.MaterialDocument     = _log.MaterialDocument
                                                                          and $projection.MaterialDocumentYear = _log.MaterialDocumentYear
  association [0..*] to ZI_MF002_02_VN          as _detail                on  $projection.ReferenceDocument = _detail.Referencedocument
  association [0..*] to ZI_MF002_03_VN          as _allocate              on  $projection.ReferenceDocument = _allocate.Referencedocument
  association [0..1] to I_ProductDescription_2  as _ProductDes            on  $projection.Material = _ProductDes.Product
                                                                          and _ProductDes.Language = $session.system_language
  association [0..1] to I_SupplierPurchasingOrg as _SupplierPurchasingOrg on  $projection.Supplier    = _SupplierPurchasingOrg.Supplier
                                                                          and _MatDocItem.CompanyCode = _SupplierPurchasingOrg.PurchasingOrganization

{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
  key _MaterialDocumentHeader.ReferenceDocument         as ReferenceDocument,
      _MaterialDocumentHeader.CreatedByUser,
      _MaterialDocumentHeader.CreationDate,
      _MaterialDocumentHeader.CreationTime,
      _MaterialDocumentHeader.PostingDate,
      _Supplier.SupplierFullName,
      _SupplierPurchasingOrg.PurchaseOrderCurrency,
      Supplier,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      QuantityInEntryUnit,
      EntryUnit,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      TotalGoodsMvtAmtInCCCrcy,
      CompanyCodeCurrency,
      CompanyCode,
      Material,
      _log.Status,

      coalesce(_log.Creationdate, $session.system_date) as CreationDateLog,
      
      //comment remove status
      //      cast( case when   _log.Status = '01' then 'In Process'
      //                 when   _log.Status = '02' then 'In Process'
      //                 when   _log.Status = '03' then 'Completed'
      //                 when   _log.Status = ''   then 'Not Started'
      //      else ''
      //      end as abap.char( 20 ) )                          as MessageStatus,
      //      case when _log.Status = '01' then '2'
      //           when   _log.Status = '02' then '2'
      //           when   _log.Status = '03' then '3'
      //                 end                                    as CriticalityStatus,

      _ProductDes,
      _SupplierPurchasingOrg,
      _log,
      _detail,
      _allocate
}
where
  _MaterialDocumentHeader.ReferenceDocument is not initial
