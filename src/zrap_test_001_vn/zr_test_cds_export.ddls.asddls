@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_TEST_CDS_EXPORT'
@Metadata.ignorePropagatedAnnotations: true

@UI: {
  headerInfo: {
    typeName: 'File Upload',
    typeNamePlural: 'File Uploads'
  }
}

define root view entity ZR_TEST_CDS_EXPORT
  as select from zpurcncd_file
{

      @UI.facet: [ {
           id: 'idIdentification',
           type: #IDENTIFICATION_REFERENCE,
           label: 'General infomation',
           position: 10
         }
       ]

      @UI.lineItem      : [{ position: 10 },
                            { type: #FOR_ACTION, dataAction: 'Export', label: 'Export'}]
  key attachment_uuid       as AttachmentUuid,
      status                as Status,
      @Semantics.largeObject:{
      mimeType: 'Mimetype',
      fileName: 'Filename',
      acceptableMimeTypes: ['text/txt'],
      contentDispositionPreference: #INLINE }
      @UI:
      {identification: [ { position: 1, label: 'Attachment' } ] }
      attachment            as Attachment,
      @Semantics.mimeType: true
      mimetype              as Mimetype,
      filename              as Filename,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt

}
