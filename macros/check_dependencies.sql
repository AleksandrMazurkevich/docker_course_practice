{% macro check_dependencies() %}
    {% set dependencies = model.depends_on.nodes | list %}
    {% set dependencies_count = dependencies | length %}

    {% if dependencies_count > 1 %}
        {% do log("Модель " ~ model.name ~ " зависит от " ~ dependencies_count ~ " объектов!", info=True) %}
    {% endif %}
{% endmacro %}