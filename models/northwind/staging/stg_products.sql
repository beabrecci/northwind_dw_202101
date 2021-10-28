with
    source_data as (
        select 
            product_id
        	,units_in_stock
            ,category_id
            ,unit_price
            --,_sdc_table_version as sdc_table_version
            ,product_name
            ,quantity_per_unit
            --,_sdc_received_at as sdc_received_at
            ,supplier_id
            --,_sdc_sequence as sdc_sequence
            ,units_on_order
            ,discontinued
            --,_sdc_batched_at as sdc_batched_at
            ,reorder_level
        from {{source('northwind_etl','products')}} 
    )

select * from source_data