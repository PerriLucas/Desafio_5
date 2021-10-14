{{ config (materialized='table')}}
select
 -- Primary Key
    order_id
    -- Foreign Key
    , employee_id
    , customer_id

    --Information	
    , shipped_date	
    , ship_country		
    , ship_name
    , ship_city	
    , order_date	
    , required_date			

from {{ ref('stg_orders') }}