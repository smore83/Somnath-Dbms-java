CREATE DATABASE irctc;
USE irctc;

-- Table for Train
CREATE TABLE Train (
  TrainID INT PRIMARY KEY,
  TrainName VARCHAR(255),
  DepartureStation VARCHAR(255),
  ArrivalStation VARCHAR(255),
  DepartureTime TIME,
  ArrivalTime TIME
);

-- Table for Customer
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  CustomerAddress VARCHAR(255),
  CustomerContact VARCHAR(255)
);

-- Table for Ticket
CREATE TABLE Ticket (
  TicketID INT PRIMARY KEY,
  TrainID INT,
  CustomerID INT,
  ReservationStatus VARCHAR(10),
  FOREIGN KEY (TrainID) REFERENCES Train(TrainID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Table for ReservedTicket
CREATE TABLE ReservedTicket (
  TicketID INT PRIMARY KEY,
  FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

-- Table for UnreservedTicket
CREATE TABLE UnreservedTicket (
  TicketID INT PRIMARY KEY,
  CustomerID INT,
  FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
  
);
