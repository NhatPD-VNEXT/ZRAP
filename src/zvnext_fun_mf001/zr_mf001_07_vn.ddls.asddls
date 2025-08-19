@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root data table ZMF001T_03'
@Metadata.allowExtensions: true

define root view entity ZR_MF001_07_VN
  as select from zmf001t_03
{
      @UI.lineItem                : [{ position: 10 }]
      @EndUserText.label          : 'Materialdocumentyear'
  key materialdocumentyear     as Materialdocumentyear,
  key materialdocument         as Materialdocument,
  key materialdocumentitem     as Materialdocumentitem,
  key referencedocumentitem    as Referencedocumentitem,
      referencedocument        as Referencedocument,
      deliverydocument         as Deliverydocument,
      deliverydocumentitem     as Deliverydocumentitem,
      companycode              as Companycode,
      material                 as Material,
      materialdescription      as Materialdescription,
      entryunit                as Entryunit,
      @Semantics.quantity.unitOfMeasure : 'Entryunit'
      quantityinentryunit      as Quantityinentryunit,
      zzvcdid                  as Zzvcdid,
      zzvctxt                  as Zzvctxt,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      totalgoodsmvtamtincccrcy as Totalgoodsmvtamtincccrcy,
      companycodecurrency      as Companycodecurrency,
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
