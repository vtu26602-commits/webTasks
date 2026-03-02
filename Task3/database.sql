CREATE DATABASE IF NOT EXISTS task3_schema;
USE task3_schema;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

INSERT INTO users (username, password)
VALUES ('admin', '1234');