
with order_customer as (

     select 
        b.id as customer_id,
        b.name as full_name,
        b.last_name as surname,
        b.first_name as givenname,
        min(order_date) as first_order_date,
        min(case when a.status NOT IN ('returned','return_pending') then order_date end) as first_non_returned_order_date,
        max(case when a.status NOT IN ('returned','return_pending') then order_date end) as most_recent_non_returned_order_date,
        COALESCE(max(a.user_order_seq),0) as order_count,
        COALESCE(count(case when a.status != 'returned' then 1 end),0) as non_returned_order_count,
        sum(case when a.status NOT IN ('returned','return_pending') then ROUND(c.amount/100.0,2) else 0 end) as total_lifetime_value,
        sum(case when a.status NOT IN ('returned','return_pending') then ROUND(c.amount/100.0,2) else 0 end)/NULLIF(count(case when a.status NOT IN ('returned','return_pending') then 1 end),0) as avg_non_returned_order_value,
        array_agg(distinct a.id) as order_ids

    from {{ ref("orders_view") }} as a 
    join {{ ref("customers_view") }} as b
    on a.user_id = b.id

    left outer join {{ ref("payment_view") }} as c
    on a.id = c.orderid

    where a.status NOT IN ('pending') and c.pay_status != 'fail'

    group by b.id, b.name, b.last_name, b.first_name
) 

select * from order_customer
order by 2
