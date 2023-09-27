with
    rawp as (

        select pay_id, orderid, paymentmethod, pay_status, {{ cents_to_dollar('amount', 2) }} as amount, created, _batched_at
        from {{ source("striping", "payment") }}
    )
-- This is only a macro to format the amount in dollar
select *
from rawp
