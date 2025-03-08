{# Создать макрос bookref_to_bigint, который принимает один строковый параметр bookref 
и преобразует его к типу bigint следующим образом:

('0x' || book_ref)::bigint
Использовать данный макрос в модели stg_flights__bookings_append или другой модели с данными о бронированиях.
Приложить ссылки на github с кодом макроса и вызовом макроса. #}


{% macro bookref_to_bigint(book_ref) %}
    (('0x' || {{ book_ref }})::bigint)
{% endmacro %}



