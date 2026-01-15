use hotel;
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone int(10)
);
INSERT INTO Customer (CustomerID, FirstName, LastName, Country, Age, Phone)
VALUES 
(1, 'Luca', 'Bianchi', 'Italy', 23, '98765432'),
(2, 'Aiko', 'Tanaka', 'Japan', 21, '784561123'),
(3, 'Carlos', 'Gomez', 'Spain', 24, '951236987'),
(4, 'Sofia', 'Müller', 'Germany', 22, '71203694'),
(5, 'Ethan', 'Johnson', 'USA', 25, '74689521');
select * from hotel.customer