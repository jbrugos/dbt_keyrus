{% macro cents_to_dollar(column_one, decimals) -%}

 round( 1.0 * {{ column_one }} / 100, {{ decimals }})

{%- endmacro -%}