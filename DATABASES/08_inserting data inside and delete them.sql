-- Active: 1766136828156@@127.0.0.1@3306@university
show databases;
use university;
select * from students;
insert into students
(Student_id,age,first_name,salary)

 VALUES
(2,25,'Shyambaburam',250000);

insert into students
 VALUES
(3,'muskan',32,12000);

update students
set age=27
where Student_id=2;

