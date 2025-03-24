{% macro log_run_results() %}
  {% set results = dbt_utils.get_run_results() %}

  {% for result in results %}
    INSERT INTO {{ target.database }}.logs.dbt_logs
    (event_date, event_name, model_name, execution_time)
    VALUES (
      CURRENT_TIMESTAMP,
      'finish run model',
      '{{ result.node.name }}',
      {{ result.execution_time }}
    );
  {% endfor %}
{% endmacro %}
