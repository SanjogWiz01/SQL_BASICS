-- Active: 1766136828156@@127.0.0.1@3306@employee
select * from employee_info;

-- updating the data of employee_info table
BEGIN  TRANSACTION;
update employee_info 
set address = 'New York' 
where ename='John Doe';

ROLLBACK;
COMMIT;

delete from employee_info
where department='IT';

ROLLBACK;
COMMIT;
begin transaction;  -- failed to run we use start transaction instead 
delete from employee_info
where department='HR';
ROLLBACK;  -- undo the delete operation doing the back undo operation 
COMMIT  -- we cannot change data after doing commit so its a fix point here    ADDITIONAL NOTES:
-- Transaction Control Language (TCL) commands are used to manage the changes made by DML statements. 
-- It allows statements to be grouped together into logical transactions.
-- The main TCL commands are COMMIT, ROLLBACK, and SAVEPOINT.
;
begin TRANSACTION;
delete from employee_info
where department='sales';
ROLLBACK;
COMMIT;








