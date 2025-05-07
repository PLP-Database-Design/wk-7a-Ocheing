QUESTION ONE -- 1NF: Split multiple products into individual rows
-- Create normalized ProductDetail_1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);
-- Insert values in 1NF format
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');
QUESTION 2 -- 2NF: Eliminate partial dependencies by creating two tables
-- Table 1: Orders (OrderID, CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
-- Table 2: OrderItems (OrderID, Product, Quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Insert into Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');
-- Insert into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
QUESTION 3