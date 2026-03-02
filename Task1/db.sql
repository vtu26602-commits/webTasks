-- Create Database
CREATE DATABASE IF NOT EXISTS new_login;

-- Use Database
USE new_login;

-- Drop table if already exists (optional, avoids duplicate error)
DROP TABLE IF EXISTS userDetailsSample;

-- Create Table
CREATE TABLE userDetailsSample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    mail VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    Usernumber VARCHAR(15) NOT NULL,
    dept VARCHAR(20) NOT NULL
);
