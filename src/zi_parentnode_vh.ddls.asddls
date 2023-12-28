@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for parent node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PARENTNODE_VH as select from zhier_master
{
    key node_uuid as NodeUUID,
    key node as Node,
    description as Description,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_at as LastChangedAt,
    last_changed_by as LastChangedBy,
    local_last_changed as LocalLastChanged
}
