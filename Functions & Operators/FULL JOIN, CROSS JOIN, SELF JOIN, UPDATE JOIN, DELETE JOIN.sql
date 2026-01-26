CREATE DATABASE joins;
USE joins_part2;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

CREATE TABLE salaries (
    emp_id INT,
    salary INT
);

INSERT INTO employees VALUES
(1,'Amit Gurung',NULL),
(2,'Rita Shrestha',1),
(3,'Suman Karki',1),
(4,'Bina Lama',2),
(5,'Ramesh Adhikari',2);

INSERT INTO salaries VALUES
(1,90000),
(2,60000),
(3,55000),
(4,45000),
(5,50000);

SELECT e.emp_name, s.salary
FROM employees e
FULL JOIN salaries s
ON e.emp_id = s.emp_id;

SELECT e.emp_name, s.salary
FROM employees e
CROSS JOIN salaries s;

SELECT a.emp_name AS employee, b.emp_name AS manager
FROM employees a
JOIN employees b
ON a.manager_id = b.emp_id;

UPDATE salaries
SET salary = salary + 5000
FROM employees
WHERE salaries.emp_id = employees.emp_id
AND employees.emp_name = 'Rita Shrestha';

DELETE salaries
FROM salaries
JOIN employees
ON salaries.emp_id = employees.emp_id
WHERE employees.emp_name = 'Bina Lama';

DROP TABLE salaries;
DROP TABLE employees;
DROP DATABASE joins;
