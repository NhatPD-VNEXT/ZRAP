
define root abstract entity ZA_MF003_01_VN
{
    
      @EndUserText.label : '{@i18n>PrinterName}'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_UserPrinter_VH', element: 'printer' } } ]
      @UI.defaultValue: 'PDF'
  key PrinterName    : zzprintername;

      @EndUserText.label : '{@i18n>FormName}'
  key FormName       : zzformname;

//      @Consumption.hidden: true
//      @UI.defaultValue: #( 'ELEMENT_OF_REFERENCED_ENTITY: HideAdditionalParams' )
//      HideAdditionalParameters: abap_boolean;
      
      @EndUserText.label : '{@i18n>SignerName}'
      SignersName    : abap.char( 20 );

      @EndUserText.label : '{@i18n>PONotes}'
      PONotes        : abap.char( 40 );

      @EndUserText.label : '{@i18n>PONo}'
      PONo           : abap.char( 50 );

      @EndUserText.label : '{@i18n>PrintPosition1}'
      @Consumption.valueHelpDefinition: [{ entity:
    {name            : 'ZI_MR903_04' , element: 'POItemName' },
    distinctValues   : true
    }]
      PrintPosition1 : zz_mr903_poitem_name;

      @EndUserText.label : '{@i18n>PrintPosition2}'
      @Consumption.valueHelpDefinition: [{ entity:
    {name            : 'ZI_MR903_04' , element: 'POItemName' },
    distinctValues   : true
    }]
      PrintPosition2 : zz_mr903_poitem_name;

      @EndUserText.label : '{@i18n>PrintPosition3}'
      @Consumption.valueHelpDefinition: [{ entity:
    {name            : 'ZI_MR903_04' , element: 'POItemName' },
    distinctValues   : true
    }]
      PrintPosition3 : zz_mr903_poitem_name;
      
      @EndUserText.label: '{@i18n>PopUpInfoText}'
      static_text : abap.char(1);
//    @UI.dataPoint: { title: '※強制表示の場合は、「購買伝票の明細テキスト」と「仕入先品目コード 」が表示されます。' }
//    @UI.defaultValue : '※強制表示の場合は、「購買伝票の明細テキスト」と「仕入先品目コード 」が表示されます。'
//    text : abap.char( 255 );
}
