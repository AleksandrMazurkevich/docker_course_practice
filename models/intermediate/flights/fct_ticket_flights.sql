{{
  config(
    materialized = 'table',
    indexes=[
      {'columns': ['ticket_no'], 'type': 'btree'}
    ]
)
}}


select 
    "ticket_no",
    "flight_id",
    "fare_conditions",
    "amount"
from 
    {{ ref('stg_ticket_flights') }}
    