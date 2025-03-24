SELECT
  bookref,
  book_date,
  total_amount,
  date
FROM {{ ref('stg_flights__bookings') }} AS stg_flights__bookings