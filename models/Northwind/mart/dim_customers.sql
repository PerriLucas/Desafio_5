{{ config (materialized='table')}}
select
    -- Primary Key
    row_number() over (order by customer_id) as customer_sk

    -- Information
    , customer_id
    , country
    , company_name
    
from {{ ref('stg_customers') }}
order by customer_sk