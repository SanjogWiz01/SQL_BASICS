-- Active: 1768452168398@@127.0.0.1@3306@where_clause_db
CREATE DATABASE where_clause_db;
USE where_clause_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    marks INT
);

INSERT INTO students (name, age, city, marks) VALUES
('Sanjog', 20, 'Pokhara', 78),
('Aarav', 22, 'Kathmandu', 65),
('Bikash', 19, 'Butwal', 88),
('Sita', 21, 'Pokhara', 55),
('Ramesh', 23, 'Biratnagar', 92),
('Gita', 20, 'Lalitpur', 70);

select * from students;

SELECT * FROM students
WHERE city = 'Pokhara';

SELECT * FROM students
WHERE marks > 70;

SELECT * FROM students
WHERE age < 22 AND marks >= 65;

SELECT * FROM students
WHERE city = 'Kathmandu' OR city = 'Butwal';

SELECT * FROM students
WHERE marks BETWEEN 60 AND 80;

SELECT * FROM students
WHERE name LIKE 'S%';

DROP TABLE students;
DROP DATABASE where_clause_db;