{{ config (materialized='table')}}
select
    -- Primary Key
    shipper_id

    -- Information
    , company_name
    
from {{ ref('stg_shippers') }}
order by shipper_id