-- Active: 1766136828156@@127.0.0.1@3306@university
CREATE DATABASE NewCafe;
USE NewCafe;

CREATE TABLE categories (
    CategoryID INT NOT NULL PRIMARY KEY, 
    CategoryName NVARCHAR(50) NOT NULL,
    ItemDescription NVARCHAR(50) NOT NULL
);

INSERT INTO categories (CategoryID, CategoryName, ItemDescription)
VALUES
(1, 'Beverages', 'Soft Drinks'),
(2, 'Condiments', 'Sweet and Savory Sauces'), 
(3, 'Confections', 'Sweet Breads');

SELECT * FROM categories;
drop table categories;
drop database newcafe;