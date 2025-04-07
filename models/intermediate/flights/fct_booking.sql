SELECT
  {{ dbt_utils.generate_surrogate_key(['stg_flights__bookings.bookref']) }} AS surrogate_key, 
  bookref,
  book_date,
  total_amount,
  date
FROM {{ ref('stg_flights__bookings') }} AS stg_flights__bookings