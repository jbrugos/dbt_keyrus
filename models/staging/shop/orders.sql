

with raw as (

    select 
        ID, 
        USER_ID, 
        ORDER_DATE, 
        STATUS, 
        _ETL_LOADED_AT 
    from {{ source('SnowKeyrus', 'orders') }}
)
select * from raw;