-- Active: 1766136828156@@127.0.0.1@3306@suyog
CREATE table employee_info (
    eid int,
    ename varchar(20),
    address varchar(50),
    department varchar(20),
    salary decimal(10,2)
);
insert into employee_info(eid, ename, address, department, salary) 
values
(1, 'John Doe', '123 Main St', 'Sales', 55000.00),
(2, 'Jane Smith', '456 Oak Ave', 'Marketing', 60000.00),
(3, 'Jim Brown', '789 Pine Rd', 'IT', 75000.00),
(4, 'Emily Davis', '321 Maple St', 'HR', 50000.00),
(5, 'Michael Wilson', '654 Cedar Blvd', 'Finance', 80000.00);


select * from employee_info;
drop database suyog;