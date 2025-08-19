CLASS zcl_demo_comsum_api_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DEMO_COMSUM_API_VN IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
      lt_business_data TYPE TABLE OF zsc_rap_comsum_model_vn_001=>tys_purchase_order_item_type,
      ls_business_data TYPE zsc_rap_comsum_model_vn_001=>tys_purchase_order_item_type,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.



    TRY.
        " Create http client
        TRY.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                         comm_scenario  = 'ZCS_RAP_COMSUM_VN_001'
                                                         comm_system_id = 'ZCS_RAP_COMSUM_VN_001'
                                                         service_id     = 'ZRAP_TEST_OUTBOUND_VN_001_REST' ).
          CATCH cx_http_dest_provider_error.
            "handle exception
        ENDTRY.

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSC_RAP_COMSUM_MODEL_VN_001'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata4/sap/api_purchaseorder_2/srvd_a2x/sap/purchaseorder/0001' ).

        ASSERT lo_http_client IS BOUND.



        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'PURCHASE_ORDER_ITEM' )->create_request_for_read( ).

        " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PURCHASE_ORDER'
*                                                        it_range             = lt_range_PURCHASE_ORDER ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PURCHASE_ORDER_ITEM'
*                                                        it_range             = lt_range_PURCHASE_ORDER_ITEM ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 2 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        out->write( lt_business_data ).

      CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        " Handle Exception
        RAISE SHORTDUMP lx_http_dest_provider_error.
        out->write( | { lx_http_dest_provider_error->get_text( ) }| ).
      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        out->write( | { lx_remote->get_text( ) }| ).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        out->write( | { lx_gateway->get_text( ) }| ).
        " Handle Exception

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.
        out->write( | { lx_web_http_client_error->get_text( ) }| ).

    ENDTRY.
  ENDMETHOD.
ENDCLASS.
