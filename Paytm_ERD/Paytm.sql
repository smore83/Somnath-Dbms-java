CREATE DATABASE banking_app;
USE banking_app;

-- Table for Customer
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  CustomerAddress VARCHAR(255)
);
-- Table for Accounts
-- Table for Branches
CREATE TABLE Branches (
  BranchID INT PRIMARY KEY,
  BranchName VARCHAR(255),
  BranchAddress VARCHAR(255)
);
CREATE TABLE Accounts (
  AccountNumber INT PRIMARY KEY,
  AccountType VARCHAR(255),
  Balance DECIMAL(10, 2),
  CustomerID INT,
  BranchID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
  CONSTRAINT unique_customer_account_per_branch UNIQUE (CustomerID, BranchID)
);




