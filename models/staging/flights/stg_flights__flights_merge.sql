{{
    config (
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = ['flight_id'],
        tags = ['flights'],
        on_schema_change = 'sync_all_columns'
        
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
    scheduled_departure >  current_date - INTERVAL '100 days'
{% endif %}

  