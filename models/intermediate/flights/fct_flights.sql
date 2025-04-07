{{
  config(
    materialized = 'table',
    post_hook = "
      {% set statuses = dbt_utils.get_column_values(
        table=ref('stg_flights__flights'),
        column='status'
      ) %}
      {% do log(' Уникальные статусы полетов ): ' ~ statuses, info=True) %}
    "
    )

}}


select
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    departure_airport,
    arrival_airport,
    status,
    aircraft_code,
    actual_departure,
    actual_arrival
from {{ ref('stg_flights__flights') }}

fct_fligths__tickets