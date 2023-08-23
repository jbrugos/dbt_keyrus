

with order_pay as (

    select o.id, o.user_id, o.order_date, o.status, p.pay_id, p.pay_status, p.amount,p.paymentmethod, o._etl_loaded_at as order_load_time 
    from {{ ref("orders_view") }} as o
    left join {{ ref("payment_view") }} as p
    on o.id=p.orderid
)

select * from order_pay