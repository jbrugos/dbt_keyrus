with
    rawp as (

        select id, orderid, paymentmethod, pay_status, amount, created, _batched_at
        from {{ source("stripe", "payment") }}
    )
select *
from rawp
;
