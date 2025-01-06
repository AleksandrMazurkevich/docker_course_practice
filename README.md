Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### Задания

Часть 1.
- Создайте модели fct_flights, fct_ticket_flights и fct_tickets по аналогии с моделью fct_bookings.
- Добавьте код данных моделей в git и отправьте коммит в github. Приложите ссылку на github вашего проекта.

Часть 2.
Материализуйте способами, перечисленными ниже, модели fct_ticket_flights и stg_booking__ticket_flights:

- stg_booking__ticket_flights - ephemeral, fct_ticket_flights - table;
- stg_booking__ticket_flights - table, fct_ticket_flights - view;
- stg_booking__ticket_flights - table, fct_ticket_flights - table.

По каждой комбинации материализации приложите код из логов создания таблицы fct_ticket_flights__dbt_tmp в БД, сгенерированный dbt.
 - fct_ticket_flights
 - stg_booking__ticket_flights 
  
Логи вы может посмотреть одним из следующих способов:
- запустив сборку модели из терминала с флагом --log-level debug 
- посмотреть логи в файле проекта log/dbt.log
- в файле target/run/dbt_course/models/intermediate/booking/facts/fct_ticket_flights.sql
