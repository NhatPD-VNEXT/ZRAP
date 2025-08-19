@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.allowExtensions: true

define root view entity ZC_MF001_01_VN
  provider contract transactional_query
  as projection on ZI_MF001_01_VN
{

  key     Materialdocumentyear,
  key     Materialdocument,
  key     Materialdocumentitem,
  key     Referencedocument,
          Material,
          Supplier,
          @Semantics.quantity.unitOfMeasure: 'EntryUnit'
          Quantityinentryunit,
          Entryunit,
          @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
          Totalgoodsmvtamtincccrcy,
          Companycodecurrency,
          Deliverydocument,
          Deliverydocumentitem,
          Companycode,
          Createdbyuser,
          Creationdate,
          Creationtime,
          Postingdate,
          _ProductDes.ProductDescription,
          LocalCreatedBy,
          LocalCreatedAt,
          LocalLastChangedAt,
          LocalLastChangedBy,
          LastChangedAt,
          SupplierFullName,
          _detail   : redirected to composition child ZC_MF001_02_VN,
          _Allocate : redirected to composition child ZC_MF001_05_VN
//          _allocate_2

}
