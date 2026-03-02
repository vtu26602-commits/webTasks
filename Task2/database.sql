-- Create Database
CREATE DATABASE IF NOT EXISTS new_login;

-- Use Database
USE new_login;

-- Create Table
CREATE TABLE IF NOT EXISTS userDetailsSample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    mail VARCHAR(50),
    dob DATE,
    Usernumber VARCHAR(15),
    dept VARCHAR(20)
);

SELECT * FROM userDetailsSample;

SELECT *
FROM userDetailsSample
ORDER BY Username ASC;

SELECT *
FROM userDetailsSample
ORDER BY dob ASC;

SELECT *
FROM userDetailsSample
WHERE dept = 'CSE';

SELECT *
FROM userDetailsSample
WHERE dept = 'IT'
ORDER BY Username ASC;

SELECT dept, COUNT(*) AS total_students
FROM userDetailsSample
GROUP BY dept;