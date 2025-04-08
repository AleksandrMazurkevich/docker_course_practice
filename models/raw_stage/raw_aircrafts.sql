{{
    config (
        materialized = 'table',
        
    )
}}
with source as (

    select * from {{ source('demo_src', 'aircrafts') }}

),

renamed as (

    select
        aircraft_code,
        model,
        range,
        'booking' as RECORD_SOURCE,
        now() as LOAD_DATE
    from source

)

select * from renamed