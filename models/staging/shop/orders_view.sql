with
    raw as (

        select id, user_id, order_date, status, _etl_loaded_at
        from {{ source("SnowKeyrus", "orders") }}
    )
select *
from raw
;
