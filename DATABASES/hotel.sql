CREATE DATABASE HotelDB;
USE HotelDB;
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(50),
    phone VARCHAR(15)
);
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(20),
    price INT
);
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE
);
INSERT INTO Guests VALUES
(1, 'Ram Sharma', '9800000001'),
(2, 'Sita Thapa', '9800000002');
INSERT INTO Booking VALUES
(1, 1, 101, '2025-01-10', '2025-01-12');
show databases;
show tables;
