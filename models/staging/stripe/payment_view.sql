with
    rawp as (

        select pay_id, orderid, paymentmethod, pay_status, amount, created, _batched_at
        from {{ source("striping", "payment") }}
    )
select *
from rawp
