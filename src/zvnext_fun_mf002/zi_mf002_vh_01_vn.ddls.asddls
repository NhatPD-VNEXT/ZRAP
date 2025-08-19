@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help expense category'
@ObjectModel : { resultSet.sizeCategory: #XS }
@Search.searchable: true

define view entity ZI_MF002_VH_01_VN
  as select from zmf002t_04_vn
{

      @Search.defaultSearchElement: true
//      @ObjectModel.text.element: [ 'Zzvctxt' ]
      @EndUserText.label: 'Expense category'
//      @UI.textArrangement: #TEXT_LAST
  key zzvcdid as Zzvcdid,
      @EndUserText.label: 'Expense category text'
      zzvctxt as Zzvctxt,
      @EndUserText.label: 'Tax code'
      taxcode as Taxcode
}
