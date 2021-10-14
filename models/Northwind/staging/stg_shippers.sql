with
    source as(
        select
            -- Primary Key
            shipper_id

            -- Foreign Key

            --Information
            , company_name						
            , phone		

            --Stitch
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
        from {{source('northwind_etl','shippers')}}
    )
select*from source