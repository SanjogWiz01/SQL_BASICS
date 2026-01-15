drop database employee_management_system;
CREATE DATABASE Employee_management_system;
USE Employee_management_system;
create table employee_info
(eid int,name varchar(50),address varchar(50),
position varchar(50),salary decimal(10,2));
ALTER TABLE employee_info
ADD temp_address varchar(50),
MODIFY COLUMN name VARCHAR(100),
DROP address;
USE Employee_management_system;
INSERT INTO employee_info (eid, name, position, salary, temp_address)
VALUES
(1, 'Sabin', 'Software Engineer', 65000.00, 'pokhara'),
(2, 'Sanjog', 'HR Manager', 72000.00, 'Syangja');
INSERT INTO employee_info (eid, name, position, salary, temp_address)
VALUES
(3, 'Anil Shrestha', 'Software Engineer', 64000.00, 'Kathmandu'),
(4, 'Maya Gurung', 'HR Specialist', 52000.00, 'Pokhara'),
(5, 'Suresh Karki', 'Data Scientist', 78000.00, 'Butwal'),
(6, 'Nisha Adhikari', 'Project Manager', 85000.00, 'Biratnagar'),
(7, 'Prakash Thapa', 'System Administrator', 60000.00, 'Chitwan'),
(8, 'Rita Poudel', 'Business Analyst', 71000.00, 'Dharan'),
(9, 'Kiran Lama', 'UI/UX Designer', 55000.00, 'Hetauda'),
(10, 'Sunita KC', 'Accountant', 48000.00, 'Bhaktapur');
select * from employee_info;
DELETE FROM employee_info WHERE temp_address = 'Chitwan';
SET SQL_SAFE_UPDATES = 0;
drop database employee_management_system;
drop database hoteldb;
show databases;