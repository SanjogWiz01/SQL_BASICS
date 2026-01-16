-- Create database
CREATE DATABASE aggregate_functions_db;
USE aggregate_functions_db;

-- Create table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'Amit', 'IT', 60000),
(2, 'Sita', 'HR', 45000),
(3, 'Ramesh', 'IT', 70000),
(4, 'Gita', 'Finance', 50000),
(5, 'Hari', 'HR', 48000);

-- =====================================================
-- COUNT() FUNCTION
-- Counts total number of rows
-- =====================================================
SELECT COUNT(*) AS total_employees
FROM employees;

-- Count employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- =====================================================
-- SUM() FUNCTION
-- Calculates total salary
-- =====================================================
SELECT SUM(salary) AS total_salary
FROM employees;

-- Total salary by department
SELECT department, SUM(salary) AS department_salary
FROM employees
GROUP BY department;

-- =====================================================
-- MIN() FUNCTION
-- Finds lowest salary
-- =====================================================
SELECT MIN(salary) AS minimum_salary
FROM employees;

-- Minimum salary by department
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- =====================================================
-- MAX() FUNCTION
-- Finds highest salary
-- =====================================================
SELECT MAX(salary) AS maximum_salary
FROM employees;

-- Maximum salary by department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

-- =====================================================
-- AVG() FUNCTION
-- Calculates average salary
-- =====================================================
SELECT AVG(salary) AS average_salary
FROM employees;

-- Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- =====================================================
-- Cleanup
-- =====================================================
DROP DATABASE aggregate_functions_db;
