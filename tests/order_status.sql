

select distinct o.status, count(o.id) as order_count, count(o.user_id) as user_count
from {{ ref("orders_view") }} as o
left join {{ ref("customers_view")}} as c
on o.user_id=c.id
group by o.status
order by 2 desc
