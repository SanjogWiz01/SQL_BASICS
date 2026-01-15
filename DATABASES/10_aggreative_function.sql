-- Active: 1766136828156@@127.0.0.1@3306@university
SELECT AVG(salary) AS avg_salary FROM students;

SELECT SUM(salary) AS total_salary FROM students;

SELECT COUNT(Student_id) AS total_students FROM students;

select max(salary) as big_money from students ;
select min(salary) as small_money from students;

SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM students;
