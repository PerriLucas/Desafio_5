{{ config (materialized='table')}}
select
    -- Primary Key
    product_id

    -- Foreign Key
    , category_id
    , supplier_id

    -- Information
    , units_in_stock			
    , unit_price			
    , product_name	
    , quantity_per_unit				
    , units_on_order
    , is_discontinued
    
from {{ ref('stg_products') }}