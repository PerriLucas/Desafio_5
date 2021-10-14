{{ config (materialized='table')}}
select
    -- Primary Key
    customer_id

    -- Information
    , country
    , company_name
    
from {{ ref('stg_customers') }}