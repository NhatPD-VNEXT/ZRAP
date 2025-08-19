@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine data Detail information'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
//define root view entity ZI_MF001_02_VN
define view entity ZI_MF001_02_VN
  as select from zmf001t_02 as Item
  association to parent ZI_MF001_01_VN as _header on  $projection.Referencedocument    = _header.Referencedocument
                                                  and $projection.Materialdocumentyear = _header.Materialdocumentyear
                                                  and $projection.Materialdocument     = _header.Materialdocument
                                                  and $projection.Materialdocumentitem = _header.Materialdocumentitem

{
        @UI.lineItem                : [{ position: 10 }]
        @EndUserText.label          : 'Referencedocument'
  key   Item.referencedocument     as Referencedocument,
  key   Item.referencedocumentitem as Referencedocumentitem,
  key   Item.materialdocumentyear  as Materialdocumentyear,
  key   Item.materialdocument      as Materialdocument,
  key   Item.materialdocumentitem  as Materialdocumentitem,
        Item.zzvcdid               as Zzvcdid,
        Item.zzvctxt               as Zzvctxt,
        Item.supplier              as Supplier,
        Item.supplierfullname      as Supplierfullname,
        Item.purchaseordercurrency as Purchaseordercurrency,
        @Semantics.amount.currencyCode: 'Purchaseordercurrency'
        Item.amountexpense         as Amountexpense,
        Item.taxcode               as Taxcode,
        Item.headertext            as Headertext,
        Item.itemtext              as Itemtext,
        Item.local_created_by      as LocalCreatedBy,
        Item.local_created_at      as LocalCreatedAt,
        Item.local_last_changed_by as LocalLastChangedBy,
        Item.local_last_changed_at as LocalLastChangedAt,
        Item.last_changed_at       as LastChangedAt,
        _header
}
