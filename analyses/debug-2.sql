{# {% set relation_exists = load_relation(ref('fct_flights')) is not none %}
{% if relation_exists %}
      {{ "my_model has already been built" }}
{% else %}
      {{ "my_model doesn't exist in the warehouse. Maybe it was dropped?" }}
{% endif %} #}

{% do adapter.create_schema(
    api.Relation.create(
        database="dwh_flight", 
        schema="test_schema"
    )
)
%}
