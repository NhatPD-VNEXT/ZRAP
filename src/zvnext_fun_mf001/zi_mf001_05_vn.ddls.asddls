@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Combine data Allocate'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_MF001_05_VN
  as select from zmf001t_03 as _Allocate
  association to parent ZI_MF001_01_VN as _header on  $projection.Referencedocument    = _header.Referencedocument
                                                  and $projection.Materialdocumentyear = _header.Materialdocumentyear
                                                  and $projection.Materialdocument     = _header.Materialdocument
                                                  and $projection.Materialdocumentitem = _header.Materialdocumentitem
{
  key _Allocate.materialdocumentyear     as Materialdocumentyear,
  key _Allocate.materialdocument         as Materialdocument,
  key _Allocate.materialdocumentitem     as Materialdocumentitem,
  key _Allocate.referencedocumentitem    as Referencedocumentitem,
      _Allocate.referencedocument        as Referencedocument,
      _Allocate.deliverydocument         as Deliverydocument,
      _Allocate.deliverydocumentitem     as Deliverydocumentitem,
      _Allocate.companycode              as Companycode,
      _Allocate.material                 as Material,
      _Allocate.materialdescription      as Materialdescription,
      _Allocate.entryunit                as Entryunit,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      _Allocate.quantityinentryunit      as Quantityinentryunit,
      _Allocate.zzvcdid                  as Zzvcdid,
      _Allocate.zzvctxt                  as Zzvctxt,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      _Allocate.totalgoodsmvtamtincccrcy as Totalgoodsmvtamtincccrcy,
      _Allocate.companycodecurrency      as Companycodecurrency,
      _Allocate.purchaseordercurrency    as Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'Purchaseordercurrency'
      _Allocate.amountexpense            as Amountexpense,
      _Allocate.messagelog               as Messagelog,
      _Allocate.local_created_by         as LocalCreatedBy,
      _Allocate.local_created_at         as LocalCreatedAt,
      _Allocate.local_last_changed_by    as LocalLastChangedBy,
      _Allocate.local_last_changed_at    as LocalLastChangedAt,
      _Allocate.last_changed_at          as LastChangedAt,
      _header
}
