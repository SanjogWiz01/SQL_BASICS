# SQL Quick Reference Guide
## DBMS Exam Cheat Sheet

---

## 1. DDL - CREATE, ALTER, DROP, TRUNCATE

### CREATE TABLE
```sql
CREATE TABLE table_name (
    col1 INT PRIMARY KEY AUTO_INCREMENT,
    col2 VARCHAR(50) NOT NULL,
    col3 FLOAT DEFAULT 0.0,
    col4 DATE,
    FOREIGN KEY (col1) REFERENCES other_table(id)
);
```

### ALTER TABLE
```sql
ALTER TABLE table ADD column_name datatype;
ALTER TABLE table MODIFY column_name newdatatype;
ALTER TABLE table DROP COLUMN column_name;
ALTER TABLE table RENAME TO new_name;
ALTER TABLE table CHANGE old_col new_col datatype;
```

### DROP & TRUNCATE
```sql
DROP TABLE table_name;          -- Delete structure + data
TRUNCATE TABLE table_name;      -- Delete data only, faster
```

---

## 2. DML - INSERT, SELECT, UPDATE, DELETE

### INSERT
```sql
INSERT INTO table (col1, col2) VALUES (val1, val2);
INSERT INTO table VALUES (val1, val2, val3);
INSERT INTO table (col1, col2) VALUES (val1, val2), (val3, val4);
INSERT INTO table SELECT * FROM other_table;
```

### SELECT
```sql
SELECT * FROM table;
SELECT col1, col2 FROM table;
SELECT DISTINCT col FROM table;
SELECT col AS 'Alias' FROM table;
SELECT COUNT(*) FROM table;
```

### UPDATE
```sql
UPDATE table SET col = value WHERE condition;
UPDATE table SET col1 = val1, col2 = val2 WHERE condition;
UPDATE table SET col = col + 1 WHERE condition;
```

### DELETE
```sql
DELETE FROM table WHERE condition;
DELETE FROM table;  -- Deletes all (careful!)
```

---

## 3. WHERE & ORDER BY

### WHERE Clause
```sql
WHERE col = value              -- Equality
WHERE col != value             -- Not equal
WHERE col > value              -- Greater than
WHERE col BETWEEN a AND b      -- Range
WHERE col IN (a, b, c)         -- Multiple values
WHERE col LIKE 'A%'            -- Pattern (starts with A)
WHERE col LIKE '%A%'           -- Contains A
WHERE col IS NULL              -- NULL check
WHERE col IS NOT NULL          -- Non-NULL check
WHERE col1 = val AND col2 = val2    -- AND
WHERE col1 = val OR col2 = val2     -- OR
WHERE NOT (condition)          -- NOT
```

### ORDER BY
```sql
ORDER BY col ASC;              -- Ascending (default)
ORDER BY col DESC;             -- Descending
ORDER BY col1 DESC, col2 ASC;  -- Multiple columns
ORDER BY 2 DESC;               -- By column position
```

---

## 4. AGGREGATE FUNCTIONS & GROUP BY

```sql
SELECT COUNT(*) FROM table;                 -- Count all rows
SELECT COUNT(col) FROM table;               -- Count non-NULL
SELECT SUM(col) FROM table;                 -- Sum
SELECT AVG(col) FROM table;                 -- Average
SELECT MAX(col), MIN(col) FROM table;       -- Max and Min
SELECT col, COUNT(*) FROM table GROUP BY col;
SELECT col1, AVG(col2) FROM table GROUP BY col1 HAVING AVG(col2) > 3;
```

---

## 5. STRING FUNCTIONS

```sql
CONCAT(str1, str2, ...)        -- Concatenate
UPPER(str)                     -- To uppercase
LOWER(str)                     -- To lowercase
LENGTH(str)                    -- String length
SUBSTRING(str, 1, 5)           -- Extract substring
TRIM(str)                      -- Remove spaces
REPLACE(str, old, new)         -- Replace text
```

---

## 6. NUMERIC FUNCTIONS

```sql
ABS(num)                       -- Absolute value
ROUND(num, decimals)           -- Round
CEIL(num)                      -- Round up
FLOOR(num)                     -- Round down
POWER(num, power)              -- Exponentiation
SQRT(num)                      -- Square root
```

---

## 7. DATE FUNCTIONS

```sql
NOW()                          -- Current date & time
CURDATE()                      -- Current date
YEAR(date), MONTH(date), DAY(date)
DATE_ADD(date, INTERVAL n DAY)
DATEDIFF(date1, date2)         -- Days difference
DATE_FORMAT(date, '%Y-%m-%d')
```

---

## 8. JOINS

```sql
-- INNER JOIN (matching only)
SELECT * FROM t1 JOIN t2 ON t1.id = t2.id;

-- LEFT JOIN (all from t1 + matching from t2)
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id;

-- RIGHT JOIN (matching from t1 + all from t2)
SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;

-- NATURAL JOIN (auto join on same column name)
SELECT * FROM t1 NATURAL JOIN t2;

-- CROSS JOIN (cartesian product)
SELECT * FROM t1 CROSS JOIN t2;

-- SELF JOIN
SELECT a.name, b.name FROM table a JOIN table b ON a.dept = b.dept;

-- FULL OUTER (MySQL - use UNION)
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM t1 RIGHT JOIN t2 ON t1.id = t2.id;
```

---

## 9. SET OPERATIONS

```sql
-- UNION (remove duplicates)
SELECT col FROM t1 UNION SELECT col FROM t2;

-- UNION ALL (include duplicates)
SELECT col FROM t1 UNION ALL SELECT col FROM t2;

-- INTERSECT (only in both)
SELECT col FROM t1 INTERSECT SELECT col FROM t2;

-- EXCEPT (in t1 but not t2)
SELECT col FROM t1 EXCEPT SELECT col FROM t2;
```

---

## 10. NULL HANDLING

```sql
IS NULL                        -- Check for NULL
IS NOT NULL                    -- Check for not NULL
COALESCE(col1, col2, 'default')  -- First non-NULL
IFNULL(col, 'default')         -- MySQL specific
NULLIF(col1, col2)             -- Return NULL if equal
```

---

## 11. VIEWS

```sql
-- Create view
CREATE VIEW view_name AS
SELECT col1, col2 FROM table WHERE condition;

-- Query view
SELECT * FROM view_name;

-- Alter view
ALTER VIEW view_name AS SELECT ...;

-- Drop view
DROP VIEW view_name;
```

---

## 12. STORED PROCEDURES

### Basic Syntax
```sql
DELIMITER //

CREATE PROCEDURE proc_name()
BEGIN
    -- SQL statements
END //

DELIMITER ;

-- Call
CALL proc_name();
```

### With Parameters
```sql
DELIMITER //

CREATE PROCEDURE proc_name(
    IN param1 INT,           -- Input
    OUT param2 VARCHAR(50),  -- Output
    INOUT param3 FLOAT       -- Input & Output
)
BEGIN
    -- Use parameters
    SELECT col INTO param2 FROM table WHERE id = param1;
END //

DELIMITER ;

CALL proc_name(1, @out, @inout);
SELECT @out;
```

### With IF
```sql
IF condition THEN
    -- statements
ELSEIF condition THEN
    -- statements
ELSE
    -- statements
END IF;
```

### With WHILE
```sql
DECLARE counter INT DEFAULT 1;
WHILE counter <= 10 DO
    -- statements
    SET counter = counter + 1;
END WHILE;
```

### With CASE
```sql
CASE variable
    WHEN value1 THEN statement1;
    WHEN value2 THEN statement2;
    ELSE statement3;
END CASE;
```

---

## 13. SUBQUERIES

```sql
-- In WHERE
SELECT * FROM t1 WHERE id IN (SELECT id FROM t2);

-- In FROM (derived table)
SELECT * FROM (SELECT * FROM t WHERE condition) AS derived;

-- EXISTS
SELECT * FROM t1 WHERE EXISTS (SELECT 1 FROM t2 WHERE t2.id = t1.id);
```

---

## 14. COMMON PATTERNS

### Count grouped with condition
```sql
SELECT dept, COUNT(*) as cnt FROM students 
WHERE gpa > 3.0 
GROUP BY dept 
HAVING cnt > 2;
```

### Rank/Order with aggregates
```sql
SELECT dept, gpa, COUNT(*) as cnt
FROM students
GROUP BY dept, gpa
ORDER BY gpa DESC;
```

### Complex join with multiple conditions
```sql
SELECT s.name, c.course
FROM students s
LEFT JOIN enrollments e ON s.id = e.sid
LEFT JOIN courses c ON e.cid = c.id
WHERE s.gpa > 3.0 AND c.credits >= 3;
```

### Update from another table
```sql
UPDATE t1 
SET col = (SELECT col FROM t2 WHERE t2.id = t1.id)
WHERE condition;
```

---

## 15. CONSTRAINT TYPES

```sql
PRIMARY KEY         -- Unique identifier
FOREIGN KEY         -- Reference to another table
UNIQUE              -- All values must be different
NOT NULL            -- Must have a value
DEFAULT             -- Default value
CHECK               -- Condition must be true
AUTO_INCREMENT      -- Auto-generate sequential numbers
```

---

## 16. DATA TYPES

| Type | Examples | Size |
|------|----------|------|
| **Integer** | INT, BIGINT, TINYINT | 1-8 bytes |
| **Decimal** | DECIMAL(p,s), FLOAT | Variable |
| **String** | VARCHAR(n), CHAR(n), TEXT | Variable |
| **Date** | DATE, DATETIME, TIMESTAMP | 3-8 bytes |
| **Boolean** | BOOLEAN | 1 byte |

---

## 17. EXAM TIPS

1. ✓ Always use WHERE for UPDATE/DELETE to avoid accidents
2. ✓ Remember NULL ≠ NULL (use IS NULL instead)
3. ✓ COUNT(*) counts NULLs, COUNT(col) doesn't
4. ✓ TRUNCATE faster than DELETE, resets identity
5. ✓ INNER JOIN faster than LEFT/RIGHT for large tables
6. ✓ Use indexes on frequently queried columns
7. ✓ NATURAL JOIN risky - columns must have same name
8. ✓ Stored procedures prevent SQL injection
9. ✓ Views simplify complex queries
10. ✓ Test queries with LIMIT before final execution

---

## 18. COMMON MISTAKES TO AVOID

❌ `WHERE col = NULL` → Use `WHERE col IS NULL`
❌ `DELETE FROM table;` → Use `WHERE` clause always
❌ `UPDATE table SET col = val;` → Use `WHERE` condition
❌ `SELECT * FROM t1 WHERE id IN ()` → Empty IN list
❌ Mixing UNION types without matching columns
❌ Using NATURAL JOIN without understanding column names
❌ Forgetting to quote string values: `= 'value'`
❌ Not handling NULL in calculations
❌ Not using transactions for critical operations

---

## 19. PERFORMANCE TIPS

- Index frequently searched columns
- Use WHERE clauses to filter early
- Avoid SELECT * use specific columns
- Use INNER JOIN over LEFT/RIGHT when possible
- Aggregate at database level, not application
- Use LIMIT for large result sets
- Avoid nested loops with subqueries
- Use stored procedures for complex operations

---

## 20. QUICK SYNTAX SUMMARY

```sql
-- Complete workflow example
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees (name, salary, dept_id) VALUES ('John', 50000, 1);

SELECT name, salary FROM employees 
WHERE salary > 40000 
ORDER BY salary DESC;

UPDATE employees SET salary = salary * 1.1 WHERE emp_id = 1;

DELETE FROM employees WHERE emp_id = 1;

DROP TABLE employees;
```

---

**Last Updated:** Before Your Exam 📚
**Good Luck!** 🎓

