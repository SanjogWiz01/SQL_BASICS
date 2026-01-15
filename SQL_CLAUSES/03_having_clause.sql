-- Active: 1768452168398@@127.0.0.1@3306@having_clause_db
CREATE DATABASE having_clause_db;
USE having_clause_db;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_name VARCHAR(50),
    city VARCHAR(50),
    amount INT
);

INSERT INTO sales (seller_name, city, amount) VALUES
('Sanjog', 'Pokhara', 5000),
('Sanjog', 'Pokhara', 7000),
('Bikash', 'Kathmandu', 4000),
('Bikash', 'Kathmandu', 3000),
('Sita', 'Butwal', 9000),
('Sita', 'Butwal', 2000);

select * from sales;

-- Grouping data
SELECT seller_name, SUM(amount) AS total_sales
FROM sales
GROUP BY seller_name;

-- HAVING condition
SELECT seller_name, SUM(amount) AS total_sales
FROM sales
GROUP BY seller_name
HAVING SUM(amount) > 8000;

-- HAVING with multiple conditions
SELECT seller_name, city, SUM(amount) AS total_sales
FROM sales
GROUP BY seller_name, city
HAVING SUM(amount) > 6000;
-- Combining HAVING with WHERE
SELECT seller_name, city, SUM(amount) AS total_sales
FROM sales
WHERE city != 'Kathmandu'
GROUP BY seller_name, city
HAVING SUM(amount) > 6000;

drop table sales;