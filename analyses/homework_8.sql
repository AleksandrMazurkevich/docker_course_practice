{# 1. Напишите Jinja код, который выведет список 
всех колонок таблицы 
dwh_fligths.intermediate.stg_flights__flights 
(или любой другой таблицы, 
в которой хранятся полеты, 
если у вас отличаются названия 
таблиц от учебного проекта). #}

{% set columns = adapter.get_columns_in_relation(ref('stg_flights__flights')) %}
{% for column in columns %}
    {{ column.column }}: {{ column.data_type }}
{%- endfor %}

