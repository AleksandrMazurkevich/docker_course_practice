{{
    config (
        materialized = 'incremental',
        incremental_strategy = 'append', 
        tags = ['fligths']
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
from {{ source('demo_src', 'flights') }}
{% if is_incremental() %}
WHERE 
    actual_departure > (SELECT MAX(actual_departure) FROM {{ this }})
{% endif %}

  