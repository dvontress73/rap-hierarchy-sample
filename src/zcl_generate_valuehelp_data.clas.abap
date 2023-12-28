CLASS zcl_generate_valuehelp_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS generate_drilldown_state_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_valuehelp_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    generate_drilldown_state_data(  ).

    out->write( 'Drill down state data created' ).

  ENDMETHOD.
  METHOD generate_drilldown_state_data.

    DATA: state TYPE TABLE OF zdrilldown_state.

    DELETE FROM zdrilldown_state.

    state = VALUE #(
        ( drilldown_state = 'Collapsed' )
        ( drilldown_state = 'Expanded' )
        ( drilldown_state = 'Leaf' )
    ).

    INSERT zdrilldown_state FROM TABLE @state.

  ENDMETHOD.

ENDCLASS.
