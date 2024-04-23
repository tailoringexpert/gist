-- Create a new user and database
CREATE USER 'tailoringexpert'@'localhost' IDENTIFIED BY 'test1234';
CREATE DATABASE TAILORINGEXPERT CHARACTER SET utf8mb4;
GRANT ALL PRIVILEGES ON TAILORINGEXPERT.* TO 'tailoringexpert'@'localhost';
