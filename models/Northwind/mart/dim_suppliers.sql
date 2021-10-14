{{ config (materialized='table')}}
select
    -- Primary Key
    supplier_id

    -- Information
    , country
    , city
    , company_name
from {{ ref('stg_suppliers') }}