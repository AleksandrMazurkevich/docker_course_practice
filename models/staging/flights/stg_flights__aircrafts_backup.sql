{# В модели stg_flights__aircrafts_backup.sql создайте pre_hook,  который перед обновлением модели будет переименовывать таблицу, существующую до начала обновления модели и относящуюся к данной модели, устанавливая название по следующему шаблону:

intermediate.stg_flights__aircrafts_backup_[YYYY_MM_DD_HHSSmm]

, где [YYYY_MM_DD_HHSSmm] - год, месяц, число, часы, минуты и секунды текущего времени (времени начала обновления модели)

Опубликуйте модель в github и приложите на нее ссылку. #}

{{
    config(
        materialized = 'table',
        pre_hook = '
            {% set timestamp = run_started_at.strftime("%Y_%m_%d_%H%M%S") %}
            {% set old_table = this %}
            {% set new_table = api.Relation.create(
                identifier = old_table.identifier ~ "_" ~ timestamp,
                schema = old_table.schema,
                database = old_table.database,
                type = "table"
            ) %}

            {% set existing_table = adapter.get_relation(old_table.database, old_table.schema, old_table.identifier) %}
                
            {% if existing_table %}
                    {% do adapter.rename_relation(old_table, new_table) %}
            {% endif %}
        '
    )
}}


select *
from  {{ source ('demo_src', 'aircrafts')}} mysecretpassword