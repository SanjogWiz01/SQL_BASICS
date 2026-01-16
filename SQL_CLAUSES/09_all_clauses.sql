-- Active: 1768452168398@@127.0.0.1@3306@all_clauses_db
CREATE DATABASE all_clauses_db;
USE all_clauses_db;
-- --------------------------------------------------
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT
);
INSERT INTO employees (emp_name, department, city, salary) VALUES
('Sanjog', 'IT', 'Pokhara', 60000),
('Bikash', 'IT', 'Kathmandu', 55000),
('Sita', 'HR', 'Pokhara', 45000),
('Ramesh', 'Finance', 'Biratnagar', 80000),
('Gita', 'HR', 'Butwal', 48000),
('Aarav', 'Finance', 'Kathmandu', 75000),
('Nabin', 'IT', 'Lalitpur', 62000),
('Pooja', 'HR', 'Pokhara', 50000),
('Kiran', 'Finance', 'Pokhara', 70000);


SELECT *
FROM employees
WHERE city = 'Pokhara';

-- --------------------------------------------------
-- DISTINCT Clause
-- --------------------------------------------------
SELECT DISTINCT city
FROM employees;

-- --------------------------------------------------
-- GROUP BY Clause
-- --------------------------------------------------
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- --------------------------------------------------
-- HAVING Clause
-- --------------------------------------------------
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

-- --------------------------------------------------
--  ORDER BY Clause
-- --------------------------------------------------
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC;

-- --------------------------------------------------
--  GROUP BY + ORDER BY Together
-- --------------------------------------------------
SELECT city, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY city
ORDER BY total_employees DESC;

-- --------------------------------------------------
--  LIMIT Clause
-- --------------------------------------------------
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
-- COMMENT FETCH Clause (Standard SQL)
-- --------------------------------------------------
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 2 ROWS ONLY;

-- --------------------------------------------------
--  Aliases
-- --------------------------------------------------
SELECT 
    emp_name AS employee_name,
    salary AS monthly_salary
FROM employees;

-- --------------------------------------------------
--  WITH Clause (CTE)
-- --------------------------------------------------
WITH high_salary_employees AS (
    SELECT emp_name, department, salary
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary_employees
ORDER BY salary DESC;

-- --------------------------------------------------
--  Cleanup
-- --------------------------------------------------
DROP TABLE employees;
DROP DATABASE all_clauses_db;
