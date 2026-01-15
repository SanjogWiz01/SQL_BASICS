-- Active: 1768452168398@@127.0.0.1@3306@having_clause_db
use having_clause_db;
-- Active: 1768452168398@@
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO employees (emp_name, department, salary, city) VALUES
('Sanjog', 'IT', 60000, 'Pokhara'),
('Bikash', 'IT', 55000, 'Kathmandu'),
('Sita', 'HR', 45000, 'Pokhara'),
('Ramesh', 'Finance', 80000, 'Biratnagar'),
('Gita', 'HR', 48000, 'Butwal'),
('Aarav', 'Finance', 75000, 'Kathmandu'),
('Nabin', 'IT', 62000, 'Lalitpur'),
('Pooja', 'HR', 50000, 'Pokhara'),
('Kiran', 'Finance', 70000, 'Pokhara');

--GROUP BY department
-- Calculates total salary paid in each department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Orders departments by total salary in descending order
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;

--GROUP BY city with ORDER BY
-- Orders cities by average salary in ascending order
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city
ORDER BY average_salary ASC;

SELECT department, city, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY department, city
ORDER BY department ASC, total_employees DESC;

-- Step 10: Cleanup
DROP TABLE employees;
