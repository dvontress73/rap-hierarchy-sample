@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for class hierarchy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLASS_HIER as select from zclass_hier
//association [1..1] to ZI_CLASS_HIER as _parent on $projection.ParentNode = _parent.Node
association of many to one ZI_CLASS_HIER as _Parent on $projection.ParentNode = _Parent.Node
{
    key node as Node,
    description as Description,
    parent_node as ParentNode,
    is_temporary as TempValue,
    is_mrc as MRC,
    is_inc as INC,
    
    /* Associations */
    _Parent
    
    
}
