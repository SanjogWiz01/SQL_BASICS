

CREATE DATABASE distinct_clause_db;
USE distinct_clause_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO users (name, city) VALUES
('Sanjog','Pokhara'),
('Bikash','Pokhara'),
('Sita','Kathmandu'),
('Ramesh','Kathmandu'),
('Gita','Butwal');

SELECT DISTINCT city FROM users;

DROP TABLE users;
DROP DATABASE distinct_clause_db;
