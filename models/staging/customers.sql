with raw as (

    select 
        id, 
        first_name, 
        last_name 
    from {{ source('SnowKeyrus', 'customers') }}
)
select * from raw;