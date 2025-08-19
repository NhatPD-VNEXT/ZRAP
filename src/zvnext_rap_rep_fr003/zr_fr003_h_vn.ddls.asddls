@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root data header FR003'
define root view entity ZR_FR003_H_VN
  as select from ZI_FR003_H_VN as _header
  association [0..*] to ZR_FR003_D_VN as _detail on  $projection.CompanyCode        = _detail.Companycode
                                                 and $projection.FiscalYear         = _detail.Fiscalyear
                                                 and $projection.AccountingDocument = _detail.Rootaccountingdocument
{
  key _header.CompanyCode,
  key _header.FiscalYear,
  key _header.AccountingDocument,
      _header.OffsettingAccount,
      _header.GLAccount,
      _header.AccountingDocumentType,
      _header.DebitCreditCode,
      _header.CompanyCodeCurrency,
      _header.TaxCode,
      _header.CostCenter,
      _header.AmountInTransactionCurrency,
      _header.status,
      _header.allocatedmonths,

      cast( case when   _header.status = '1' then 'In Process'
                 when   _header.status = '2' then 'Completed'
           else ''
           end as abap.char( 20 ) ) as MessageStatus,
      case when _header.status = '1' then '2'
           when   _header.status = '2' then '3'
                 end                as CriticalityStatus,
      case when _header.status = '1' then '3'
           when _header.status = '2' then '0'
           end                      as CriticalityAction01,
      case when _header.status = '1' then '0'
           when _header.status = '2' then '1'
           end                      as CriticalityAction02,
      _header.Root,
      _detail
}
where
  Root is null
