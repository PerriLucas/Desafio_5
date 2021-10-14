with
    source as(
        select		
	
            -- Primary Key
            customer_id

            -- Foreign Key

            --Information
            , country
            , region
            , city
            , postal_code
            , company_name
            , contact_name
            , fax
            , phone

            --Stitch
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('northwind_etl','customers')}}
    )
select*from source