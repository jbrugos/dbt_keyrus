
With mart_orders as (
    select 
    user_id as customer_id,
    min(order_date) as first_order_date,
    COALESCE(max(user_order_seq),0) as order_count,
    max(case when status NOT IN ('returned','return_pending') then order_date end) as most_recent_non_returned_order_date,
    COALESCE(count(case when status != 'returned' then 1 end),0) as non_returned_order_count,
    array_agg(distinct id) WITHIN GROUP (ORDER BY id ASC) as order_ids

from {{ ref("demo_orders_view") }}
group by user_id

)
select * from mart_orders
