{% macro kopek_to_ruble(columne_name, scale = 2) %}
    ({{ columne_name }} / 100)::numeric(10, {{ scale }})
{% endmacro %} 