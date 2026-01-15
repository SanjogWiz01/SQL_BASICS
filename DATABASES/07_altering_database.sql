-- Active: 1766136828156@@127.0.0.1@3306@university
use university;
ALTER TABLE students
DROP COLUMN address;

alter table students
drop column salary;
ALTER TABLE students
drop column date_of_birth,
column last_name;


-- Drop multiple columns in a single statement i have adeed salary here
--using add column salry dacimal(10,2) not null after first_name;

delete from students where student_id=3;

UPDATE students
SET salary = 20000
WHERE student_id = 1;
