
with order_customer as (

    select count(o.id) as order_count, o.user_id, c.last_name, o.order_date
    from {{ ref("orders_view")}} as o
    left join {{ ref("customers_view")}} as c
    on o.user_id=c.id
    where status='completed'
    group by 2,3,4
) 

select * from order_customer
order by 2