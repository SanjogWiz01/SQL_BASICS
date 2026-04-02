# SQL Complete Study Guide for DBMS Exam

## Table of Contents 
1. [Introduction to SQL](#introduction-to-sql)
2. [DDL (Data Definition Language)](#ddl-data-definition-language)
3. [DML (Data Manipulation Language)](#dml-data-manipulation-language)
4. [Basic SQL Operations](#basic-sql-operations)
5. [WHERE and ORDER BY Clauses](#where-and-order-by-clauses)
6. [Set Operations](#set-operations)
7. [NULL Values](#null-values)
8. [Joins](#joins)
9. [Data Modification](#data-modification)
10. [Views](#views)
11. [Stored Procedures](#stored-procedures)

---

## Introduction to SQL

**SQL (Structured Query Language)** is a standardized language for managing and manipulating databases.

### Key Characteristics:
- **Declarative**: You specify WHAT you want, not HOW to get it
- **Non-procedural**: No explicit loops or conditions
- **Case-insensitive**: Keywords can be written in any case
- **Portable**: Works across different database systems

### SQL Statement Categories:
1. **DDL** - Define and manage database structure
2. **DML** - Manipulate data in tables
3. **DCL** - Control access permissions
4. **TCL** - Manage transactions

---

## DDL (Data Definition Language)

DDL statements are used to **define and manage the database structure**.

### 1. CREATE Statement

#### Creating a Database:
```sql
CREATE DATABASE database_name; data created
```

#### Creating a Table:
```sql
CREATE TABLE table_name (
    column1 data_type constraints,
    column2 data_type constraints,
    ...
);
```

**Example:**
```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DOB DATE,
    GPA FLOAT DEFAULT 0.0
);
```

### Column Constraints:
- **PRIMARY KEY**: Uniquely identifies each row
- **FOREIGN KEY**: References a column in another table
- **UNIQUE**: Ensures all values are different
- **NOT NULL**: Ensures a value must be provided
- **DEFAULT**: Sets a default value
- **CHECK**: Ensures values meet a condition
- **AUTO_INCREMENT**: Automatically generates sequential values

**Example with constraints:**
```sql
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0 AND Credits <= 4),
    Instructor VARCHAR(50) NOT NULL
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE DEFAULT CURDATE(),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
```

### 2. ALTER Statement

**Modify table structure after creation:**

#### Add a Column:
```sql
ALTER TABLE table_name ADD column_name data_type;
```

**Example:**
```sql
ALTER TABLE Students ADD Phone VARCHAR(15);
```

#### Modify a Column:
```sql
ALTER TABLE table_name MODIFY column_name new_data_type;
```

**Example:**
```sql
ALTER TABLE Students MODIFY Name VARCHAR(100);
```

#### Drop a Column:
```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

**Example:**
```sql
ALTER TABLE Students DROP COLUMN Phone;
```

#### Add a Constraint:
```sql
ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_definition;
```

**Example:**
```sql
ALTER TABLE Students ADD CONSTRAINT chk_gpa CHECK (GPA >= 0 AND GPA <= 4);
```

### 3. DROP Statement

**Delete entire table or database:**

```sql
DROP TABLE table_name;
DROP DATABASE database_name;
```

**Example:**
```sql
DROP TABLE Students;
```

### 4. TRUNCATE Statement

**Delete all data but keep structure:**

```sql
TRUNCATE TABLE table_name;
```

**Example:**
```sql
TRUNCATE TABLE Students;
```

**Difference from DELETE:**
- TRUNCATE: Faster, resets identity/auto-increment, cannot use WHERE clause
- DELETE: Slower, keeps identity value, can use WHERE clause, triggers fire

### 5. RENAME Statement

**Rename a table or column:**

```sql
-- Rename Table
ALTER TABLE old_table_name RENAME TO new_table_name;
-- or
RENAME TABLE old_name TO new_name;

-- Rename Column
ALTER TABLE table_name CHANGE COLUMN old_column_name new_column_name data_type;
-- or
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;
```

**Example:**
```sql
ALTER TABLE Students RENAME TO StudentRecords;

ALTER TABLE Students CHANGE COLUMN StudentID ID INT;
```

### 6. Data Types

| Type | Examples | Usage |
|------|----------|-------|
| **Numeric** | INT, BIGINT, FLOAT, DECIMAL | Numbers |
| **String** | VARCHAR(n), CHAR(n), TEXT | Text data |
| **Date/Time** | DATE, TIME, DATETIME, TIMESTAMP | Date and time |
| **Boolean** | BOOLEAN | True/False |

**Important:**
- `VARCHAR(n)`: Variable length string (max n characters) - preferred
- `CHAR(n)`: Fixed length string (always n characters)
- `DECIMAL(p,s)`: Precision p, scale s (e.g., DECIMAL(5,2) = 999.99)

---

## DML (Data Manipulation Language)

DML statements are used to **manipulate data within tables**.

### 1. SELECT Statement

**Retrieve data from tables:**

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition
ORDER BY column ASC/DESC;
```

**Example:**
```sql
SELECT StudentID, Name, Email FROM Students
WHERE GPA > 3.0
ORDER BY Name ASC;
```

#### SELECT with All Columns:
```sql
SELECT * FROM Students;
```

#### SELECT with DISTINCT (remove duplicates):
```sql
SELECT DISTINCT City FROM Students;
```

### 2. INSERT Statement

**Add new records:**

```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

**Example:**
```sql
INSERT INTO Students (Name, Email, DOB, GPA)
VALUES ('John Doe', 'john@example.com', '2003-05-15', 3.5);
```

#### Multiple Inserts:
```sql
INSERT INTO Students (Name, Email, GPA)
VALUES 
    ('Alice', 'alice@example.com', 3.8),
    ('Bob', 'bob@example.com', 3.2),
    ('Carol', 'carol@example.com', 3.9);
```

### 3. UPDATE Statement

**Modify existing records:**

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

**Example:**
```sql
UPDATE Students
SET GPA = 3.7
WHERE StudentID = 1;
```

**IMPORTANT:** Always use WHERE clause to avoid updating all records!

### 4. DELETE Statement

**Remove records:**

```sql
DELETE FROM table_name
WHERE condition;
```

**Example:**
```sql
DELETE FROM Students
WHERE StudentID = 5;
```

**WARNING:** Always use WHERE clause! DELETE without WHERE removes all records.

---

## Basic SQL Operations

### 1. String Functions

| Function | Purpose | Example |
|----------|---------|---------|
| `CONCAT()` | Concatenate strings | `CONCAT(FirstName, ' ', LastName)` |
| `UPPER()` | Convert to uppercase | `UPPER(Name)` |
| `LOWER()` | Convert to lowercase | `LOWER(Email)` |
| `LENGTH()` | Get string length | `LENGTH(Name)` |
| `SUBSTRING()` | Extract substring | `SUBSTRING(Name, 1, 3)` |
| `TRIM()` | Remove spaces | `TRIM(Name)` |
| `REPLACE()` | Replace text | `REPLACE(Name, 'John', 'Jane')` |

**Examples:**
```sql
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Students;
SELECT UPPER(Email) FROM Students;
SELECT SUBSTRING(Name, 1, 5) FROM Students;
```

### 2. Numeric Functions

| Function | Purpose | Example |
|----------|---------|---------|
| `ABS()` | Absolute value | `ABS(-5)` → 5 |
| `ROUND()` | Round number | `ROUND(3.7)` → 4 |
| `CEIL()` | Round up | `CEIL(3.2)` → 4 |
| `FLOOR()` | Round down | `FLOOR(3.8)` → 3 |
| `POWER()` | Exponentiation | `POWER(2, 3)` → 8 |
| `SQRT()` | Square root | `SQRT(16)` → 4 |

**Examples:**
```sql
SELECT ROUND(GPA, 2) FROM Students;
SELECT FLOOR(Price * 1.1) FROM Products;
```

### 3. Aggregate Functions

These function **combine multiple rows into one result**.

| Function | Purpose |
|----------|---------|
| `COUNT()` | Count rows |
| `SUM()` | Sum values |
| `AVG()` | Average value |
| `MAX()` | Maximum value |
| `MIN()` | Minimum value |

**Examples:**
```sql
SELECT COUNT(*) FROM Students;
SELECT AVG(GPA) FROM Students;
SELECT MAX(GPA), MIN(GPA) FROM Students;
SELECT SUM(Credits) FROM Enrollments;
```

#### WITH GROUP BY:
```sql
SELECT Instructor, COUNT(*) as CourseCount
FROM Courses
GROUP BY Instructor;
```

#### WITH HAVING (filter groups):
```sql
SELECT Instructor, COUNT(*) as CourseCount
FROM Courses
GROUP BY Instructor
HAVING COUNT(*) > 2;
```

### 4. Date Functions

| Function | Purpose | Example |
|----------|---------|---------|
| `NOW()` | Current date/time | `NOW()` |
| `CURDATE()` | Current date | `CURDATE()` |
| `YEAR()` | Extract year | `YEAR(DOB)` |
| `MONTH()` | Extract month | `MONTH(DOB)` |
| `DAY()` | Extract day | `DAY(DOB)` |
| `DATE_ADD()` | Add interval | `DATE_ADD(NOW(), INTERVAL 1 DAY)` |
| `DATEDIFF()` | Difference | `DATEDIFF(date1, date2)` |

**Examples:**
```sql
SELECT Name, YEAR(DOB) as BirthYear FROM Students;
SELECT * FROM Students WHERE YEAR(DOB) = 2003;
SELECT DATEDIFF(NOW(), DOB) as AgeDays FROM Students;
```

---

## WHERE and ORDER BY Clauses

### WHERE Clause

**Filter rows based on conditions:**

#### Comparison Operators:
- `=` (equal)
- `!=` or `<>` (not equal)
- `>`, `<` (greater than, less than)
- `>=`, `<=` (greater or equal, less or equal)

**Example:**
```sql
SELECT * FROM Students WHERE GPA > 3.5;
```

#### Logical Operators:

**AND** - All conditions must be true:
```sql
SELECT * FROM Students WHERE GPA > 3.0 AND Name = 'John';
```

**OR** - At least one condition must be true:
```sql
SELECT * FROM Students WHERE GPA > 3.5 OR GPA < 2.0;
```

**NOT** - Negate a condition:
```sql
SELECT * FROM Students WHERE NOT (GPA < 2.0);
```

#### BETWEEN - Range filter:
```sql
SELECT * FROM Students WHERE GPA BETWEEN 3.0 AND 3.8;
```

#### IN - Match multiple values:
```sql
SELECT * FROM Students WHERE StudentID IN (1, 3, 5);
```

#### LIKE - Pattern matching:
```sql
SELECT * FROM Students WHERE Name LIKE 'J%';     -- Starts with J
SELECT * FROM Students WHERE Name LIKE '%son';    -- Ends with son
SELECT * FROM Students WHERE Name LIKE '%oh%';    -- Contains oh
SELECT * FROM Students WHERE Name LIKE '_ohn';    -- 4 chars, ends with ohn
```

**LIKE Wildcards:**
- `%` - Any number of characters
- `_` - Exactly one character

#### EXISTS - Subquery check:
```sql
SELECT * FROM Students WHERE EXISTS (
    SELECT 1 FROM Enrollments WHERE Students.StudentID = Enrollments.StudentID
);
```

### ORDER BY Clause

**Sort results:**

```sql
SELECT * FROM Students ORDER BY GPA DESC;
```

#### Sort by Multiple Columns:
```sql
SELECT * FROM Students ORDER BY GPA DESC, Name ASC;
```

#### Sort by Position:
```sql
SELECT Name, GPA FROM Students ORDER BY 2 DESC;  -- Sort by 2nd column (GPA)
```

---

## Set Operations

Set operations combine results from **multiple SELECT statements**.

### 1. UNION

**Combines results and removes duplicates:**

```sql
SELECT column_list FROM table1
UNION
SELECT column_list FROM table2;
```

**Example:**
```sql
SELECT Name FROM Students WHERE GPA > 3.5
UNION
SELECT Name FROM Faculty WHERE Department = 'CS';
```

### 2. UNION ALL

**Combines results including duplicates:**

```sql
SELECT Name FROM Students
UNION ALL
SELECT Name FROM Faculty;
```

### 3. INTERSECT

**Returns only rows present in both queries:**

```sql
SELECT StudentID FROM Enrollments WHERE CourseID = 1
INTERSECT
SELECT StudentID FROM Enrollments WHERE CourseID = 2;
```

### 4. EXCEPT (or MINUS)

**Returns rows in first query but not in second:**

```sql
SELECT StudentID FROM Enrollments WHERE CourseID = 1
EXCEPT
SELECT StudentID FROM Enrollments WHERE CourseID = 2;
```

**Requirements for Set Operations:**
- Same number of columns
- Corresponding columns have compatible data types
- Column names from first query are used in result

---

## NULL Values

NULL represents **missing or unknown data**.

### Important Characteristics:
1. NULL is **not equal to anything**, including NULL
2. NULL is **unknown**, not zero or empty string
3. Arithmetic with NULL results in NULL
4. Comparisons with NULL result in UNKNOWN

### IS NULL and IS NOT NULL

```sql
-- Find missing emails
SELECT * FROM Students WHERE Email IS NULL;

-- Find records with email
SELECT * FROM Students WHERE Email IS NOT NULL;
```

### Handling NULL in Comparisons:

```sql
-- WRONG - will not find NULLs
SELECT * FROM Students WHERE Phone = NULL;  -- Returns nothing

-- CORRECT
SELECT * FROM Students WHERE Phone IS NULL;
```

### NULL in Aggregate Functions:

```sql
-- COUNT(*) counts all rows including NULLs
SELECT COUNT(*) FROM Students;

-- COUNT(column) counts non-NULL values
SELECT COUNT(Phone) FROM Students;  -- Counts only non-NULL phones

-- Other aggregates ignore NULLs
SELECT AVG(GPA) FROM Students;  -- Ignores NULL GPAs
```

### COALESCE - Replace NULL with default value:

```sql
SELECT Name, COALESCE(Phone, 'Not Provided') as Phone
FROM Students;
```

### IFNULL - MySQL specific:

```sql
SELECT Name, IFNULL(Phone, 'N/A') as Phone
FROM Students;
```

---

## Joins

Joins combine data from **multiple tables based on related columns**.

### Table Setup (Examples):

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    InstructorID INT
);
```

### 1. INNER JOIN

**Returns rows that have matches in BOTH tables:**

```sql
SELECT Students.Name, Departments.DepartmentName
FROM Students
INNER JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;
```

**or using USING clause (if column names are same):**
```sql
SELECT Students.Name, Departments.DepartmentName
FROM Students
JOIN Departments USING (DepartmentID);
```

### 2. LEFT (OUTER) JOIN

**Returns ALL rows from left table + matching rows from right table:**

```sql
SELECT Students.Name, Enrollments.CourseID
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;
```

Result includes students with NO enrollments (with NULL in CourseID).

### 3. RIGHT (OUTER) JOIN

**Returns ALL rows from right table + matching rows from left table:**

```sql
SELECT Students.Name, Departments.DepartmentName
FROM Students
RIGHT JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;
```

Result includes departments with NO students.

### 4. FULL OUTER JOIN

**Returns ALL rows from BOTH tables (left + right):**

```sql
SELECT Students.Name, Departments.DepartmentName
FROM Students
FULL OUTER JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;
```

**Note:** MySQL doesn't support FULL OUTER JOIN natively. Use UNION of LEFT and RIGHT JOIN:
```sql
SELECT Students.Name, Departments.DepartmentName
FROM Students
LEFT JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
UNION
SELECT Students.Name, Departments.DepartmentName
FROM Students
RIGHT JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;
```

### 5. NATURAL JOIN

**Automatically joins on columns with SAME NAME:**

```sql
SELECT *
FROM Students
NATURAL JOIN Enrollments;
```

**Equivalent to:**
```sql
SELECT *
FROM Students
INNER JOIN Enrollments USING (StudentID);
```

**Caution:** Use with care - assumes columns have meaningful names.

### 6. CROSS JOIN

**Cartesian product - combines each row of table1 with each row of table2:**

```sql
SELECT *
FROM Students
CROSS JOIN Courses;
```

### 7. Self Join

**Join a table with itself:**

```sql
-- Find students from same department
SELECT a.Name as Student1, b.Name as Student2, a.DepartmentID
FROM Students a
INNER JOIN Students b ON a.DepartmentID = b.DepartmentID
AND a.StudentID < b.StudentID;
```

### Multiple Joins:

```sql
SELECT Students.Name, Courses.CourseName, Departments.DepartmentName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
INNER JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;
```

---

## Data Modification

### 1. INSERT

**Add new records:**

#### Single Row:
```sql
INSERT INTO Students (StudentID, Name, DepartmentID)
VALUES (1, 'John Doe', 101);
```

#### Multiple Rows:
```sql
INSERT INTO Students (StudentID, Name, DepartmentID)
VALUES 
    (1, 'John Doe', 101),
    (2, 'Jane Smith', 102),
    (3, 'Bob Johnson', 101);
```

#### Insert from SELECT:
```sql
INSERT INTO StudentBackup
SELECT * FROM Students WHERE GPA > 3.5;
```

#### Insert with DEFAULT:
```sql
INSERT INTO Students (StudentID, Name, DepartmentID, CreatedAt)
VALUES (4, 'Alice', 103, DEFAULT);
```

### 2. UPDATE

**Modify existing records:**

#### Single Column:
```sql
UPDATE Students
SET GPA = 3.8
WHERE StudentID = 1;
```

#### Multiple Columns:
```sql
UPDATE Students
SET GPA = 3.5, DepartmentID = 102
WHERE StudentID = 2;
```

#### Update from Expression:
```sql
UPDATE Students
SET GPA = GPA * 1.05
WHERE DepartmentID = 101;
```

#### Update from Another Table:
```sql
UPDATE Students
SET DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science')
WHERE Name = 'John Doe';
```

**BEST PRACTICE:** Use WHERE clause to limit updates:
```sql
-- Good: Updates only specific rows
UPDATE Students SET GPA = 3.5 WHERE StudentID = 1;

-- Dangerous: Updates ALL rows
UPDATE Students SET GPA = 3.5;
```

### 3. DELETE

**Remove records:**

#### Delete Specific Rows:
```sql
DELETE FROM Students
WHERE StudentID = 5;
```

#### Delete Multiple Rows:
```sql
DELETE FROM Enrollments
WHERE CourseID IN (1, 2, 3);
```

#### Delete with Complex Condition:
```sql
DELETE FROM Students
WHERE GPA < 2.0 AND DepartmentID = 101;
```

#### Delete All Rows (but keep structure):
```sql
DELETE FROM Students;  -- Slower
TRUNCATE TABLE Students;  -- Faster (resets identity)
```

### Difference: DELETE vs TRUNCATE

| Feature | DELETE | TRUNCATE |
|---------|--------|----------|
| WHERE clause | Yes | No |
| Speed | Slower | Faster |
| Identity | Kept | Reset |
| Triggers | Fire | Don't fire |
| Rollback | Yes (in transaction) | Depends on DB |
| Space | Released partially | All released |

### 4. Transaction Control (for safety)

```sql
BEGIN TRANSACTION;

UPDATE Students SET GPA = 3.5 WHERE StudentID = 1;
UPDATE Enrollments SET Status = 'Active' WHERE StudentID = 1;

-- Check if all good, then commit
COMMIT;

-- Or rollback if error
-- ROLLBACK;
```

---

## Views

**Views are virtual tables created from SQL queries.**

### Benefits:
1. **Simplify complex queries** - reuse frequently used joins
2. **Security** - restrict users to specific columns/rows
3. **Abstraction** - hide table structure changes
4. **Consistency** - standardize business logic

### 1. CREATE VIEW

```sql
CREATE VIEW view_name AS
SELECT column_list
FROM table_name
WHERE condition;
```

**Example:**
```sql
CREATE VIEW HighPerformers AS
SELECT StudentID, Name, GPA
FROM Students
WHERE GPA > 3.5;
```

### Querying a View:

```sql
SELECT * FROM HighPerformers;
```

### 2. ALTER VIEW

```sql
ALTER VIEW view_name AS
SELECT new_column_list
FROM table_name
WHERE new_condition;
```

**Example:**
```sql
ALTER VIEW HighPerformers AS
SELECT StudentID, Name, GPA, DepartmentID
FROM Students
WHERE GPA > 3.7;
```

### 3. DROP VIEW

```sql
DROP VIEW view_name;

DROP VIEW HighPerformers;
```

### 4. Complex View with Joins:

```sql
CREATE VIEW StudentEnrollmentDetails AS
SELECT 
    s.StudentID,
    s.Name,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;
```

### 5. View with Aggregation:

```sql
CREATE VIEW DepartmentEnrollmentStats AS
SELECT 
    d.DepartmentName,
    COUNT(s.StudentID) as TotalStudents,
    AVG(s.GPA) as AvgGPA
FROM Departments d
LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;
```

### Updatable Views (DML on Views):

```sql
-- Can insert/update/delete through this simple view
CREATE VIEW ActiveStudents AS
SELECT StudentID, Name, GPA
FROM Students
WHERE Status = 'Active';

-- This works:
INSERT INTO ActiveStudents VALUES (10, 'New Student', 3.5);
```

**Restrictions on Updatable Views:**
- Cannot contain JOIN, GROUP BY, HAVING, UNION
- All columns must be from single table
- Cannot contain derived columns or aggregate functions

---

## Stored Procedures

**Precompiled SQL code blocks that can accept parameters and return results.**

### Benefits:
1. **Performance** - Precompiled, faster execution
2. **Reusability** - Call from multiple applications
3. **Security** - Prevent SQL injection, control permissions
4. **Maintainability** - Change logic without updating applications
5. **Transactions** - Group multiple operations

### 1. Simple Stored Procedure (No Parameters)

```sql
DELIMITER //

CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM Students;
END //

DELIMITER ;
```

**Call the procedure:**
```sql
CALL GetAllStudents();
```

**Note:** `DELIMITER //` temporarily changes statement delimiter to avoid confusion with semicolons.

### 2. Stored Procedure with Input Parameters

```sql
DELIMITER //

CREATE PROCEDURE GetStudentByID(IN student_id INT)
BEGIN
    SELECT * FROM Students
    WHERE StudentID = student_id;
END //

DELIMITER ;
```

**Call with parameter:**
```sql
CALL GetStudentByID(5);
```

### 3. Stored Procedure with Output Parameters

```sql
DELIMITER //

CREATE PROCEDURE GetStudentGPA(IN student_id INT, OUT gpa_value FLOAT)
BEGIN
    SELECT GPA INTO gpa_value FROM Students
    WHERE StudentID = student_id;
END //

DELIMITER ;
```

**Call and use output:**
```sql
CALL GetStudentGPA(5, @result);
SELECT @result;
```

### 4. Stored Procedure with IN OUT Parameters

```sql
DELIMITER //

CREATE PROCEDURE ApplyGPABonus(INOUT student_gpa FLOAT)
BEGIN
    SET student_gpa = student_gpa * 1.05;
END //

DELIMITER ;
```

**Call:**
```sql
SET @current_gpa = 3.5;
CALL ApplyGPABonus(@current_gpa);
SELECT @current_gpa;  -- Result: 3.675
```

### 5. Stored Procedure with Control Flow

```sql
DELIMITER //

CREATE PROCEDURE UpdateStudentStatus(IN student_id INT, IN new_status VARCHAR(20))
BEGIN
    DECLARE student_exists INT;
    
    -- Check if student exists
    SELECT COUNT(*) INTO student_exists
    FROM Students
    WHERE StudentID = student_id;
    
    IF student_exists > 0 THEN
        UPDATE Students
        SET Status = new_status
        WHERE StudentID = student_id;
        SELECT 'Student status updated successfully' as Message;
    ELSE
        SELECT 'Student not found' as Message;
    END IF;
END //

DELIMITER ;
```

### 6. Stored Procedure with LOOP

```sql
DELIMITER //

CREATE PROCEDURE InsertMultipleStudents(IN total_count INT)
BEGIN
    DECLARE counter INT DEFAULT 1;
    
    WHILE counter <= total_count DO
        INSERT INTO Students (Name, DepartmentID, GPA)
        VALUES (CONCAT('Student', counter), 101, 3.0);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;
```

**Call:**
```sql
CALL InsertMultipleStudents(10);  -- Inserts 10 students
```

### 7. Stored Procedure with CASE Statement

```sql
DELIMITER //

CREATE PROCEDURE GetGradeByGPA(IN gpa_value FLOAT, OUT grade VARCHAR(2))
BEGIN
    CASE
        WHEN gpa_value >= 3.7 THEN SET grade = 'A';
        WHEN gpa_value >= 3.3 THEN SET grade = 'B';
        WHEN gpa_value >= 2.7 THEN SET grade = 'C';
        WHEN gpa_value >= 2.0 THEN SET grade = 'D';
        ELSE SET grade = 'F';
    END CASE;
END //

DELIMITER ;
```

**Call:**
```sql
CALL GetGradeByGPA(3.8, @result);
SELECT @result;  -- Result: A
```

### 8. Stored Procedure with Error Handling

```sql
DELIMITER //

CREATE PROCEDURE SafeDeleteStudent(IN student_id INT)
BEGIN
    DECLARE exit_code INT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exit_code = 1;
    END;
    
    DELETE FROM Students WHERE StudentID = student_id;
    
    IF exit_code = 0 THEN
        SELECT 'Student deleted successfully' as Result;
    ELSE
        SELECT 'Error occurred during deletion' as Result;
    END IF;
END //

DELIMITER ;
```

### 9. Stored Procedure with Transaction

```sql
DELIMITER //

CREATE PROCEDURE TransferEnrollment(
    IN from_student_id INT,
    IN to_student_id INT,
    IN course_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- Delete from source student
    DELETE FROM Enrollments
    WHERE StudentID = from_student_id AND CourseID = course_id;
    
    -- Add to destination student
    INSERT INTO Enrollments (StudentID, CourseID)
    VALUES (to_student_id, course_id);
    
    COMMIT;
END //

DELIMITER ;
```

### 10. DROP PROCEDURE

```sql
DROP PROCEDURE procedure_name;

DROP PROCEDURE GetAllStudents;
```

### 11. Show All Procedures

```sql
SHOW PROCEDURE STATUS;
SHOW PROCEDURE STATUS WHERE db = 'database_name';
```

---

## Quick Comparison Tables

### DDL vs DML vs DCL

| Type | Purpose | Commands |
|------|---------|----------|
| **DDL** | Define structure | CREATE, ALTER, DROP, TRUNCATE, RENAME |
| **DML** | Manipulate data | SELECT, INSERT, UPDATE, DELETE |
| **DCL** | Control access | GRANT, REVOKE |
| **TCL** | Manage transactions | COMMIT, ROLLBACK, SAVEPOINT |

### JOIN Types Quick Reference

| Type | Left Table | Right Table | Result |
|------|-----------|-----------|--------|
| INNER | ✓ Matched | ✓ Matched | Matched only |
| LEFT | ✓ All | ✓ Matched | All left + matched right |
| RIGHT | ✓ Matched | ✓ All | Matched left + all right |
| FULL | ✓ All | ✓ All | All from both |
| CROSS | ✓ All | ✓ All | Cartesian product |

---

## Exam Tips

1. **READ CAREFULLY** - Understand what's being asked
2. **PLAN YOUR QUERY** - Think before writing
3. **USE PROPER SYNTAX** - Consistent formatting
4. **TEST YOUR QUERIES** - Check results
5. **USE ALIASES** - Make queries readable
6. **COMMENT YOUR CODE** - Explain complex logic
7. **CHECK NULL HANDLING** - Use IS NULL/IS NOT NULL
8. **VERIFY WHERE CLAUSES** - Prevent accidental updates/deletes
9. **USE TRANSACTIONS** - For data safety
10. **PRACTICE** - Do as many examples as possible

---

## Final Review Checklist

- [ ] Understand difference between DDL, DML, DCL
- [ ] Know all column constraints and their purposes
- [ ] Master WHERE and ORDER BY clauses
- [ ] Comfortable with INNER, LEFT, RIGHT, FULL joins
- [ ] Understand NATURAL JOIN behavior
- [ ] Can write INSERT, UPDATE, DELETE safely
- [ ] Know aggregate functions and GROUP BY/HAVING
- [ ] Understand NULL handling
- [ ] Can create and query views
- [ ] Can write basic stored procedures
- [ ] Know string, numeric, and date functions
- [ ] Understand SET operations (UNION, INTERSECT)

Good luck with your exam! 🎓
