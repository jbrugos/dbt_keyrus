{# ------- This is my jinger sir! -------- #}
{% set payment_method =['credit_card','coupon','bank_transfer','gift_card'] -%}
    
    with payment_temp as (
    
    select * from {{ref("payment_view")}}

    ), pivotpay as (
    select orderid,
    
    {% for pays in payment_method -%}
        sum( case when PAYMENTMETHOD='{{pays}}' then amount else 0 end) as {{ pays }}_amount
            {%- if not loop.last -%} , {% endif %}                             
    {%endfor%} 
    from payment_temp
    where pay_status='success'
    group by 1
    )

    select * from pivotpay

