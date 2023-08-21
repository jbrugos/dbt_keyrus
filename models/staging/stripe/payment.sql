with raw as (

    select 
        ID, 
        ORDERID, 
        PAYMENTMETHOD, 
        STATUS, 
        AMOUNT, 
        CREATED, 
        _BATCHED_AT
    from {{ source('SnowKeyrus', 'payment') }}
)
select * from raw;