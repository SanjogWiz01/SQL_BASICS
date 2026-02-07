-- Active: 1768452168398@@127.0.0.1@3306@having_clause_db

drop DATABASE If EXISTS having_claude_db;
CREATE DATABASE view_demo_db;

USE view_demo_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    department VARCHAR(50),
    age INT,
    marks INT
); 

INSERT INTO students VALUES
(1, 'Sanjog', 'Pokhara', 'Computer', 19, 78),
(2, 'Ramesh', 'Kathmandu', 'Computer', 20, 82),
(3, 'Suresh', 'Butwal', 'Civil', 21, 69),
(4, 'Bikash', 'Biratnagar', 'Computer', 19, 74),
(5, 'Nabin', 'Chitwan', 'Electrical', 22, 65),
(6, 'Aashish', 'Pokhara', 'Computer', 20, 88),
(7, 'Prakash', 'Dharan', 'Civil', 21, 71),
(8, 'Rabin', 'Kathmandu', 'Electrical', 23, 60),
(9, 'Dipesh', 'Pokhara', 'Computer', 19, 91),
(10, 'Kiran', 'Hetauda', 'Civil', 22, 67),
(11, 'Manish', 'Birgunj', 'Computer', 20, 76),
(12, 'Rojan', 'Lalitpur', 'Electrical', 21, 72),
(13, 'Suman', 'Bhaktapur', 'Computer', 22, 85),
(14, 'Anish', 'Pokhara', 'Civil', 19, 63),
(15, 'Bimal', 'Butwal', 'Computer', 21, 79),
(16, 'Niraj', 'Kathmandu', 'Electrical', 23, 68),
(17, 'Roshan', 'Chitwan', 'Computer', 20, 84),
(18, 'Arjun', 'Dhangadhi', 'Civil', 22, 66),
(19, 'Suraj', 'Itahari', 'Computer', 21, 73),
(20, 'Amit', 'Janakpur', 'Electrical', 23, 70),
(21, 'Prabin', 'Pokhara', 'Computer', 19, 89),
(22, 'Sagar', 'Biratnagar', 'Civil', 22, 62),
(23, 'Deepak', 'Kathmandu', 'Computer', 20, 81),
(24, 'Nitesh', 'Hetauda', 'Electrical', 21, 75),
(25, 'Umesh', 'Butwal', 'Computer', 22, 77),
(26, 'Hari', 'Chitwan', 'Civil', 23, 64),
(27, 'Gopal', 'Pokhara', 'Computer', 20, 86),
(28, 'Milan', 'Dharan', 'Electrical', 21, 71),
(29, 'Raju', 'Itahari', 'Computer', 22, 80),
(30, 'Bibek', 'Kathmandu', 'Civil', 19, 68);

CREATE VIEW computer_students AS
SELECT student_id, name, city, marks
FROM students
WHERE department = 'Computer';  

SELECT * FROM computer_students; /* viewing a view is same as viewing am sqk*/


UPDATE computer_students
SET marks = 95
WHERE student_id = 1;

SELECT * FROM computer_students;

RENAME TABLE computer_students TO cs_students_view;

SELECT * FROM cs_students_view;    

DROP VIEW cs_students_view;  /* droping an view */

DROP TABLE students;

DROP DATABASE view_demo_db;
