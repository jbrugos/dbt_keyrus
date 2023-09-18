
{# run macro from model  #}

{{
    union_tables_by_prefix(
        database="dbt", schema="shop", prefix="order"
    )
}}
