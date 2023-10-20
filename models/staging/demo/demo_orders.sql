
With raw as (
    select id, user_id, status, order_date, _etl_loaded_at 
    from {{ source("demo_k", "demo_orders") }}
)

select * from orders
