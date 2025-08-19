@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: ''
define root view entity ZR_MF001_03_VN
  as select from zmf001t_04
{
  key   materialdocumentyear     as Materialdocumentyear,
  key   materialdocument         as Materialdocument,
  key   materialdocumentitem     as Materialdocumentitem,
  key   referencedocument        as Referencedocument,
        material                 as Material,
        supplier                 as Supplier,
        supplierfullname         as Supplierfullname,
        entryunit                as Entryunit,
        quantityinentryunit      as Quantityinentryunit,
        totalgoodsmvtamtincccrcy as Totalgoodsmvtamtincccrcy,
        companycodecurrency      as Companycodecurrency,
        deliverydocument         as Deliverydocument,
        deliverydocumentitem     as Deliverydocumentitem,
        companycode              as Companycode,
        createdbyuser            as Createdbyuser,
        creationdate             as Creationdate,
        creationtime             as Creationtime,
        postingdate              as Postingdate,
        purchaseordercurrency    as Purchaseordercurrency,
        status                   as Status,
        @Semantics.user.createdBy: true
        local_created_by         as LocalCreatedBy,
        @Semantics.systemDateTime.createdAt: true
        local_created_at         as LocalCreatedAt,
        @Semantics.user.localInstanceLastChangedBy: true
        local_last_changed_by    as LocalLastChangedBy,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
        local_last_changed_at    as LocalLastChangedAt,
        @Semantics.systemDateTime.lastChangedAt: true
        last_changed_at          as LastChangedAt
}
