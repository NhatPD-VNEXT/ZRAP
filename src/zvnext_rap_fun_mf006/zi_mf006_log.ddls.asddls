@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF006_LOG'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_MF006_LOG
  as select from zmf006t_02 as _log
  association [0..1] to ZI_MF006_05 as _item on $projection.Referencedocument = _item.ReferenceDocument
{
  key _log.referencedocumentitem as Referencedocumentitem,
  key _item.MaterialDocument     as MaterialDocument,
  key _item.MaterialDocumentItem as MaterialDocumentItem,
  key _item.MaterialDocumentYear as MaterialDocumentYear,
      _log.referencedocument     as Referencedocument,
      _log.zzvcdid               as Zzvcdid,
      _log.zzvctxt               as Zzvctxt,
      _log.supplier              as Supplier,
      _log.supplierfullname      as Supplierfullname,
      _log.purchaseordercurrency as Purchaseordercurrency,
      _log.amountexpense         as Amountexpense,
      _log.amountexpense_num     as AmountexpenseNum,
      _log.taxcode               as Taxcode,
      _log.headertext            as Headertext,
      _log.itemtext              as Itemtext,
      _log.local_created_by      as LocalCreatedBy,
      _log.local_created_at      as LocalCreatedAt,
      _log.local_last_changed_by as LocalLastChangedBy,
      _log.local_last_changed_at as LocalLastChangedAt,
      _log.last_changed_at       as LastChangedAt
}
