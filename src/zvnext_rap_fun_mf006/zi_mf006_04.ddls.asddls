@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_MF006_04'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_MF006_04
  as select from zmf006t_03
{
  key materialdocumentyear     as Materialdocumentyear,
  key materialdocument         as Materialdocument,
  key materialdocumentitem     as Materialdocumentitem,
  key referencedocumentitem    as Referencedocumentitem,
      referencedocument        as Referencedocument,
      material                 as Material,
      zzvcdid                  as Zzvcdid,
      zzvctxt                  as Zzvctxt,
      entryunit                as Entryunit,
      @Semantics.quantity.unitOfMeasure: 'EntryUnit'
      quantityinentryunit      as Quantityinentryunit,
      companycodecurrency      as Companycodecurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      totalgoodsmvtamtincccrcy as Totalgoodsmvtamtincccrcy,
      purchaseordercurrency    as Purchaseordercurrency,
      @Semantics.amount.currencyCode: 'Purchaseordercurrency'
      amountexpense            as Amountexpense,
      messagelog               as Messagelog,
      local_created_by         as LocalCreatedBy,
      local_created_at         as LocalCreatedAt,
      local_last_changed_by    as LocalLastChangedBy,
      local_last_changed_at    as LocalLastChangedAt,
      last_changed_at          as LastChangedAt
}
