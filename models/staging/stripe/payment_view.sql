with
    rawp as (

        select pay_id, orderid, paymentmethod, pay_status, {{cents_to_dollar('amount') }} as amount, created, _batched_at
        from {{ source("striping", "payment") }}
    )
select *
from rawp
