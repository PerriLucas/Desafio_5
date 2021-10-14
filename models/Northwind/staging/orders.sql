with
    source as(
        select *
        -- Primary Key
        order_id
        -- Foreign Key
        , employee_id
        , customer_id

        --Information
        , ship_region	
        , shipped_date	
        , ship_country		
        , ship_name		
        , order_date			
        , ship_postal_code	
        , ship_city	
        , freight
        , ship_via	
        , required_date
        , ship_address

        --Stitch
        , _sdc_table_version
        , _sdc_received_at
        , _sdc_sequence
_       , sdc_batched_at
        from {{source('northwind_etl','orders')}}
    )
select*from source