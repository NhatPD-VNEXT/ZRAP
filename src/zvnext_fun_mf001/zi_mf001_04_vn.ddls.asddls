@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help expense category'
@ObjectModel : { resultSet.sizeCategory: #XS }

define view entity ZI_MF001_04_VN
  as select from zmf001t_01
{
      @EndUserText.label: 'Expense category'
  key zzvcdid as Zzvcdid,
      zzvctxt as Zzvctxt,
      taxcode as Taxcode
}
