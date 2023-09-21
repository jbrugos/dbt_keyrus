

with
    raw as (

        select id, user_id, order_date, status, _etl_loaded_at, row_number() over (partition by user_id order by order_date, id) as user_order_seq
        from {{ source("SnowKeyrus", "orders") }}
    )
select *
from raw
