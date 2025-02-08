{# Создайте analyses (ad hoc) с названием aircraft_seat_cnt, который посчитает, сколько у каждого из типов самолетов всего мест.
Выведите 2 поля:
код самолета (поле aircraft_code из модели stg_flights__aircrafts)
количество мест в самолете (количество строк с одинаковым значением aircraft_code)
Выполните ad hoc запрос и приложите скриншот с результатом.
Опубликуйте код на github и приложите ссылку.
(Подсказка: Сгруппируйте модель stg_flights__aircrafts по полю aircraft_code и посчитайте количество строк в каждой группе) #}

SELECT 
s.aircraft_code,
count(*)
from {{ ref('stg_flights__seats') }} s
group by 1