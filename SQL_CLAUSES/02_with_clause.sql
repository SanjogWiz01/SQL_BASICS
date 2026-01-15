-- Create a sample database and table for demonstration

CREATE DATABASE with_clause_db;
USE with_clause_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (name, department, salary) VALUES
('Sanjog', 'IT', 60000),
('Bikash', 'HR', 45000),
('Sita', 'IT', 70000),
('Ramesh', 'Finance', 80000),
('Gita', 'HR', 50000),
('Aarav', 'Finance', 75000);

-- WITH clause to create temporary result
WITH high_salary AS (
    SELECT name, department, salary
    FROM employees
    WHERE salary > 60000
)

SELECT * FROM high_salary;

-- Another WITH example
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT * FROM dept_avg;

DROP TABLE employees;
DROP DATABASE with_clause_db;
