@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for class hierarchy'

define hierarchy ZI_CLASS_HIER_PC 
as parent child hierarchy(
    source ZI_CLASS_HIER
    child to parent association _Parent
    start where ParentNode is initial
    siblings order by Node ascending
)

{
    key Node,    
    ParentNode
   
}
