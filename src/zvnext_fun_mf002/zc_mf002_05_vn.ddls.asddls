@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for ZI_MF002_02_VN'
@Metadata.allowExtensions: true
define root view entity ZC_MF002_05_VN
  provider contract transactional_query
  as projection on ZI_MF002_02_VN
{
  key Referencedocumentitem,
      Referencedocument,
      ReferencedocumentNo,
      Zzvcdid,
      Zzvctxt,
      Supplier,
      Supplierfullname,
      Purchaseordercurrency,
      Amountexpense,
      Amountexpense_num,
      Taxcode,
      Headertext,
      Itemtext,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
//      _valuehelp
}
