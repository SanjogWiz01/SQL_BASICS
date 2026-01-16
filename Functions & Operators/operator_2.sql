/* Operators covered

NOT EQUAL Operator

IS NULL Operator

BETWEEN Operator

UNION Operator

UNION ALL Operator

*/
CREATE DATABASE operators_part2_db;
USE operators_part2_db;

CREATE TABLE employees_1 (
    id INT,
    name VARCHAR(50),
    salary INT
);

CREATE TABLE employees_2 (
    id INT,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employees_1 VALUES
(1,'Sanjog',60000),
(2,'Bikash',NULL),
(3,'Sita',45000),
(4,'Ramesh',80000);

INSERT INTO employees_2 VALUES
(5,'Gita',48000),
(6,'Aarav',75000),
(3,'Sita',45000),
(7,'Nabin',62000);

SELECT * FROM employees_1
WHERE salary <> 60000;

SELECT * FROM employees_1
WHERE salary IS NULL;

SELECT * FROM employees_1
WHERE salary BETWEEN 45000 AND 80000;

SELECT name FROM employees_1
UNION
SELECT name FROM employees_2;

SELECT name FROM employees_1
UNION ALL
SELECT name FROM employees_2;

DROP TABLE employees_1;
DROP TABLE employees_2;
DROP DATABASE operators_part2_db;
