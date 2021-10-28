with
    source_data as (
        select 
            country
            ,city
            ,hire_date
            ,address
            ,birth_date
            ,region
            ,last_name
            ,employee_id
            ,first_name
            ,title
            ,title_of_courtesy
            ,notes	
            ,home_phone
            ,reports_to
        from {{source('northwind_etl','employees')}} 
    )

select * from source_data