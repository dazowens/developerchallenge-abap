CLASS zcl_developerchallenge_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_developerchallenge_abap IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
out->write( 'Hello world!' ).
endmethod.

ENDCLASS.
