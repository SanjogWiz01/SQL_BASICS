CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;

create view sanjog as SELECT age,rollno from students where age < 35 ;


CREATE VIEW top_students AS
SELECT name, grade
FROM Students
WHERE marks > 80;