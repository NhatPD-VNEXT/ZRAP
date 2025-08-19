CLASS zbp_i_mf003_02_vn DEFINITION
  PUBLIC
  FOR BEHAVIOR OF zi_mf003_01_vn.

  PUBLIC SECTION.

    TYPES: keys_div    TYPE TABLE FOR ACTION IMPORT zi_mf003_01_vn~edit,
           read_tab    TYPE TABLE FOR READ IMPORT zi_mf003_03_vn\_invoice,
           read_result TYPE TABLE FOR READ RESULT zi_mf003_01_vn,
           update_tab  TYPE TABLE FOR UPDATE zi_mf003_01_vn,
           t_map       TYPE RESPONSE FOR MAPPED EARLY zi_mf003_01_vn,
           t_fail      TYPE RESPONSE FOR FAILED EARLY zi_mf003_01_vn,
           t_rep       TYPE RESPONSE FOR REPORTED EARLY zi_mf003_01_vn.

    CLASS-METHODS read_aux
      IMPORTING to_read     TYPE read_tab
      EXPORTING fail        TYPE t_fail
                rep         TYPE t_rep
                read_result TYPE read_result.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBP_I_MF003_02_VN IMPLEMENTATION.


  METHOD read_aux.
    CHECK sy-uname = 'CB9980000188'.
*    READ ENTITIES OF zi_mf003_01_vn IN LOCAL MODE
*      ENTITY _invoice
*      FROM to_read
*      RESULT read_result
*      FAILED fail.
  ENDMETHOD.
ENDCLASS.
