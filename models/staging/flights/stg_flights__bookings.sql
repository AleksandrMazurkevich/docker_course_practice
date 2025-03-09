
    {{
      config(
        materialized = 'table',
        )
    }}


SELECT 
    {{- bookref_to_bigint('book_ref') }} AS bookref,
    book_date,
    total_amount
FROM {{ source('demo_src', 'bookings') }}
  