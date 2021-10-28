{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_shippers') }}
    )

    , transformed as (
        select  
            row_number() over (order by shipper_id) as shipper_sk -- auto-incremental sk
            , shipper_id
            , phone
            , company_name
        from staging
    )

select * from transformed