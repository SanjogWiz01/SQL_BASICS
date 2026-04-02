-- ============================================================================
-- SQL COMPLETE CODING GUIDE FOR DBMS EXAM
-- ============================================================================
-- This file contains practical SQL code examples for all topics
-- Copy and paste into your database management system to test
-- ============================================================================

-- ============================================================================
-- 1. DDL (DATA DEFINITION LANGUAGE) - CREATE, ALTER, DROP, TRUNCATE
-- ============================================================================

-- Drop existing tables (for fresh start)
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

-- Create Database
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

-- ============================================================================
-- 1.1 CREATE TABLES
-- ============================================================================

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    Building VARCHAR(50),
    Budget DECIMAL(10, 2) DEFAULT 100000.00,
    HeadOfDepartment VARCHAR(100)
);

-- Create Students Table with constraints
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    DateOfBirth DATE,
    GPA FLOAT DEFAULT 0.0 CHECK (GPA >= 0.0 AND GPA <= 4.0),
    DepartmentID INT,
    EnrollmentDate DATE DEFAULT CURDATE(),
    Status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    Credits INT CHECK (Credits > 0 AND Credits <= 4),
    Semester VARCHAR(10),
    InstructorName VARCHAR(100),
    MaxCapacity INT DEFAULT 30
);

-- Create Enrollments Table (Junction Table)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE DEFAULT CURDATE(),
    Grade VARCHAR(2),
    Status VARCHAR(20) DEFAULT 'Enrolled',
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- ============================================================================
-- 1.2 ALTER TABLE - Modify structure
-- ============================================================================

-- Add a new column
ALTER TABLE Students ADD Address VARCHAR(200);

-- Modify a column (increase size)
ALTER TABLE Departments MODIFY DepartmentName VARCHAR(150);

-- Add a constraint
ALTER TABLE Students ADD CONSTRAINT chk_email CHECK (Email LIKE '%@%.%');

-- Drop a column
-- ALTER TABLE Students DROP COLUMN Address;

-- Rename a column
ALTER TABLE Students CHANGE COLUMN Email StudentEmail VARCHAR(100);

-- Rename a table
-- ALTER TABLE Students RENAME TO StudentRecords;

-- ============================================================================
-- 1.3 TRUNCATE vs DELETE
-- ============================================================================

-- TRUNCATE (Faster, removes all data, resets identity)
-- TRUNCATE TABLE Students;

-- DELETE (Slower, but can use WHERE clause)
-- DELETE FROM Students WHERE GPA < 2.0;

-- ============================================================================
-- 2. DML (DATA MANIPULATION LANGUAGE) - INSERT, SELECT, UPDATE, DELETE
-- ============================================================================

-- ============================================================================
-- 2.1 INSERT - Add data
-- ============================================================================

-- Insert single record
INSERT INTO Departments (DepartmentName, Building, Budget, HeadOfDepartment)
VALUES ('Computer Science', 'Building A', 500000, 'Dr. Smith');

-- Insert multiple records at once
INSERT INTO Departments (DepartmentName, Building, HeadOfDepartment) VALUES
    ('Information Technology', 'Building B', 'Dr. Johnson'),
    ('Engineering', 'Building C', 'Dr. Williams'),
    ('Business', 'Building D', 'Dr. Brown');

-- Insert with DEFAULT values
INSERT INTO Students (FirstName, LastName, StudentEmail, DepartmentID)
VALUES ('John', 'Doe', 'john.doe@university.edu', 1);

-- Multiple student inserts
INSERT INTO Students (FirstName, LastName, StudentEmail, GPA, DepartmentID, DateOfBirth) VALUES
    ('Alice', 'Smith', 'alice.smith@university.edu', 3.8, 1, '2003-05-15'),
    ('Bob', 'Johnson', 'bob.johnson@university.edu', 3.2, 2, '2002-08-22'),
    ('Carol', 'Williams', 'carol.williams@university.edu', 3.9, 1, '2003-03-10'),
    ('David', 'Brown', 'david.brown@university.edu', 3.5, 3, '2002-11-30'),
    ('Eva', 'Davis', 'eva.davis@university.edu', 2.8, 2, '2004-01-12'),
    ('Frank', 'Miller', 'frank.miller@university.edu', 3.4, 1, '2003-07-18'),
    ('Grace', 'Wilson', 'grace.wilson@university.edu', 3.7, 3, '2002-09-05');

-- Insert courses
INSERT INTO Courses (CourseName, CourseCode, Credits, Semester, InstructorName, MaxCapacity) VALUES
    ('Database Management', 'CS101', 3, 'Spring', 'Dr. Smith', 40),
    ('Web Development', 'CS102', 3, 'Spring', 'Dr. Johnson', 35),
    ('Data Structures', 'CS103', 4, 'Fall', 'Dr. Smith', 30),
    ('Advanced SQL', 'CS104', 3, 'Fall', 'Dr. Williams', 25),
    ('Operating Systems', 'CS105', 4, 'Spring', 'Dr. Brown', 35);

-- Insert enrollments
INSERT INTO Enrollments (StudentID, CourseID, Grade, Status) VALUES
    (1, 1, 'A', 'Completed'),
    (1, 2, 'B', 'Completed'),
    (2, 1, 'A', 'Completed'),
    (3, 1, 'A', 'Completed'),
    (3, 4, 'A', 'Enrolled'),
    (4, 2, 'B', 'Completed'),
    (4, 5, 'B', 'Enrolled'),
    (5, 1, 'C', 'Completed'),
    (6, 3, 'B', 'Enrolled'),
    (7, 4, 'A', 'Enrolled');

-- ============================================================================
-- 2.2 SELECT - Retrieve data
-- ============================================================================

-- Basic SELECT
SELECT * FROM Students;

-- Select specific columns
SELECT FirstName, LastName, GPA FROM Students;

-- SELECT with alias
SELECT FirstName AS 'First Name', LastName AS 'Last Name', GPA FROM Students;

-- SELECT DISTINCT (remove duplicates)
SELECT DISTINCT DepartmentID FROM Students;

-- Count all records
SELECT COUNT(*) AS TotalStudents FROM Students;

-- ============================================================================
-- 2.3 WHERE CLAUSE - Filter data
-- ============================================================================

-- Equality
SELECT * FROM Students WHERE DepartmentID = 1;

-- Comparison operators
SELECT * FROM Students WHERE GPA > 3.5;
SELECT * FROM Students WHERE GPA >= 3.0;
SELECT * FROM Students WHERE GPA < 3.0;
SELECT * FROM Students WHERE Status != 'Active';

-- BETWEEN (range)
SELECT * FROM Students WHERE GPA BETWEEN 3.0 AND 3.8;

-- IN (multiple values)
SELECT * FROM Students WHERE StudentID IN (1, 3, 5, 7);

-- LIKE (pattern matching)
SELECT * FROM Students WHERE FirstName LIKE 'J%';        -- Starts with J
SELECT * FROM Students WHERE LastName LIKE '%son';       -- Ends with son
SELECT * FROM Students WHERE StudentEmail LIKE '%@university%';  -- Contains specific domain

-- AND / OR / NOT operators
SELECT * FROM Students WHERE GPA > 3.5 AND DepartmentID = 1;
SELECT * FROM Students WHERE GPA > 3.7 OR DepartmentID = 2;
SELECT * FROM Students WHERE NOT (GPA < 2.0);

-- NULL checking
SELECT * FROM Students WHERE Phone IS NULL;
SELECT * FROM Students WHERE Phone IS NOT NULL;

-- ============================================================================
-- 2.4 ORDER BY - Sort results
-- ============================================================================

-- Sort ascending (default)
SELECT * FROM Students ORDER BY GPA ASC;

-- Sort descending
SELECT * FROM Students ORDER BY GPA DESC;

-- Sort by multiple columns
SELECT * FROM Students ORDER BY GPA DESC, FirstName ASC;

-- Sort by column position
SELECT FirstName, LastName, GPA FROM Students ORDER BY 3 DESC;

-- ============================================================================
-- 3. AGGREGATE FUNCTIONS
-- ============================================================================

-- COUNT - Count non-NULL values
SELECT COUNT(StudentID) AS TotalStudents FROM Students;
SELECT COUNT(*) AS AllRecords FROM Students;

-- SUM - Sum numeric values
SELECT SUM(Credits) AS TotalCredits FROM Courses;

-- AVG - Average value
SELECT AVG(GPA) AS AverageGPA FROM Students;

-- MAX / MIN
SELECT MAX(GPA) AS HighestGPA, MIN(GPA) AS LowestGPA FROM Students;

-- GROUP BY - Group results
SELECT DepartmentID, COUNT(*) AS StudentCount, AVG(GPA) AS AvgGPA
FROM Students
GROUP BY DepartmentID;

-- HAVING - Filter groups
SELECT DepartmentID, COUNT(*) AS StudentCount, AVG(GPA) AS AvgGPA
FROM Students
GROUP BY DepartmentID
HAVING COUNT(*) > 2 AND AVG(GPA) > 3.0;

-- Complex aggregation
SELECT 
    c.CourseName,
    COUNT(e.StudentID) AS EnrolledStudents,
    AVG(CAST(CASE WHEN e.Grade = 'A' THEN 4
                  WHEN e.Grade = 'B' THEN 3
                  WHEN e.Grade = 'C' THEN 2
                  WHEN e.Grade = 'D' THEN 1
                  ELSE 0 END AS FLOAT)) AS AvgGrade
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;

-- ============================================================================
-- 4. STRING FUNCTIONS
-- ============================================================================

-- CONCAT - Concatenate strings
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Students;

-- UPPER / LOWER - Case conversion
SELECT UPPER(FirstName) AS NameUpper, LOWER(StudentEmail) AS EmailLower FROM Students;

-- LENGTH - String length
SELECT FirstName, LENGTH(FirstName) AS NameLength FROM Students;

-- SUBSTRING - Extract part of string
SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS FirstThreeChars FROM Students;

-- TRIM - Remove spaces
SELECT TRIM(FirstName) FROM Students;

-- REPLACE - Replace text
SELECT REPLACE(StudentEmail, '@university.edu', '@newemail.com') AS NewEmail FROM Students;

-- CONCAT with functions
SELECT CONCAT(UPPER(FirstName), ' ', UPPER(LastName)) AS FullNameUpper FROM Students;

-- ============================================================================
-- 5. NUMERIC FUNCTIONS
-- ============================================================================

-- ABS - Absolute value
SELECT ABS(-5) AS AbsoluteValue;
SELECT GPA, ABS(GPA - 3.5) AS DifferenceFromTarget FROM Students;

-- ROUND - Round to decimal places
SELECT GPA, ROUND(GPA, 1) AS RoundedGPA FROM Students;

-- CEIL / FLOOR - Round up/down
SELECT CEIL(GPA) AS RoundedUp, FLOOR(GPA) AS RoundedDown FROM Students;

-- POWER - Exponentiation
SELECT POWER(2, 3) AS TwoToThird;

-- ============================================================================
-- 6. DATE FUNCTIONS
-- ============================================================================

-- NOW / CURDATE / CURTIME
SELECT NOW() AS CurrentDateTime;
SELECT CURDATE() AS Today;

-- YEAR / MONTH / DAY - Extract parts
SELECT FirstName, DateOfBirth, YEAR(DateOfBirth) AS BirthYear FROM Students;

-- DATE_ADD - Add interval
SELECT CURDATE() AS Today, DATE_ADD(CURDATE(), INTERVAL 7 DAY) AS OneWeekLater;

-- DATEDIFF - Calculate difference in days
SELECT FirstName, DATEDIFF(CURDATE(), DateOfBirth) AS AgeDays FROM Students;

-- DATE_FORMAT - Format date
SELECT FirstName, DATE_FORMAT(DateOfBirth, '%d/%m/%Y') AS DOB_Formatted FROM Students;

-- ============================================================================
-- 7. JOINS - Combine data from multiple tables
-- ============================================================================

-- ============================================================================
-- 7.1 INNER JOIN - Only matching records
-- ============================================================================

SELECT 
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName
FROM Students s
INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID;

-- Multiple INNER JOINs
SELECT 
    s.FirstName,
    s.LastName,
    c.CourseName,
    e.Grade,
    d.DepartmentName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID
ORDER BY s.LastName;

-- ============================================================================
-- 7.2 LEFT JOIN - All from left table + matched from right
-- ============================================================================

SELECT 
    s.FirstName,
    s.LastName,
    c.CourseName,
    COALESCE(e.Grade, 'Not Enrolled') AS Grade
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY s.FirstName;

-- Find students NOT enrolled in any course
SELECT s.FirstName, s.LastName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.EnrollmentID IS NULL;

-- ============================================================================
-- 7.3 RIGHT JOIN - All from right table + matched from left
-- ============================================================================

SELECT 
    COALESCE(CONCAT(s.FirstName, ' ', s.LastName), 'No Student') AS StudentName,
    c.CourseName
FROM Students s
RIGHT JOIN Enrollments e ON s.StudentID = e.StudentID
RIGHT JOIN Courses c ON e.CourseID = c.CourseID;

-- ============================================================================
-- 7.4 NATURAL JOIN - Automatic join on same column names
-- ============================================================================

-- Be careful with NATURAL JOIN - it joins on columns with same name
SELECT *
FROM Students
NATURAL JOIN Enrollments;

-- Equivalent to:
SELECT *
FROM Students
INNER JOIN Enrollments USING (StudentID);

-- ============================================================================
-- 7.5 CROSS JOIN - Cartesian product
-- ============================================================================

-- Combine each student with each course (not practical, just for example)
SELECT 
    s.FirstName, 
    s.LastName, 
    c.CourseName
FROM Students s
CROSS JOIN Courses c
LIMIT 10;

-- ============================================================================
-- 7.6 SELF JOIN - Join table with itself
-- ============================================================================

-- Find all pairs of students from same department
SELECT 
    a.FirstName AS Student1,
    b.FirstName AS Student2,
    d.DepartmentName
FROM Students a
INNER JOIN Students b ON a.DepartmentID = b.DepartmentID 
    AND a.StudentID < b.StudentID
INNER JOIN Departments d ON a.DepartmentID = d.DepartmentID;

-- ============================================================================
-- 7.7 FULL OUTER JOIN (Using UNION for MySQL compatibility)
-- ============================================================================

SELECT 
    s.FirstName,
    d.DepartmentName
FROM Students s
LEFT JOIN Departments d ON s.DepartmentID = d.DepartmentID
UNION
SELECT 
    s.FirstName,
    d.DepartmentName
FROM Students s
RIGHT JOIN Departments d ON s.DepartmentID = d.DepartmentID;

-- ============================================================================
-- 8. SET OPERATIONS
-- ============================================================================

-- ============================================================================
-- 8.1 UNION - Combine results, remove duplicates
-- ============================================================================

SELECT FirstName AS Name FROM Students
UNION
SELECT DepartmentName FROM Departments;

-- Get StudentIDs enrolled in CS101 or CS102
SELECT DISTINCT StudentID FROM Enrollments WHERE CourseID = 1
UNION
SELECT DISTINCT StudentID FROM Enrollments WHERE CourseID = 2;

-- ============================================================================
-- 8.2 UNION ALL - Combine results, include duplicates
-- ============================================================================

SELECT FirstName FROM Students WHERE GPA > 3.5
UNION ALL
SELECT FirstName FROM Students WHERE GPA < 3.0;

-- ============================================================================
-- 8.3 INTERSECT - Only rows in both queries
-- ============================================================================

-- Students enrolled in BOTH CS101 and CS102
SELECT StudentID FROM Enrollments WHERE CourseID = 1
INTERSECT
SELECT StudentID FROM Enrollments WHERE CourseID = 2;

-- ============================================================================
-- 8.4 EXCEPT / MINUS - Rows in first but not in second
-- ============================================================================

-- Students enrolled in CS101 but not CS102
SELECT StudentID FROM Enrollments WHERE CourseID = 1
EXCEPT
SELECT StudentID FROM Enrollments WHERE CourseID = 2;

-- ============================================================================
-- 9. NULL VALUE HANDLING
-- ============================================================================

-- IS NULL
SELECT * FROM Students WHERE Phone IS NULL;

-- IS NOT NULL
SELECT * FROM Students WHERE Phone IS NOT NULL;

-- COALESCE - Return first non-NULL value
SELECT 
    FirstName,
    COALESCE(Phone, 'Not Provided') AS Phone,
    COALESCE(Address, 'Address Not Available') AS Address
FROM Students;

-- IFNULL (MySQL specific)
SELECT FirstName, IFNULL(Phone, 'N/A') AS Phone FROM Students;

-- NULLIF - Return NULL if two values are equal
SELECT FirstName, NULLIF(GPA, 4.0) AS GPAOrNull FROM Students;

-- Check NULL in aggregate functions
SELECT 
    COUNT(*) AS AllRecords,
    COUNT(Phone) AS RecordsWithPhone,
    COUNT(DISTINCT DepartmentID) AS Departments,
    AVG(GPA) AS AvgGPA
FROM Students;

-- ============================================================================
-- 10. DATA MODIFICATION
-- ============================================================================

-- ============================================================================
-- 10.1 UPDATE - Modify existing records
-- ============================================================================

-- Update single column
UPDATE Students
SET GPA = 3.8
WHERE StudentID = 1;

-- Update multiple columns
UPDATE Students
SET GPA = 3.5, Status = 'Inactive'
WHERE DepartmentID = 2;

-- Update with calculation
UPDATE Students
SET GPA = GPA * 1.05
WHERE DepartmentID = 1 AND GPA < 3.0;

-- Update from another table
UPDATE Students
SET DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science')
WHERE FirstName = 'John';

-- Conditional update
UPDATE Enrollments
SET Grade = 'A'
WHERE StudentID = 1 AND CourseID = 1;

-- ============================================================================
-- 10.2 DELETE - Remove records
-- ============================================================================

-- Delete specific record
DELETE FROM Students WHERE StudentID = 8;

-- Delete with condition
DELETE FROM Enrollments WHERE Grade IS NULL;

-- Delete multiple records
DELETE FROM Enrollments
WHERE StudentID IN (1, 2, 3);

-- Delete with complex condition
DELETE FROM Students
WHERE GPA < 2.0 AND Status = 'Inactive';

-- Safe delete with backup
-- INSERT INTO StudentBackup SELECT * FROM Students WHERE GPA < 2.0;
-- DELETE FROM Students WHERE GPA < 2.0;

-- ============================================================================
-- 10.3 INSERT ... SELECT - Copy data
-- ============================================================================

-- Create backup table first
CREATE TABLE StudentBackup LIKE Students;

-- Copy data from one table to another
INSERT INTO StudentBackup
SELECT * FROM Students WHERE GPA > 3.5;

-- ============================================================================
-- 11. SUBQUERIES
-- ============================================================================

-- Subquery in WHERE clause
SELECT * FROM Students
WHERE GPA > (SELECT AVG(GPA) FROM Students);

-- Subquery in FROM clause (derived table)
SELECT HighPerformers.FirstName, HighPerformers.GPA
FROM (
    SELECT FirstName, GPA FROM Students WHERE GPA > 3.5
) AS HighPerformers;

-- Subquery with IN
SELECT * FROM Courses
WHERE CourseID IN (
    SELECT CourseID FROM Enrollments WHERE Grade = 'A'
);

-- Correlated subquery
SELECT s1.FirstName, s1.GPA
FROM Students s1
WHERE s1.GPA > (
    SELECT AVG(GPA) FROM Students s2 WHERE s2.DepartmentID = s1.DepartmentID
);

-- EXISTS subquery
SELECT * FROM Students s
WHERE EXISTS (
    SELECT 1 FROM Enrollments e WHERE e.StudentID = s.StudentID AND e.Grade = 'A'
);

-- ============================================================================
-- 12. VIEWS - Virtual tables
-- ============================================================================

-- ============================================================================
-- 12.1 CREATE VIEW
-- ============================================================================

-- Simple view
CREATE VIEW HighPerformingStudents AS
SELECT StudentID, FirstName, LastName, GPA
FROM Students
WHERE GPA > 3.7;

-- Query the view
SELECT * FROM HighPerformingStudents;

-- Complex view with JOINs
CREATE VIEW StudentEnrollmentDetails AS
SELECT 
    s.StudentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    c.CourseName,
    e.Grade,
    e.EnrollmentDate,
    d.DepartmentName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
INNER JOIN Departments d ON s.DepartmentID = d.DepartmentID;

-- Query complex view
SELECT * FROM StudentEnrollmentDetails WHERE Grade = 'A';

-- View with aggregation
CREATE VIEW DepartmentStatistics AS
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT s.StudentID) AS TotalStudents,
    AVG(s.GPA) AS AverageGPA,
    MAX(s.GPA) AS HighestGPA,
    MIN(s.GPA) AS LowestGPA
FROM Departments d
LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Query aggregation view
SELECT * FROM DepartmentStatistics WHERE TotalStudents > 0;

-- ============================================================================
-- 12.2 ALTER VIEW
-- ============================================================================

ALTER VIEW HighPerformingStudents AS
SELECT StudentID, FirstName, LastName, GPA, DepartmentID
FROM Students
WHERE GPA > 3.6;

-- ============================================================================
-- 12.3 DROP VIEW
-- ============================================================================

DROP VIEW IF EXISTS StudentEnrollmentDetails;

-- ============================================================================
-- 13. STORED PROCEDURES
-- ============================================================================

-- ============================================================================
-- 13.1 Simple Stored Procedure (No Parameters)
-- ============================================================================

DELIMITER //

CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM Students;
END //

DELIMITER ;

-- Call procedure
-- CALL GetAllStudents();

-- ============================================================================
-- 13.2 Stored Procedure with INPUT Parameter
-- ============================================================================

DELIMITER //

CREATE PROCEDURE GetStudentByID(IN student_id INT)
BEGIN
    SELECT * FROM Students WHERE StudentID = student_id;
END //

DELIMITER ;

-- Call with parameter
-- CALL GetStudentByID(1);

-- ============================================================================
-- 13.3 Stored Procedure with OUTPUT Parameter
-- ============================================================================

DELIMITER //

CREATE PROCEDURE GetStudentGPA(IN student_id INT, OUT gpa_value FLOAT)
BEGIN
    SELECT GPA INTO gpa_value FROM Students WHERE StudentID = student_id;
END //

DELIMITER ;

-- Call and capture output
-- CALL GetStudentGPA(1, @result);
-- SELECT @result;

-- ============================================================================
-- 13.4 Stored Procedure with IF Statement
-- ============================================================================

DELIMITER //

CREATE PROCEDURE CheckStudentStatus(
    IN student_id INT,
    OUT status_message VARCHAR(100)
)
BEGIN
    DECLARE student_gpa FLOAT;
    
    SELECT GPA INTO student_gpa FROM Students WHERE StudentID = student_id;
    
    IF student_gpa IS NULL THEN
        SET status_message = 'Student not found';
    ELSEIF student_gpa >= 3.5 THEN
        SET status_message = 'High Performing Student';
    ELSEIF student_gpa >= 3.0 THEN
        SET status_message = 'Good Student';
    ELSEIF student_gpa >= 2.0 THEN
        SET status_message = 'Average Student';
    ELSE
        SET status_message = 'Needs Improvement';
    END IF;
END //

DELIMITER ;

-- Call
-- CALL CheckStudentStatus(1, @message);
-- SELECT @message;

-- ============================================================================
-- 13.5 Stored Procedure with WHILE Loop
-- ============================================================================

DELIMITER //

CREATE PROCEDURE InsertTestStudents(IN number_of_students INT)
BEGIN
    DECLARE counter INT DEFAULT 1;
    
    WHILE counter <= number_of_students DO
        INSERT INTO Students (FirstName, LastName, StudentEmail, GPA, DepartmentID)
        VALUES (
            CONCAT('TestStudent', counter),
            CONCAT('Last', counter),
            CONCAT('test', counter, '@university.edu'),
            ROUND(RAND() * 4, 2),
            (SELECT DepartmentID FROM Departments ORDER BY RAND() LIMIT 1)
        );
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

-- Call to insert 5 test students
-- CALL InsertTestStudents(5);

-- ============================================================================
-- 13.6 Stored Procedure with CASE Statement
-- ============================================================================

DELIMITER //

CREATE PROCEDURE GetGradeFromGPA(IN gpa_value FLOAT, OUT letter_grade VARCHAR(2))
BEGIN
    CASE
        WHEN gpa_value >= 3.7 THEN SET letter_grade = 'A';
        WHEN gpa_value >= 3.3 THEN SET letter_grade = 'B';
        WHEN gpa_value >= 2.7 THEN SET letter_grade = 'C';
        WHEN gpa_value >= 2.0 THEN SET letter_grade = 'D';
        WHEN gpa_value >= 0 THEN SET letter_grade = 'F';
        ELSE SET letter_grade = 'N/A';
    END CASE;
END //

DELIMITER ;

-- Call
-- CALL GetGradeFromGPA(3.8, @grade);
-- SELECT @grade;

-- ============================================================================
-- 13.7 Stored Procedure with Transaction
-- ============================================================================

DELIMITER //

CREATE PROCEDURE EnrollStudentInCourse(
    IN student_id INT,
    IN course_id INT,
    OUT result_message VARCHAR(100)
)
BEGIN
    DECLARE course_exists INT;
    DECLARE already_enrolled INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET result_message = 'Error: Transaction rolled back';
    END;
    
    -- Check if course exists
    SELECT COUNT(*) INTO course_exists FROM Courses WHERE CourseID = course_id;
    
    -- Check if student already enrolled
    SELECT COUNT(*) INTO already_enrolled FROM Enrollments 
    WHERE StudentID = student_id AND CourseID = course_id;
    
    IF course_exists = 0 THEN
        SET result_message = 'Course does not exist';
    ELSEIF already_enrolled > 0 THEN
        SET result_message = 'Student already enrolled in this course';
    ELSE
        START TRANSACTION;
        
        INSERT INTO Enrollments (StudentID, CourseID) VALUES (student_id, course_id);
        
        COMMIT;
        SET result_message = 'Enrollment successful';
    END IF;
END //

DELIMITER ;

-- ============================================================================
-- 13.8 View Stored Procedures
-- ============================================================================

SHOW PROCEDURE STATUS WHERE DB = 'UniversityDB';

-- ============================================================================
-- 14. COMPLEX QUERIES - Real-world examples
-- ============================================================================

-- Get top 3 students by GPA with their departments
SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    s.GPA,
    d.DepartmentName,
    COUNT(e.EnrollmentID) AS CoursesEnrolled
FROM Students s
LEFT JOIN Departments d ON s.DepartmentID = d.DepartmentID
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, d.DepartmentID
ORDER BY s.GPA DESC
LIMIT 3;

-- Get average GPA by department with student count
SELECT 
    d.DepartmentName,
    COUNT(s.StudentID) AS StudentCount,
    ROUND(AVG(s.GPA), 2) AS AverageGPA,
    MAX(s.GPA) AS HighestGPA
FROM Departments d
LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY AverageGPA DESC;

-- Find students enrolled in multiple courses
SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    s.GPA,
    COUNT(e.CourseID) AS CourseCount
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID
HAVING COUNT(e.CourseID) > 1
ORDER BY CourseCount DESC;

-- Get course-wise enrollment statistics
SELECT 
    c.CourseName,
    c.MaxCapacity,
    COUNT(e.StudentID) AS CurrentEnrollment,
    ROUND((COUNT(e.StudentID) * 100.0 / c.MaxCapacity), 2) AS UtilizationPercent
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY UtilizationPercent DESC;

-- ============================================================================
-- 15. PRACTICE QUERIES - Try these yourself!
-- ============================================================================

-- 1. Find all students from Computer Science department
-- Answer:
SELECT * FROM Students WHERE DepartmentID = 1;

-- 2. Get count of students by GPA range
-- Answer:
SELECT 
    CASE 
        WHEN GPA >= 3.7 THEN 'A'
        WHEN GPA >= 3.3 THEN 'B'
        WHEN GPA >= 2.7 THEN 'C'
        ELSE 'D'
    END AS GradeRange,
    COUNT(*) AS StudentCount
FROM Students
WHERE GPA IS NOT NULL
GROUP BY GradeRange;

-- 3. Find students who haven't enrolled in any course
-- Answer:
SELECT * FROM Students s
WHERE NOT EXISTS (SELECT 1 FROM Enrollments e WHERE e.StudentID = s.StudentID);

-- 4. Get all A grades with student and course names
-- Answer:
SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    c.CourseName,
    e.Grade
FROM Enrollments e
INNER JOIN Students s ON e.StudentID = s.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.Grade = 'A';

-- 5. Update all students in IT department to have minimum GPA of 3.0 if below
-- Answer:
UPDATE Students
SET GPA = 3.0
WHERE DepartmentID = 2 AND GPA < 3.0;

-- ============================================================================
-- 16. CLEANUP (Optional - Uncomment to execute)
-- ============================================================================

-- Drop all views
-- DROP VIEW IF EXISTS HighPerformingStudents;
-- DROP VIEW IF EXISTS StudentEnrollmentDetails;
-- DROP VIEW IF EXISTS DepartmentStatistics;

-- Drop all stored procedures
-- DROP PROCEDURE IF EXISTS GetAllStudents;
-- DROP PROCEDURE IF EXISTS GetStudentByID;
-- DROP PROCEDURE IF EXISTS GetStudentGPA;
-- DROP PROCEDURE IF EXISTS CheckStudentStatus;
-- DROP PROCEDURE IF EXISTS InsertTestStudents;
-- DROP PROCEDURE IF EXISTS GetGradeFromGPA;
-- DROP PROCEDURE IF EXISTS EnrollStudentInCourse;

-- Drop all tables
-- DROP TABLE IF EXISTS Enrollments;
-- DROP TABLE IF EXISTS Courses;
-- DROP TABLE IF EXISTS Students;
-- DROP TABLE IF EXISTS Departments;

-- ============================================================================
-- END OF SQL CODING GUIDE
-- ============================================================================
