{{ config( materialized='view', schema='demo') }}

With raw as (
    select id, user_id, status, order_date, _etl_loaded_at, row_number() over (partition by user_id order by order_date, id) as user_order_seq
    from {{ source("demo_k", "demo_orders") }}
)

select * from raw
