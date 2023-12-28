@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_HIER_MASTER'
@ObjectModel.semanticKey: [ 'Node' ]
define root view entity ZC_HIER_MASTER
  provider contract transactional_query
  as projection on ZR_HIER_MASTER
{
  key NodeUUID, 
  key Node,
  Description,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_DRILLDOWN_VH', element: 'DrilldownState' } } ]
  Drillstate,
  CreatedBy,
  CreatedAt,
  LocalLastChanged
  
}
