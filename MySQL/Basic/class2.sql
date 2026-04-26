-- Create a new database for practice
CREATE DATABASE college_db;

-- Select the database
USE college_db;

-- Create a students table with PRIMARY KEY
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

-- Insert student records
INSERT INTO students (id, name, age, course)
VALUES
(101, 'Sahil', 24, 'MSC'),
(102, 'Ribani', 21, 'Diploma'),
(103, 'Ankita', 20, 'Diploma');


-- Create a table where name and course cannot be empty
CREATE TABLE learners (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    course VARCHAR(50) NOT NULL
);


-- Correct insert
INSERT INTO learners (id, name, age, course)
VALUES (1, 'Rahim', 22, 'BCA');




-- Create table with UNIQUE constraint
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);


-- Correct insert
INSERT INTO users (id, name, email)
VALUES
(1, 'Sahil', 'sahil@gmail.com'),
(2, 'Rahim', 'rahim@gmail.com');



-- Create table with DEFAULT value
CREATE TABLE admission (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course VARCHAR(50) DEFAULT 'BCA'
);



-- Course will be set to BCA automatically
INSERT INTO admission (id, name)
VALUES (1, 'Riya');

-- View the table data
SELECT * FROM admission;



-- Create table with AUTO_INCREMENT
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50)
);


-- No need to enter id manually
INSERT INTO employees (name, department)
VALUES
('Sahil', 'IT'),
('Ankita', 'HR'),
('Ribani', 'Sales');


SELECT * FROM employees;


-- Create one complete table with multiple constraints
CREATE TABLE college_students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    course VARCHAR(50) DEFAULT 'BCA',
    age INT
);


-- Insert records
INSERT INTO college_students (name, email, course, age)
VALUES
('Sahil', 'sahil123@gmail.com', 'MSC', 24),
('Riya', 'riya123@gmail.com', 'BSC', 22),
('Rahim', 'rahim123@gmail.com', DEFAULT, 21);


-- View all data
SELECT * FROM college_students;


-- next day we will start from 10. DISTINCT
