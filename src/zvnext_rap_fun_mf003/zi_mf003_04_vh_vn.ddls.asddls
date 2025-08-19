@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help expense category'
@ObjectModel : { resultSet.sizeCategory: #XS }
@Search.searchable: true

define view entity ZI_MF003_04_VH_VN
  as select from zmf003t_04_vn
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'ExpensesCategoryName' ]
      @EndUserText.label: 'Expense category'
      @UI.textArrangement: #TEXT_ONLY
  key zzvcdid as ExpensesCategoryID,
      @EndUserText.label: 'Expense category text'
      zzvctxt as ExpensesCategoryName,
      @EndUserText.label: 'Tax code'
      taxcode as Taxcode
      
}
