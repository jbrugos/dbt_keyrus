

with
    raw as (

        select id, first_name, last_name, first_name || ' ' || last_name as name 
        from {{ source("SnowKeyrus", "customers") }}
    )
select *
from raw
