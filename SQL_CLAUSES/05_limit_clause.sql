-- Create a database and use it

CREATE DATABASE limit_clause_db;
USE limit_clause_db;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students (name, marks) VALUES
('Sanjog',90),
('Bikash',85),
('Sita',80),
('Ramesh',95),
('Gita',70),
('Aarav',88);

SELECT * FROM students
ORDER BY marks DESC
LIMIT 3;

DROP TABLE students;
DROP DATABASE limit_clause_db;
