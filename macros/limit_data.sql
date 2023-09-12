{% macro limit_data(field_one, limit=3) -%}

where {{field_one}} >= dateadd('day', {{limit}},{{field_one}})

{%- endmacro -%}