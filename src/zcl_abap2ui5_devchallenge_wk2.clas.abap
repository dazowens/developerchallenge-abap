CLASS zcl_abap2ui5_devchallenge_wk2 DEFINITION PUBLIC.

  PUBLIC SECTION.

    INTERFACES z2ui5_if_app.

    DATA username  TYPE string.
    DATA date TYPE string.
    DATA check_initialized TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap2ui5_devchallenge_wk2 IMPLEMENTATION.


  METHOD z2ui5_if_app~main.

    IF check_initialized = abap_false.
      check_initialized = abap_true.
      username  = 'Daz Owens'.
      date = cl_abap_context_info=>get_system_date( ).
    ENDIF.

    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |{ username } { date } - send to the server| ).
    ENDCASE.

    client->set_next( VALUE #( xml_main = Z2UI5_CL_XML_VIEW=>factory(
        )->shell(
        )->page( title = 'abap2UI5 - Developer Challenge Week 2'
            )->simple_form( title = 'Developer Challenge Week 2' editable = abap_true
                )->content( ns = `form`
                    )->title( 'Make an input here and send it to the server...'
                    )->label( 'Date'
                    )->date_picker( value = client->_bind( date )
                    )->label( 'Username'
                    )->input(
                        value   = client->_bind( username )
                    )->button(
                        text  = 'post'
                        press = client->_event( 'BUTTON_POST' )
         )->get_root( )->xml_get( ) ) ).

  ENDMETHOD.


ENDCLASS.
