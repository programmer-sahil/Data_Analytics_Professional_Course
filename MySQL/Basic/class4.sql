-- Create a new database for Class 4 practice
CREATE DATABASE class4_db;

-- Select the database
USE class4_db;


-- Create a students table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    course VARCHAR(50),
    age INT,
    marks INT
);


-- Insert sample records
INSERT INTO students (name, course, age, marks)
VALUES
('Sahil', 'BCA', 21, 85),
('Riya', 'BCA', 22, 90),
('Rahim', 'BSC', 20, 78),
('Ankita', 'BSC', 23, 88),
('Arushi', 'BCA', 21, 95);


-- View all data
SELECT * FROM students;


-- Convert student names to uppercase
SELECT name, UPPER(name) AS upper_name
FROM students;


-- Convert student names to lowercase
SELECT name, LOWER(name) AS lower_name
FROM students;



-- Show name and number of characters in name
SELECT name, LENGTH(name) AS name_length
FROM students;


-- Round a decimal number
SELECT ROUND(45.678, 2) AS rounded_value;


-- Find remainder
SELECT MOD(10, 3) AS remainder;


-- Show current date
SELECT CURDATE() AS today_date;


-- Show current time
SELECT CURTIME() AS current_time; -- Getting error in this line


-- Show current date and time
SELECT NOW() AS current_date_time;


-- Count total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- Find total marks of all students
SELECT SUM(marks) AS total_marks
FROM students;

-- Find average marks
SELECT AVG(marks) AS average_marks
FROM students;


-- Find minimum marks
SELECT MIN(marks) AS minimum_marks
FROM students;

-- Find maximum marks
SELECT MAX(marks) AS maximum_marks
FROM students;

-- GROUP BY (we will start from here)
