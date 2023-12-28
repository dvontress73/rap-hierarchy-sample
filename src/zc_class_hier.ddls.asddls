@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
@OData.hierarchy.recursiveHierarchy: [{ entity.name: 'ZI_CLASS_HIER_PC' }]
define view entity ZC_CLASS_HIER
  as select from ZI_CLASS_HIER
  association of many to one ZC_CLASS_HIER as _Parent on $projection.ParentNode = _Parent.Node
{
    
    key Node,
        @Search.defaultSearchElement: true
        @Search.fuzzinessThreshold: 0.87
        Description,
        TempValue,
        MRC,
        INC,
        
        ParentNode,  
      
        /* Associations  */
        _Parent
}
