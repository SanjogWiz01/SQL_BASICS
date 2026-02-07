-- Active: 1768452168398@@127.0.0.1@3306@having_clause_db
use having_clause_db;
create table gagets (
    id int primary key auto_increment,
    name varchar(50),
    price decimal(10,2)
);
insert into gagets (id,name, price) values
(1, 'phone', 100.00),
(2, 'laptop', 150.00),
(3, 'microphone', 200.00),
(4, 'headphone', 250.00),
(5, 'moniter', 300.00);
select * from gagets;
create view  MINUTE_MICROSECOND_view as
select name, price from gagets where price >=150;
select * from MINUTE_MICROSECOND_view;

 CREATE VIEW employee_department_info AS
SELECT , e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

drop view IF EXISTS MINUTE_MICROSECOND_view;




