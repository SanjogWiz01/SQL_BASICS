/* every thing will be about function in sql?*

*/
CREATE DATABASE functions_practice;
USE functions_practice;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT,
    dob DATE,
    data JSON
);

INSERT INTO students VALUES
(1,'Sanjog','Pokhara',85,'2005-02-10','{"course":"CS","level":1}'),
(2,'Amit','Kathmandu',78,'2004-06-15','{"course":"IT","level":2}'),
(3,'Bikash','Butwal',92,'2003-11-20','{"course":"Math","level":3}'),
(4,'Sita','Lalitpur',67,'2005-08-05','{"course":"CS","level":1}'),
(5,'Hari','Biratnagar',88,'2004-01-30','{"course":"IT","level":2}'),
(6,'Gita','Pokhara',73,'2003-12-12','{"course":"Stats","level":3}');

SELECT CURRENT_DATE;
SELECT DATE_ADD(dob,INTERVAL 5 DAY) FROM students;
SELECT YEAR(dob),MONTH(dob),DAY(dob) FROM students;

SELECT UPPER(name) FROM students;
SELECT LTRIM(name) FROM students;
SELECT RTRIM(name) FROM students;
SELECT LENGTH(name) FROM students;
SELECT CONCAT(name,'-',city) FROM students;

SELECT marks+5 FROM students;
SELECT ABS(marks-80) FROM students;
SELECT ROUND(AVG(marks),2) FROM students;

SELECT COUNT(*) FROM students;
SELECT MAX(marks) FROM students;
SELECT MIN(marks) FROM students;
SELECT SUM(marks) FROM students;
SELECT AVG(marks) FROM students;

SELECT JSON_EXTRACT(data,'$.course') FROM students;
SELECT JSON_EXTRACT(data,'$.level') FROM students;

SELECT CAST(marks AS CHAR) FROM students;
SELECT CONVERT(dob,CHAR) FROM students;

SELECT CASE 
WHEN marks >= 90 THEN 'Excellent'
WHEN marks >= 75 THEN 'Very Good'
WHEN marks >= 60 THEN 'Good'
ELSE 'Needs Improvement'
END FROM students;

DROP DATABASE functions_practice;
