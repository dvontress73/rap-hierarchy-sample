@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Hierarchy Relationships'
define root view entity ZR_HIER_RELATIONS
  as select from zhier_relations as HierarchyRelationship
{
  key node_uuid as NodeUUID,
  key node as Node,
  parentnode_uuid,
  parentnode as Parentnode,
  hierarchy_level as HierarchyLevel,
  description as Description,
  drillstate as Drillstate,
  created_by as CreatedBy,
  created_at as CreatedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed as LocalLastChanged
  
}
