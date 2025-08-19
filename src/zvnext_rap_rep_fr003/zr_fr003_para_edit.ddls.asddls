define root abstract entity ZR_FR003_para_edit
{
  @EndUserText.label           : 'Posting date'
  @UI.defaultValue             : #( 'ELEMENT_OF_REFERENCED_ENTITY: Postingdate')
  postingdate                  : budat;
  @EndUserText.label           : 'GL account'
  @Consumption.valueHelpDefinition: [{ entity :  { name:    'I_GLAcctInChtOfAcctsStdVH',
                                       element: 'GLAccount'}}]
  @UI.defaultValue             : #( 'ELEMENT_OF_REFERENCED_ENTITY: Glaccount')
  glaccount                    : hkont;
}
