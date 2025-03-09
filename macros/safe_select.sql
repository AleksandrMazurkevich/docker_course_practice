{% macro safe_select(schema_name, table_name) %}
    {% set relation = adapter.get_relation(
        database=target.database,
        schema=schema_name,
        identifier=table_name
    ) %}

    {% if relation %}
        SELECT * FROM {{relation}}
    {% else %}
         SELECT NULL
    {% endif %}
{% endmacro %}