{{
  config(
    materialized = 'table',
    )
}}

select
  {{ utils('stg_flights__bookings') }}
from {{ ref('stg_flights__bookings') }}