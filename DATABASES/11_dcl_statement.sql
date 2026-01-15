-- Active: 1766136828156@@127.0.0.1@3306
use cafe;

-- DCL Statements: GRANT, REVOKE
-- GRANT statement: Grants privileges to users
CREATE DATABASE student_management_system;
USE student_management_system;
CREATE TABLE student_info
(sid INT,
name VARCHAR(50),
address VARCHAR(50),
department VARCHAR(50)
);
INSERT INTO student_info (sid, name, address, department)
VALUES
(1,'Daniel', 'pokhara', 'Computer'),
(2,'Dave','kathmandu','IT'),
(3,'Alisha','chitwan','civil'),
(4,'Maya', 'butwal', 'architecture');

SELECT * FROM student_info;

-- Grant SELECT privilege on student_info table to user 'readonly_user'@'localhost'

