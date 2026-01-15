-- Active: 1766136828156@@127.0.0.1@3306@employee

USE employee;

CREATE TABLE employee_info (
    eid INT,
    ename VARCHAR(20),
    address VARCHAR(50),
    department VARCHAR(20),
    salary DECIMAL(10,2)
);

INSERT INTO employee_info (eid, ename, address, department, salary)
VALUES
(1, 'John Doe', '123 Main St', 'Sales', 55000.00),
(2, 'Jane Smith', '456 Oak Ave', 'Marketing', 60000.00),
(3, 'Jim Brown', '789 Pine Rd', 'IT', 75000.00),
(4, 'Emily Davis', '321 Maple St', 'HR', 50000.00),
(5, 'Michael Wilson', '654 Cedar Blvd', 'Finance', 80000.00);

select * from employee_info;


insert into employee_info (eid, ename, address, department, salary)
values (6, 'Alice Johnson', '987 Birch Ln', 'IT', 72000.00);

ROLLBACK;
select * from employee_info;
insert into employee_info (eid, ename, address, department, salary)
values (7, 'Bob Martin', '543 Spruce Dr', 'Marketing', 58000.00);
COMMIT;
select * from employee_info;

-- Start a transaction
BEGIN TRANSACTION;  -- use start TRANSACTION; in some databases

-- Insert a new employee
INSERT INTO employee_info (eid, ename, address, department, salary)
VALUES (8, 'Jane Smith', '456 Oak St', 'HR', 60000.00);

-- Check the table (you will see Jane Smith temporarily)
SELECT * FROM employee_info;

-- Undo the insert
ROLLBACK;

-- Check again (Jane Smith will be gone)
SELECT * FROM employee_info;
COMMIT;

-- End of script

drop table employee_info;



