@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_MF002_01_VN'
@Metadata.allowExtensions: true
define root view entity ZC_MF002_04_VN
  provider contract transactional_query
  as projection on ZI_MF002_01_VN
{
  key     MaterialDocumentYear,
  key     MaterialDocument,
  key     MaterialDocumentItem,
  key     ReferenceDocument,
          CreatedByUser,
          CreationDate,
          CreationTime,
          PostingDate,
          SupplierFullName,
          Supplier,
          @Semantics.quantity.unitOfMeasure: 'EntryUnit'
          QuantityInEntryUnit,
          EntryUnit,
          @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
          TotalGoodsMvtAmtInCCCrcy,
          CompanyCodeCurrency,
          CompanyCode,
          Material,
          CreationDateLog,
          _log.LocalCreatedAt,
          _log.LocalCreatedBy,
          _log.LocalLastChangedAt,
          _log.LocalLastChangedBy,
          _log.LastChangedAt,
          _ProductDes.ProductDescription,
          _SupplierPurchasingOrg.PurchaseOrderCurrency,
          //comment remove status
          //          MessageStatus,
          //          CriticalityStatus,
          /* Associations */
          _allocate,
          _detail,
          _log
          //      _SupplierPurchasingOrg
}
