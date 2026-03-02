-- Create Database
CREATE DATABASE IF NOT EXISTS order_management;
USE order_management;


-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- Insert Customers
INSERT INTO Customers (customer_name, email) VALUES
('Joshi', 'joshi@gmail.com'),
('Priya', 'priya@gmail.com'),
('Bhuvan', 'Bhuvan@gmail.com'),
('valli', 'valli@gmail.com'),
('Karthik', 'karthik@gmail.com');

-- Insert Products
INSERT INTO Products (product_name, price) VALUES
('Laptop', 60000),
('Mobile', 20000),
('Headphones', 2000),
('Keyboard', 1500),
('Monitor', 12000);

-- Insert Orders
INSERT INTO Orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2024-01-10'),
(2, 2, 2, '2024-01-15'),
(1, 3, 3, '2024-02-05'),
(3, 1, 1, '2024-02-10'),
(4, 5, 2, '2024-03-01'),
(5, 2, 1, '2024-03-05'),
(2, 4, 4, '2024-03-10');


SELECT 
    c.customer_name,
    p.product_name,
    o.quantity,
    (p.price * o.quantity) AS total_amount,
    o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC;

SELECT *
FROM (
    SELECT 
        o.order_id,
        c.customer_name,
        (p.price * o.quantity) AS total_amount
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    JOIN Products p ON o.product_id = p.product_id
) AS order_totals
WHERE total_amount = (
    SELECT MAX(p.price * o.quantity)
    FROM Orders o
    JOIN Products p ON o.product_id = p.product_id
);



SELECT customer_name, total_orders
FROM (
    SELECT 
        c.customer_name,
        COUNT(o.order_id) AS total_orders
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
) AS order_counts
WHERE total_orders = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS temp
);
