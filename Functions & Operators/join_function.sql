/* you will learn here SQL Joins
JOIN
Outer Join
Left Join
Right Join
Full Join
Cross Join
Self Join
UPDATE with JOIN
DELETE JOIN
Recursive Join
*/

CREATE DATABASE joins_practice;
USE joins_practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1,'Sanjog',1,NULL,50000),
(2,'Amit',2,1,45000),
(3,'Bikash',1,1,40000),
(4,'Nabin',3,2,42000),
(5,'Ramesh',2,2,48000),
(6,'Sita',3,4,39000),
(7,'Gita',1,3,47000),
(8,'Hari',2,5,36000);

INSERT INTO departments VALUES
(1,'IT'),
(2,'Finance'),
(3,'HR'),
(4,'Admin');

SELECT emp_name,dept_name FROM employees JOIN departments ON employees.dept_id = departments.dept_id;

SELECT emp_name,dept_name FROM employees INNER JOIN departments ON employees.dept_id = departments.dept_id;

SELECT emp_name,dept_name FROM employees LEFT JOIN departments ON employees.dept_id = departments.dept_id;

SELECT emp_name,dept_name FROM employees RIGHT JOIN departments ON employees.dept_id = departments.dept_id;

SELECT emp_name,dept_name FROM employees FULL JOIN departments ON employees.dept_id = departments.dept_id;

SELECT emp_name,dept_name FROM employees CROSS JOIN departments;

SELECT e1.emp_name,e2.emp_name FROM employees e1 JOIN employees e2 ON e1.manager_id = e2.emp_id;

UPDATE employees e JOIN departments d ON e.dept_id = d.dept_id SET e.salary = e.salary + 2000 WHERE d.dept_name = 'IT';

DELETE e FROM employees e JOIN departments d ON e.dept_id = d.dept_id WHERE d.dept_name = 'Admin';

WITH RECURSIVE emp_tree AS (
SELECT emp_id,emp_name,manager_id FROM employees WHERE manager_id IS NULL
UNION ALL
SELECT e.emp_id,e.emp_name,e.manager_id FROM employees e JOIN emp_tree t ON e.manager_id = t.emp_id
)
SELECT * FROM emp_tree;

DROP DATABASE joins_practice;
