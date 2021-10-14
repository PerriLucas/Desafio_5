with
    source as(
        select
            -- Primary Key
            supplier_id

            -- Foreign Key

            --Information
            , country
            , region	
            , city		
            , postal_code			
            , address
            , company_name	
            , homepage					
            , phone	
            , fax
            , contact_name	
            , contact_title	

            --Stitch
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('northwind_etl','suppliers')}}
    )
select*from source