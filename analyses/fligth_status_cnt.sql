{# *. Создайте analyses (ad hoc запрос) с названием fligth_status_cnt, 
который будет возвращать одну строку. На каждое уникальное значение в поле "статус" 
таблицы с перелетами (stg_flights__flights.status) выведите одну колонку с названием 
status_[название статуса]. В этой колонке нужно отобразить значение с количеством перелетов
 с данным статусом (количество строк в таблице stg_flights__flights с данным статусом). #}



{%- set aircraft_query %}
SELECT DISTINCT
    status
FROM
    {{ ref('stg_flights__flights') }}
{% endset %}  

{% set aircraft_query_result = run_query(aircraft_query) %}
{% if execute %}
    {% set flights_status = aircraft_query_result.columns[0].values() %}
{% else %}
    {% set flights_status = [] %}
{% endif %}

SELECT 
    {% for status in flights_status %}
    SUM(CASE WHEN status = '{{ status }}' THEN 1 ELSE 0 END) as "status_{{ status }}_" 
        {%- if not loop.last %},{% endif %}
    {%- endfor %}
FROM
    {{ ref('stg_flights__flights') }}