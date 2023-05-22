CREATE DATABASE hotel_booking;
USE hotel_booking;

-- Table for Hotel
CREATE TABLE Hotel (
  HotelID INT PRIMARY KEY,
  HotelName VARCHAR(255),
  HotelAddress VARCHAR(255),
  Rating INT,
  PricePerNight DECIMAL(10, 2)
);

-- Table for Customer


-- Table for CustomerType
CREATE TABLE CustomerType (
  CustomerTypeID INT PRIMARY KEY,
  CustomerTypeName VARCHAR(255)
);
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  CustomerAddress VARCHAR(255),
  CustomerTypeID INT,
  HotelID INT,
  FOREIGN KEY (CustomerTypeID) REFERENCES CustomerType(CustomerTypeID),
  FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);