-- this contain right and inner joins
CREATE DATABASE joins_part1;
USE joins_part1;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50)
);  --students table

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    student_id INT
);
 --courses table
INSERT INTO students VALUES
(1,'Ram Sharma','Kathmandu'),
(2,'Sita Khadka','Pokhara'),
(3,'Bishal Thapa','Butwal'),
(4,'Nisha Rai','Dharan'),
(5,'Hari Pokhrel','Lalitpur');

INSERT INTO courses VALUES
(101,'Database',1),
(102,'Python',2),
(103,'Networking',3),
(104,'AI',1),
(105,'Security',6);

SELECT students.student_name, courses.course_name
FROM students
JOIN courses
ON students.student_id = courses.student_id;  --inner join

SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN courses
ON students.student_id = courses.student_id; --left join

SELECT students.student_name, courses.course_name
FROM students
RIGHT JOIN courses
ON students.student_id = courses.student_id; --right join

DROP TABLE courses;
DROP TABLE students;
DROP DATABASE joins_part1;
