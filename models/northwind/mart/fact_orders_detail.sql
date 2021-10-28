{{ config(materialized='table') }}

with
    customers as (
        select
        customer_sk
        , customer_id
        from {{ ref('dim_customers') }}
    ),

    products as (
        select
        product_sk 
        , product_id
        , units_in_stock
        , category_id
        , unit_price
        , product_name
        , quantity_per_unit
        , supplier_id
        , units_on_order
        , discontinued
        , reorder_level
        from {{ ref('dim_products') }}
    ),

    shippers as (
        select
        shipper_sk
        , shipper_id
        , phone
        , company_name
        from {{ ref('dim_shippers') }}
    ),

    suppliers as (
        select
        supplier_sk 
        , supplier_id
        , country
        , city
        , fax
        , postal_code
        , homepage
        , address
        , region
        , contact_name
        , phone
        , company_name
        , contact_title	
        from {{ ref('dim_suppliers') }}
    ),

        employees as (
        select
        employees_sk
        ,employee_id
        ,first_name
        ,title
        ,title_of_courtesy
        ,reports_to
        from {{ ref('dim_employees') }}
    ),

        order_details as (
        select
        employees_sk
        ,employee_id
        ,order_id
        ,first_name
        ,title
        ,title_of_courtesy
        ,reports_to
        from {{ ref('stg_order_details') }}
    ),

    

, orders_with_sk as (
    select
            orders.order_id
            , customers.customer_id
            , employees.employee_id
            , products.product_id
            , suppliers.supplier_id
            , orders.order_date 
            , orders.ship_region 
            , orders.shipped_date
            , orders.ship_country
            , orders.ship_address 
            , orders.ship_postal_code
            , orders.ship_city
            , orders.ship_name
            , orders.freight 
            , shippers.shipper_id
            --, ship_via as shipper_id
            , orders.required_date

    from {{ref('stg_orders')}} orders
    left join customers customers on orders.customer_id = customers.customer_id
    left join products products on orders.order_id = products.order_id
    left join shippers shippers on orders.shipper_id = shippers.shipper_id
    left join suppliers suppliers on orders.supplier_id = suppliers.supplier_id
    left join employees employees on orders.employee_id = employees.employee_id
    left join order_details order_details on orders.order_id = order_details.order_id

)

select * from orders_with_sk