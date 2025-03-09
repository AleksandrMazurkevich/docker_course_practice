{% macro utils(relation_name) %}
  {%- set relation = ref(relation_name) -%}
  {%- set columns = adapter.get_columns_in_relation(relation) -%}
  {%- for column in columns -%}
    {{ column.name }}{% if not loop.last %}, {% endif %}
  {%- endfor -%}
{% endmacro %}
