/* Operators covered

Logical Operators

LIKE Operator

IN Operator

NOT Operator*/
CREATE DATABASE operators_part1_db;
USE operators_part1_db;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

INSERT INTO students (name, city, marks) VALUES
('Sanjog','Pokhara',78),
('Bikash','Kathmandu',65),
('Sita','Pokhara',82),
('Ramesh','Butwal',55),
('Gita','Lalitpur',90),
('Aarav','Kathmandu',72);

SELECT * FROM students
WHERE city = 'Pokhara' AND marks > 70;

SELECT * FROM students
WHERE city = 'Kathmandu' OR marks > 80;

SELECT * FROM students
WHERE name LIKE 'S%';

SELECT * FROM students
WHERE city IN ('Pokhara','Butwal');

SELECT * FROM students
WHERE NOT city = 'Kathmandu';

DROP TABLE students;
DROP DATABASE operators_part1_db;
