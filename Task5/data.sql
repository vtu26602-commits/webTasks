
CREATE DATABASE IF NOT EXISTS payment_simulation;
USE payment_simulation;


-- User Account Table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    balance DECIMAL(10,2)
);

-- Merchant Account Table
CREATE TABLE IF NOT EXISTS Merchants (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_name VARCHAR(100),
    balance DECIMAL(10,2)
);


INSERT INTO Users (user_name, balance) VALUES
('Joshi', 5000),
('Valli', 8000);

INSERT INTO Merchants (merchant_name, balance) VALUES
('Amazon', 20000),
('Flipkart', 15000);



START TRANSACTION;

UPDATE Users
SET balance = balance - 2000
WHERE user_id = 1 AND balance >= 2000;

UPDATE Merchants
SET balance = balance + 2000
WHERE merchant_id = 1;

COMMIT;


START TRANSACTION;

UPDATE Users
SET balance = balance - 10000
WHERE user_id = 1 AND balance >= 10000;

-- Since condition fails (balance < 10000),
-- rollback the transaction

ROLLBACK;


SELECT * FROM Users;
SELECT * FROM Merchants;
