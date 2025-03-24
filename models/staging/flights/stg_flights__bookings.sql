
    {{
      config(
        materialized = 'table',
        )
    }}


SELECT 
    {{- bookref_to_bigint('book_ref') }} AS bookref,
    book_date,
    total_amount,
    {{ dbt.current_timestamp() }} as "date"
FROM {{ source('demo_src', 'bookings') }}
  
--{{graph.nodes.values()}}

