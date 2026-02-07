-- create a index--
CREATE INDEX idx_employees_department
ON employees(department);

SELECT emp_name, salary
FROM employees
WHERE department = 'IT';  ALTER




CREATE INDEX idx ON
 Students(NAME);

--Creating a Unique Index
CREATE UNIQUE INDEX idx_student_id ON
 Students(student_id);