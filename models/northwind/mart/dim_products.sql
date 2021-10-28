{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_products') }}
    )

    , transformed as (
        select  
            row_number() over (order by product_id) as product_sk -- auto-incremental sk
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
        from staging
    )

select * from transformed