with
    source_data as (
        select 
            country
            ,city
            ,fax
            ,postal_code
            ,homepage
            --,_sdc_table_version as sdc_table_version
            ,address
            ,region
            --,_sdc_received_at as sdc_received_at
            ,supplier_id
            --,_sdc_sequence as sdc_sequence
            ,contact_name
            ,phone
            ,company_name
            ,contact_title
            --,_sdc_batched_at as sdc_batched_at

        from {{source('northwind_etl','suppliers')}} 
    )

select * from source_data
