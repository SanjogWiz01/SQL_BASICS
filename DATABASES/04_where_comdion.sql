use university;
select * from students;
select * from students where last_name = 'Doe' AND first_name = 'John';
select * from students where date_of_birth < '2000-01-01' OR first_name = 'Alice';
select * from students where (last_name = 'Smith' OR last_name = 'Johnson') AND date_of_birth > '1999-12-31';
select * from students where first_name = 'Jane' OR (last_name = 'Johnson' AND date_of_birth < '2002-01-01');
