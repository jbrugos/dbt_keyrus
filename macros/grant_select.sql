
-- https://github.com/dbt-labs/dbt-learn-jinja/blob/main/macros/grant_select.sql
-- chttps://docs.getdbt.com/reference/dbt-jinja-functions/log
-- https://docs.getdbt.com/reference/dbt-jinja-functions/target


{% macro grant_select(schema=target.schema, role=target.role) %}
    
    {% set sql %}
        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role }};

    {% endset %}

    {{ log(' Granting select on all table and views in the schema' ~ schema ~ 'to role ' ~ role , info=true) }}

    {% do run_query(sql) %}
    {{ log('Priviledges granted! ', info=true) }}

{% endmacro %}

