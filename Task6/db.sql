
CREATE DATABASE IF NOT EXISTS logging_system;
USE logging_system;

CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS UserLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

DROP TRIGGER IF EXISTS after_user_insert;
DROP TRIGGER IF EXISTS after_user_update;

DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO UserLogs (user_id, action_type)
    VALUES (NEW.user_id, 'INSERT');
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_user_update
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO UserLogs (user_id, action_type)
    VALUES (NEW.user_id, 'UPDATE');
END$$

DELIMITER ;

INSERT INTO Users (user_name, email)
VALUES ('Joshi', 'joshi@gmail.com');

UPDATE Users
SET email = 'joshi_updated@gmail.com'
WHERE user_id = 1;

CREATE OR REPLACE VIEW DailyActivityReport AS
SELECT 
    DATE(action_time) AS activity_date,
    action_type,
    COUNT(*) AS total_actions
FROM UserLogs
GROUP BY DATE(action_time), action_type
ORDER BY activity_date DESC;

SELECT * FROM Users;
SELECT * FROM UserLogs;
SELECT * FROM DailyActivityReport;
