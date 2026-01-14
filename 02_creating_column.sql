show databases;
create database college;
use college;
create table student(
id int primary key,
name varchar(20),
roll int );
insert into student values(1,"anjog",34);

insert into student
(id,name,roll_no)
values
(106,"pradip",01);
select * from student