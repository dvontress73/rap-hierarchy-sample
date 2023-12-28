@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Hierarcy Master'
define root view entity ZR_HIER_MASTER
  as select from zhier_master as HierarchyMaster
{
  key node_uuid as NodeUUID,
  key node as Node,
  description as Description,
  drillstate as  Drillstate,
  created_by as CreatedBy,
  created_at as CreatedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed as LocalLastChanged
  
}
