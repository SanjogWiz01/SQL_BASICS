create DATABASE university;
use university;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);
insert into students (first_name, last_name, date_of_birth) values
('John', 'Doe', '2000-01-15'),
('Jane', 'Smith', '1999-05-23'),
('Alice', 'Johnson', '2001-07-30');
select * from students;