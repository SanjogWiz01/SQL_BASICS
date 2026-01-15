
CREATE DATABASE fetch_clause_db;
USE fetch_clause_db;

CREATE TABLE scores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    marks INT
);

INSERT INTO scores (name, marks) VALUES
('Sanjog',88),
('Bikash',92),
('Sita',75),
('Ramesh',98),
('Gita',82);

SELECT *
FROM scores
ORDER BY marks DESC
FETCH FIRST 3 ROWS ONLY;

DROP TABLE scores;
DROP DATABASE fetch_clause_db;
