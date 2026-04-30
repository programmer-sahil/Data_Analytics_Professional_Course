-- Summary of class 1,2,3

-- Database create, use, table create, insert, retrieve, delete table, delete database
-- Clause: WHERE
-- Constraints: UNIQUE, ORDER BY, DISTINCT, DEFAULT, PRIMARY KEY, NOT NULL, AUTO_INCREMENT
-- LIKE (S%, A%, %i%), BETWEEN, IN('BCA', 'MSC'), AND, OR

-- Create database
CREATE DATABASE college_db;

-- Select database
USE college_db;

-- Create table with constraints
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
('Ribani', 'ribani123@gmail.com', 'Diploma', 21),
('Ankita', 'ankita123@gmail.com', 'Diploma', 20),
('Arushi', 'arushi123@gmail.com', 'BSC', 22),
('Riya', 'riya123@gmail.com', DEFAULT, 23);

-- View all data
SELECT * FROM college_students;

-- Show unique courses
SELECT DISTINCT course
FROM college_students;

-- Sort by age ascending
SELECT * FROM college_students
ORDER BY age ASC;

-- Sort by age descending
SELECT * FROM college_students
ORDER BY age DESC;

-- Show only first 3 rows
SELECT * FROM college_students
LIMIT 3;

-- Show top 2 oldest students
SELECT * FROM college_students
ORDER BY age DESC
LIMIT 2;

-- Search names starting with A
SELECT * FROM college_students
WHERE name LIKE 'A%';

-- Show age between 21 and 23
SELECT * FROM college_students
WHERE age BETWEEN 21 AND 23;

-- Show students in BSC or MSC
SELECT * FROM college_students
WHERE course IN ('BSC', 'MSC');

-- AND example
SELECT * FROM college_students
WHERE course = 'MSC' AND age > 22;

-- OR example
SELECT * FROM college_students
WHERE course = 'Diploma' OR course = 'BCA';

