CLASS zcl_generate_class_hier_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS generate__data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_class_hier_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    generate__data(  ).

    out->write( 'Data created' ).

  ENDMETHOD.
  METHOD generate__data.
* This method adds records to the table so the tree table UI displays data...
    data: hierarchy type table of zclass_hier.


    DELETE FROM zclass_hier.

    hierarchy = VALUE #(
        ( node = 'Tools' description = 'Tools' parent_node = '' )
        ( node = 'Hand Tools' description = 'Hand Tools' parent_node = 'Tools' )
        ( node = 'Power Tools' description = 'Power Tools' parent_node = 'Tools' )
        ( node = 'Hammers' description = 'Hammers' parent_node = 'Hand Tools' )
        ( node = 'Saws' description = 'Saws' parent_node = 'Hand Tools' )
        ( node = 'RepairParts' description = 'Repair Parts' parent_node = '' )
        ( node = 'ElectRepairParts' description = 'Electrical Repair Parts' parent_node = 'RepairParts' )
        ( node = 'CircuitCards' description = 'Circuit Cards' parent_node = 'ElectRepairParts' )
        ( node = 'SFTT' description = 'Surface Treatment' parent_node = 'CircuitCards'  is_mrc = 'X' )
        ( node = 'PRMT' description = 'Precious Material' parent_node = 'CircuitCards'  is_mrc = 'X' )
        ( node = 'HEAT' description = 'Heat Treatment' parent_node = 'CircuitCards'  is_mrc = 'X' )
        ( node = 'POWERSUPPLIES' description = 'Power Supplies' parent_node = 'ElectRepairParts' )
        ( node = 'MechRepair' description = 'Mechanical Repair Parts' parent_node = 'RepairParts' )

    ).

    INSERT zclass_hier FROM TABLE @hierarchy.

  ENDMETHOD.

ENDCLASS.
