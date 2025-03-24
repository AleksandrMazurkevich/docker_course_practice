{% set models_count = graph.nodes.values() | selectattr("resource_type", "equalto", "model") | list | length %}
{% set macros_count = graph.nodes.values() | selectattr("resource_type", "equalto", "macro") | list | length %}
{% set seeds_count = graph.nodes.values() | selectattr("resource_type", "equalto", "seed") | list | length %}
{% set snapshots_count = graph.nodes.values() | selectattr("resource_type", "equalto", "snapshot") | list | length %}
{% set resource_types = graph.nodes.values() | map(attribute="resource_type") | unique | list %}


{% do log("Всего в проекте:", info=True) %}
{% do log("- " ~ models_count ~ " моделей", info=True) %}
{% do log("- " ~ macros_count ~ " макросов", info=True) %}
{% do log("- " ~ seeds_count ~ " сидов", info=True) %}
{% do log("- " ~ snapshots_count ~ " snapshot-ов", info=True) %}
{% do log("- " ~ resource_types ~ " уникальных типов", info=True) %}