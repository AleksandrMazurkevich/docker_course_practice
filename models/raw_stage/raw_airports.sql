{{
    config (
        materialized = 'table',
        
    )
}}
select
    "airport_code",
    "airport_name",
    "city",
    "coordinates",
    "timezone",
    'booking' as RECORD_SOURCE,
    now() as LOAD_DATE
from {{ source('demo_src', 'airports') }}