{{ config (materialized='table')}}

with 
    customers as (
    select
        customer_sk
        , customer_id
    from {{ ref('dim_customers') }}
    )
    , shippers as (
        select
        *
        from {{ ref('dim_shippers') }}
    )
    , products as (
        select
        *
        from {{ ref('dim_products') }}
    )
    , suppliers as (
        select 
        *
        from {{ ref('dim_suppliers') }}
    )
, orders_with_sk_ship as (
    select
        orders.order_id
        , customers.customer_id	
        , orders.ship_country		
        , orders.ship_name		
        , orders.order_date
        , orders.shipped_date
        , orders.required_date				
        , orders.ship_city	
        , orders.freight
        , shippers.shipper_id	

    from {{ ref('stg_orders') }} orders
    left join customers on orders.customer_id=customers.customer_id
    left join shippers on orders.shipper_id=shippers.shipper_id
    )
, order_details_product as (
        select		
            order_details.order_id
            , products.product_id
            , products.supplier_id
            , order_details.discount	
            , order_details.unit_price	
            , order_details.quantity
        from {{ ref('stg_order_details') }} order_details
        left join products on order_details.product_id=products.product_id
    )
, final as (
    select
        order_details_product.order_id
        , orders_with_sk_ship.customer_id	
        , orders_with_sk_ship.ship_country		
        , orders_with_sk_ship.ship_name		
        , orders_with_sk_ship.order_date
        , orders_with_sk_ship.shipped_date
        , orders_with_sk_ship.required_date				
        , orders_with_sk_ship.ship_city	
        , orders_with_sk_ship.freight
        , orders_with_sk_ship.shipper_id 
        , order_details_product.product_id
        , order_details_product.discount	
        , order_details_product.unit_price	
        , order_details_product.quantity
        ,order_details_product.supplier_id
    from orders_with_sk_ship
    left join order_details_product on orders_with_sk_ship.order_id = order_details_product.order_id
)
select*from final
