-- Active: 1766136828156@@127.0.0.1@3306
USE student_management_system;
select * from student_info;
insert into student_info
values(5,"ram","khf","ugcsdhj");
CREATE USER 'sabin' IDENTIFIED BY 'sabin123';
GRANT SELECT, INSERT, UPDATE ON student_management_system.student_info TO sabin;
