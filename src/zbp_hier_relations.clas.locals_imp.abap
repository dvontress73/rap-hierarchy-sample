CLASS lhc_hierarchyrelationship DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR HierarchyRelationship
        RESULT result,
      precheck_create FOR PRECHECK
        IMPORTING entities FOR CREATE HierarchyRelationship.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE HierarchyRelationship.
    METHODS AddParentNodeUUID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR HierarchyRelationship~AddParentNodeUUID.

ENDCLASS.

CLASS lhc_hierarchyrelationship IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD precheck_create.
*    "Get the parent node UUID
*    loop at entities ASSIGNING FIELD-SYMBOL(<entity>).
*        select single @abap_true
*            from zhier_master
*            where node = @<entity>-Parentnode
*            INTO @data(exists).
*
*     if sy-subrc = 0.
*
*     ENDIF.
*    ENDLOOP.
  ENDMETHOD.

  METHOD precheck_update.
  ENDMETHOD.

  METHOD AddParentNodeUUID.

    READ ENTITIES OF zr_hier_relations IN LOCAL MODE
        ENTITY HierarchyRelationship
            FIELDS ( parentnode_uuid )
            WITH CORRESPONDING #( keys )
            RESULT DATA(parentnodes)
            FAILED DATA(read_failed).

    CHECK parentnodes IS NOT INITIAL.
*
*   "Get the uuid from the hierarchy master table
    LOOP AT parentnodes INTO DATA(parentnode).
      SELECT SINGLE node_uuid  FROM zhier_master
          WHERE node = @parentnode-Parentnode
          INTO @DATA(pnode_uuid).

      MODIFY ENTITIES OF zr_hier_relations IN LOCAL MODE
      ENTITY HierarchyRelationship
      UPDATE
      FIELDS ( parentnode_uuid ) WITH VALUE #( ( %tky = parentnode-%tky parentnode_uuid = pnode_uuid ) ).

    ENDLOOP.


  ENDMETHOD.



ENDCLASS.
