{% macro count_project_objects() %}
    {% set models_count = graph.nodes.values() | selectattr("resource_type", "equalto", "model") | list | length %}
    {% set macros_count = graph.macros.values() | list | length %}
    {% set seeds_count = graph.nodes.values() | selectattr("resource_type", "equalto", "seed") | list | length %}
    {% set snapshots_count = graph.nodes.values() | selectattr("resource_type", "equalto", "snapshot") | list | length %}

    {% do log("Всего в проекте:", info=True) %}
    {% do log("- " ~ models_count ~ " моделей", info=True) %}
    {% do log("- " ~ seeds_count ~ " seed", info=True) %}
    {% do log("- " ~ snapshots_count ~ " snapshot", info=True) %}
    {% do log("- " ~ macros_count ~ " макросов", info=True) %}
    
{% endmacro %}

