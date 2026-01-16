CREATE DATABASE operators_part3_db;
USE operators_part3_db;

CREATE TABLE marks_a (
    name VARCHAR(50),
    marks INT
);

CREATE TABLE marks_b (
    name VARCHAR(50),
    marks INT
);

INSERT INTO marks_a VALUES
('Sanjog',78),
('Bikash',65),
('Sita',82),
('Ramesh',55);

INSERT INTO marks_b VALUES
('Sita',82),
('Gita',90),
('Aarav',72);

SELECT name FROM marks_a
EXCEPT
SELECT name FROM marks_b;

SELECT name FROM marks_a
INTERSECT
SELECT name FROM marks_b;

SELECT * FROM marks_a
WHERE marks > ALL (SELECT marks FROM marks_b);

SELECT * FROM marks_a
WHERE marks > ANY (SELECT marks FROM marks_b);

SELECT name FROM marks_a a
WHERE EXISTS (
    SELECT 1 FROM marks_b b
    WHERE a.name = b.name
);

SELECT name,
CASE
    WHEN marks >= 80 THEN 'Distinction'
    WHEN marks >= 60 THEN 'First Division'
    ELSE 'Fail'
END
FROM marks_a;

DROP TABLE marks_a;
DROP TABLE marks_b;
DROP DATABASE operators_part3_db;


Operators covered

EXCEPT Operator

ALL Operator

ANY Operator

INTERSECT Operator

EXISTS Operator

CASE Operator