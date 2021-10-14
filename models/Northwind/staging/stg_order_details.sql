with
    source as(
        select		
	
            -- Primary Key
            order_id
            -- Foreign Key
            , product_id

            --Information
            , discount	
            , unit_price	
            , quantity

            --Stitch
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('northwind_etl','order_details')}}
    )
select*from source