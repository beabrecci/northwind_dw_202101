with
    source_data as (
        select 
            shipper_id
            ,phone
            ,company_name
            --,_sdc_sequence as sdc_sequence
            --,_sdc_table_version as sdc_table_version
            --,_sdc_received_at as sdc_received_at
            --,_sdc_batched_at as sdc_batched_at

        from {{source('northwind_etl','shippers')}} 
    )

select * from source_data