{% macro cents_to_dollar(column_one) -%}

 round( 1.0 * {{ column_one }} / 100, {{ decimals }})

{%- endmacro -%}