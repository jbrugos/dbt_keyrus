
{%- macro union_tables_by_prefix(database, schema, prefix) -%}

    {%- set tables = dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) -%}
    
    {% for table in tables %}

        {%- if not loop.first -%}
        union all 
        {%- endif %}
        
        select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
    {% endfor -%}
    
  
{%- endmacro -%}

/* https://github.com/dbt-labs/dbt-learn-jinja/blob/main/macros/union_tables_by_prefix.sql
 https://docs.getdbt.com/reference/dbt-jinja-functions/execute */