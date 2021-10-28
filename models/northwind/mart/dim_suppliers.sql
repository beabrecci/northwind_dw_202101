{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_suppliers') }}
    )

    , transformed as (
        select  
            row_number() over (order by supplier_id) as supplier_sk -- auto-incremental sk
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
        from staging
    )

select * from transformed