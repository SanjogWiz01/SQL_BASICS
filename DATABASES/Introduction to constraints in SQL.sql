-- Active: 1768452168398@@127.0.0.1@3306@mysql
create database IF NOT EXISTS ConstraintsDB;
USE ConstraintsDB;

drop table student_info;

CREATE TABLE student_info (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    admission_date DATE DEFAULT (CURDATE()) /* Sets the default value to the current date */
);

INSERT INTO student_info (student_id, student_name, email, age, gender)
VALUES (101, 'Sabin Thapa', 'sabin@example.com', 20, 'M');

select * from 
student_info;
INSERT INTO student_info (student_id, student_name, email, age, gender)
VALUES (102, 'Anita Gurung', 'anita@example.com', 19, 'F');

CREATE TABLE course (
course_id INT PRIMARY KEY,
course_name VARCHAR(50) NOT NULL
);

INSERT INTO course (course_id, course_name)
VALUES
(1, 'Not specified'),
(2, 'Computer'),
(3, 'Software'),
(4, 'IT'),
(5, 'Civil'),
(6, 'Architecture');

SELECT * FROM course;
/* COMMENT  : Create a table named course and add it as a FOREIGN KEY and DEFAULT constraint
for student_info table*/
ALTER TABLE student_info
ADD COLUMN course_id INT DEFAULT 1;


ALTER TABLE student_info
ADD CONSTRAINT fk_student_course
FOREIGN KEY (course_id) REFERENCES course(course_id);

select * from 
student_info;
-- Try inserting a student with an invalid age to see the CHECK constraint in action
-- This will fail
-- INSERT INTO student_info (student_id, student_name, email, age, gender) 
-- VALUES (103, 'Invalid Age', 'invalid@example.com', 15, 'M');
-- Try inserting a student with a duplicate email to see the UNIQUE constraint in action
-- This will fail

INSERT INTO student_info (student_id, student_name, email, age, gender, course_id)
VALUES (103, 'Sabin Thapa', 'sabin1@example.com', 30, 'M', 2);

SELECT * FROM student_info;

INSERT INTO student_info (student_id, student_name, email, age, gender)
VALUES (104, 'John Doe', 'john@example.com', 25, 'M');

SELECT * FROM student_info;

INSERT INTO student_info (student_id, student_name, email, age, gender, course_id)
VALUES (105, 'John Smith', 'john@example.com', 25, 'N', 9);
SELECT * FROM student_info;
-- This will fail due to UNIQUE constraint on email COMMENT COMMENT
-- This will fail due to CHECK constraint on gender COMMENT COMMENT

INSERT INTO student_info (student_id, student_name, email, age, gender, course_id)
VALUES (105, 'John Smith', 'john1@example.com', 25, 'M', 4);
SELECT * FROM student_info;
-- This will succeed - all constraints are satisfied COMMENT COMMENT-9

drop database IF  EXISTS ConstraintsDB;
show databases;
drop database university;
drop table mysql.student_info;
drop table mysql.course;
