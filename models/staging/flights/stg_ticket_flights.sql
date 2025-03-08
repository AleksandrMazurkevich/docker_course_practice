{{ 
    config(
        materialized='table',
    ) 
}}

select
    "ticket_no",
    "flight_id",
    "fare_conditions",
    {{ kopek_to_ruble('amount', 2) }} as "amount"
from {{ source('demo_src', 'ticket_flights') }}

{%- if target.name == 'dev' %}
limit 10000
{% endif %}
  