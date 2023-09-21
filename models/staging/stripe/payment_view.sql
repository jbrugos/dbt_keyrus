with
    rawp as (

        select pay_id, orderid, paymentmethod, status as pay_status, {{ cents_to_dollar('amount', 2) }} as amount, created, _batched_at
        from {{ source("striping", "payment") }}
    )

select *
from rawp
