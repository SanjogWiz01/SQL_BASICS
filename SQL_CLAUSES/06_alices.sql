-- Create a database and use it

CREATE DATABASE alias_db;
USE alias_db;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employees (name, salary) VALUES
('Sanjog',60000),
('Bikash',55000),
('Sita',45000);

SELECT name AS employee_name, salary AS monthly_salary
FROM employees;

DROP TABLE employees;
DROP DATABASE alias_db;
