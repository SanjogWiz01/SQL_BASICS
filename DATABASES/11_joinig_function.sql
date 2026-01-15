-- Active: 1766136828156@@127.0.0.1@3306@university
create table employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT
);
insert into employees (emp_id, emp_name, department_id) values
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 10),
(4, 'David', 30);
 select * from employees;
  alter table employees add salary DECIMAL(10,2);
 update employees set salary = 50000 where emp_id = 1;
    update employees set salary = 60000 where emp_id = 2;
    update employees set salary = 55000 where emp_id = 3;
    update employees set salary = 70000 where emp_id = 4;
select*from students;

