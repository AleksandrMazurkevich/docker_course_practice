{% set current_date_today = run_started_at | string | truncate(10, True, "") %}
{# 
Разберем параметры:
10 — это максимальная длина строки, до которой нужно обрезать. То есть, мы хотим оставить только первые 10 символов (это длина строки для даты YYYY-MM-DD).
True — если этот параметр равен True, то строка будет обрезана с конца, если её длина превышает указанный лимит (в данном случае, 10 символов).
"" — это строка, которая будет добавлена в конце после обрезки (в данном случае мы не хотим ничего добавлять, так что оставляем пустую строку). #}
SELECT
    COUNT(*) AS future_flights_count
FROM
    {{ ref('fct_flights') }}
WHERE
    scheduled_departure BETWEEN ( '{{ current_date_today }}'::DATE - INTERVAL '10 years' )
    AND '{{ current_date_today }}'::DATE


{% set columns = adapter.get_columns_in_relation(ref('fct_flights')) %}
{% for column in columns %}
    {{ column.column }}: {{ column.data_type }}
{%- endfor %}

