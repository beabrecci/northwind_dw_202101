{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_employees') }}
    )

    , transformed as (
        select  
            row_number() over (order by employee_id) as employee_sk -- auto-incremental sk
            , country
            , city
            , hire_date
            , address
            , birth_date
            , region
            , last_name
            , employee_id
            , first_name
            , title
            , title_of_courtesy
            , notes	
            , home_phone
            , reports_to
        from staging
    )

select * from transformed
