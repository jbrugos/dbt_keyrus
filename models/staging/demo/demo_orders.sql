
With raw as (
    select id, user_id, status, order_date, _etl_loaded_at 
    from {{ source("demo", "demo_orders") }}
)

select * from orders
