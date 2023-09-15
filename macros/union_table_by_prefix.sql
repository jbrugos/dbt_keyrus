{#
https://github.com/dbt-labs/dbt-learn-jinja/blob/main/macros/union_tables_by_prefix.sql
https://docs.getdbt.com/reference/dbt-jinja-functions/execute

#}

{%- macro union_tables_by_prefix(database, schema, prefix) -%}

  {%- set tables = dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) -%}

  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
  {% endfor -%}
  
{%- endmacro -%}

{# run macro from model  #}
{{ union_tables_by_prefix(

      database='raw',
      schema='dbt_learn_jinja', 
      prefix='orders__'
        
      )
  }}