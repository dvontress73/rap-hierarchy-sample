@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_HIER_RELATIONS'
@ObjectModel.semanticKey: [ 'Node' ]
@Search.searchable: true
define root view entity ZC_HIER_RELATIONS
  provider contract transactional_query
  as projection on ZR_HIER_RELATIONS
{
  key NodeUUID,
  @Search.defaultSearchElement: true
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PARENTNODE_VH', element: 'Node' } }]
  key Node,
  parentnode_uuid,
 //@Search.defaultSearchElement: true
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PARENTNODE_VH', element: 'Node' } }]
  Parentnode,
  HierarchyLevel,
  Description,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_DRILLDOWN_VH', element: 'DrilldownState' } } ]
  Drillstate,
  CreatedBy,
  CreatedAt,
  LocalLastChanged
  
}
