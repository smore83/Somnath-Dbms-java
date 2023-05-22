create DATABASE ecommerce;
use ecommerce;

-- Table for Supplier
CREATE TABLE Supplier (
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(255),
  SupplierAddress VARCHAR(255),
  SupplierContact VARCHAR(255)
);

-- Table for Customer
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  CustomerAddress VARCHAR(255),
  CustomerContact VARCHAR(255)
);

-- Table for Item
CREATE TABLE Item (
  ItemID INT PRIMARY KEY,
  ItemName VARCHAR(255),
  SupplierID INT,
  Price DECIMAL(10, 2),
  Quantity INT,
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Table for Order
CREATE TABLE Order_details (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Table for OrderItem
CREATE TABLE OrderItem (
  OrderID INT,
  ItemID INT,
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Order_details(OrderID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  PRIMARY KEY (OrderID, ItemID)
);

