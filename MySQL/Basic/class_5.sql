-- MySQL Class 4 & 5 Complete Practice Script
-- Topics Covered:

-- Class 4:
-- Functions, Aggregate Functions, GROUP BY, HAVING,
-- Joins, Foreign Keys, Subqueries




-- Class 5:
-- CTEs, UNION, UNION ALL, Views,
-- Date and Time Functions, String Functions,
-- CASE, Window Functions, Indexes,
-- Transactions, Data Cleaning, NULL Handling,
-- Query Optimization Basics, Normalization,
-- Interview Practice, Real-World Analytics Queries



-- ============================================
-- STEP 1: Create and select database
-- ============================================

CREATE DATABASE class4_5_db;
USE class4_5_db;


-- ============================================
-- STEP 2: Create main students table
-- This table will be used for Class 4 practice
-- ============================================

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    course VARCHAR(50),
    age INT,
    marks INT
);

-- Insert sample student data
INSERT INTO students (name, course, age, marks)
VALUES
('Sahil', 'BCA', 21, 85),
('Riya', 'BCA', 22, 90),
('Rahim', 'BSC', 20, 78),
('Ankita', 'BSC', 23, 88),
('Arushi', 'BCA', 21, 95);

-- View all student records
SELECT * FROM students;


-- ============================================
-- STEP 3: String Functions
-- UPPER, LOWER, LENGTH
-- ============================================

-- Convert names to uppercase
SELECT name, UPPER(name) AS upper_name
FROM students;

-- Convert names to lowercase
SELECT name, LOWER(name) AS lower_name
FROM students;

-- Count characters in each name
SELECT name, LENGTH(name) AS name_length
FROM students;


-- ============================================
-- STEP 4: Numeric Functions
-- ROUND, MOD
-- ============================================

-- Round a decimal value to 2 digits
SELECT ROUND(45.678, 2) AS rounded_value;

-- Find remainder
SELECT MOD(10, 3) AS remainder;


-- ============================================
-- STEP 5: Date and Time Functions
-- CURDATE, CURTIME, NOW
-- ============================================

SELECT CURDATE() AS today_date;
SELECT CURTIME() AS current_time;
SELECT NOW() AS current_date_time;


-- ============================================
-- STEP 6: Aggregate Functions
-- COUNT, SUM, AVG, MIN, MAX
-- ============================================

-- Count total students
SELECT COUNT(*) AS total_students
FROM students;

-- Find total marks
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


-- ============================================
-- STEP 7: GROUP BY
-- Group records based on same course
-- ============================================

-- Count students in each course
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;

-- Find average marks by course
SELECT course, AVG(marks) AS average_marks
FROM students
GROUP BY course;


-- ============================================
-- STEP 8: HAVING
-- Filter grouped data
-- ============================================

-- Show only courses where average marks > 85
SELECT course, AVG(marks) AS average_marks
FROM students
GROUP BY course
HAVING AVG(marks) > 85;

-- Show only courses with more than 2 students
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course
HAVING COUNT(*) > 2;


-- ============================================
-- STEP 9: WHERE vs HAVING example
-- ============================================

-- WHERE filters rows before grouping
SELECT * FROM students
WHERE marks > 80;

-- HAVING filters groups after grouping
SELECT course, AVG(marks) AS avg_marks
FROM students
GROUP BY course
HAVING AVG(marks) > 80;


-- ============================================
-- STEP 10: Create tables for JOIN practice
-- ============================================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'Computer Science'),
(2, 'Management'),
(3, 'Physics');

CREATE TABLE student_details (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT
);

INSERT INTO student_details (student_id, student_name, dept_id)
VALUES
(101, 'Sahil', 1),
(102, 'Riya', 2),
(103, 'Rahim', 1),
(104, 'Ankita', 3);

-- View both tables
SELECT * FROM departments;
SELECT * FROM student_details;


-- ============================================
-- STEP 11: INNER JOIN
-- Shows only matching rows from both tables
-- ============================================

SELECT student_details.student_name, departments.dept_name
FROM student_details
INNER JOIN departments
ON student_details.dept_id = departments.dept_id;


-- ============================================
-- STEP 12: LEFT JOIN
-- Shows all rows from left table and matched rows from right
-- ============================================

-- Add one unmatched row
INSERT INTO student_details (student_id, student_name, dept_id)
VALUES (105, 'Arushi', 5);

SELECT student_details.student_name, departments.dept_name
FROM student_details
LEFT JOIN departments
ON student_details.dept_id = departments.dept_id;


-- ============================================
-- STEP 13: Foreign Key
-- Create relationship between two tables
-- ============================================

CREATE TABLE departments_fk (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

INSERT INTO departments_fk (dept_id, dept_name)
VALUES
(1, 'Computer Science'),
(2, 'Management'),
(3, 'Physics');

CREATE TABLE student_details_fk (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_fk(dept_id)
);

-- Valid insert because dept_id exists
INSERT INTO student_details_fk (student_id, student_name, dept_id)
VALUES (201, 'Sahil', 1);

SELECT * FROM student_details_fk;


-- ============================================
-- STEP 14: Subqueries
-- Query inside another query
-- ============================================

-- Show students whose marks are above average
SELECT name, marks
FROM students
WHERE marks > (
    SELECT AVG(marks)
    FROM students
);

-- Show students from Computer Science department
SELECT student_name
FROM student_details
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'Computer Science'
);


-- ============================================
-- STEP 15: Create sales table for Class 5
-- ============================================

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO sales (customer_name, city, product, category, quantity, price, order_date)
VALUES
('Sahil', 'Kolkata', 'Laptop', 'Electronics', 1, 55000.00, '2025-01-10'),
('Riya', 'Delhi', 'Mouse', 'Electronics', 2, 700.00, '2025-01-12'),
('Rahim', 'Kolkata', 'Keyboard', 'Electronics', 1, 1200.00, '2025-01-15'),
('Ankita', 'Mumbai', 'Notebook', 'Stationery', 5, 80.00, '2025-01-18'),
('Arushi', 'Delhi', 'Pen', 'Stationery', 10, 20.00, '2025-01-20'),
('Ribani', 'Kolkata', 'Monitor', 'Electronics', 1, 12000.00, '2025-01-25');

SELECT * FROM sales;


-- ============================================
-- STEP 16: Common Table Expressions (CTEs)
-- ============================================

-- Create a temporary result set for expensive products
WITH expensive_products AS (
    SELECT customer_name, product, price
    FROM sales
    WHERE price > 1000
)
SELECT * FROM expensive_products;


-- ============================================
-- STEP 17: UNION and UNION ALL
-- ============================================

CREATE TABLE online_customers (
    name VARCHAR(50)
);

CREATE TABLE store_customers (
    name VARCHAR(50)
);

INSERT INTO online_customers VALUES ('Sahil'), ('Riya'), ('Rahim');
INSERT INTO store_customers VALUES ('Riya'), ('Ankita'), ('Arushi');

-- UNION removes duplicates
SELECT name FROM online_customers
UNION
SELECT name FROM store_customers;

-- UNION ALL keeps duplicates
SELECT name FROM online_customers
UNION ALL
SELECT name FROM store_customers;


-- ============================================
-- STEP 18: Views
-- Virtual table based on a query
-- ============================================

CREATE VIEW electronics_view AS
SELECT customer_name, product, price
FROM sales
WHERE category = 'Electronics';

SELECT * FROM electronics_view;


-- ============================================
-- STEP 19: More Date Functions
-- YEAR, MONTH, DAY
-- ============================================

SELECT order_date, YEAR(order_date) AS year_value
FROM sales;

SELECT order_date, MONTH(order_date) AS month_value
FROM sales;

SELECT order_date, DAY(order_date) AS day_value
FROM sales;


-- ============================================
-- STEP 20: More String Functions
-- CONCAT, TRIM
-- ============================================

SELECT CONCAT(customer_name, ' - ', city) AS full_info
FROM sales;

SELECT TRIM('   MySQL Class 5   ') AS cleaned_text;


-- ============================================
-- STEP 21: CASE Statement
-- Works like if-else in SQL
-- ============================================

SELECT product, price,
CASE
    WHEN price >= 10000 THEN 'Expensive'
    WHEN price >= 1000 THEN 'Medium'
    ELSE 'Low Cost'
END AS price_category
FROM sales;


-- ============================================
-- STEP 22: Window Functions
-- ROW_NUMBER and RANK
-- ============================================

SELECT product, price,
ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num
FROM sales;

SELECT product, price,
RANK() OVER (ORDER BY price DESC) AS product_rank
FROM sales;


-- ============================================
-- STEP 23: Indexes
-- Improve search speed
-- ============================================

CREATE INDEX idx_city
ON sales(city);

CREATE INDEX idx_category_price
ON sales(category, price);


-- ============================================
-- STEP 24: Transactions
-- COMMIT and ROLLBACK
-- ============================================

CREATE TABLE bank_accounts (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10,2)
);

INSERT INTO bank_accounts VALUES
(1, 'Sahil', 5000.00),
(2, 'Riya', 3000.00);

-- Transaction with COMMIT
START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE id = 1;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE id = 2;

COMMIT;

SELECT * FROM bank_accounts;

-- Transaction with ROLLBACK
START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 500
WHERE id = 1;

ROLLBACK;

SELECT * FROM bank_accounts;


-- ============================================
-- STEP 25: Data Cleaning and NULL Handling
-- ============================================

CREATE TABLE messy_data (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO messy_data VALUES
(1, '  sahil  ', 'kolkata'),
(2, 'RIYA', 'DELHI'),
(3, 'rahim', NULL);

SELECT * FROM messy_data;

-- Remove extra spaces
SELECT id, TRIM(name) AS cleaned_name
FROM messy_data;

-- Standardize name format
SELECT id, UPPER(TRIM(name)) AS standardized_name
FROM messy_data;

-- Replace NULL city with Unknown
SELECT id, name, IFNULL(city, 'Unknown') AS city_name
FROM messy_data;

-- Show rows where city is NULL
SELECT * FROM messy_data
WHERE city IS NULL;

-- Show rows where city is not NULL
SELECT * FROM messy_data
WHERE city IS NOT NULL;


-- ============================================
-- STEP 26: Query Optimization Basics
-- Better to select needed columns only
-- ============================================

-- Less preferred in large tables
SELECT * FROM sales
WHERE city = 'Kolkata';

-- Better approach
SELECT customer_name, product, price
FROM sales
WHERE city = 'Kolkata';


-- ============================================
-- STEP 27: Normalization
-- Better table design using separate related tables
-- ============================================

CREATE TABLE departments_norm (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE students_norm (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_norm(dept_id)
);


-- ============================================
-- STEP 28: Interview-Oriented SQL Practice
-- ============================================

-- Find second highest price
SELECT DISTINCT price
FROM sales
ORDER BY price DESC
LIMIT 1 OFFSET 1;

-- Count customers city-wise
SELECT city, COUNT(*) AS total_customers
FROM sales
GROUP BY city;

-- Show products above average price
SELECT product, price
FROM sales
WHERE price > (
    SELECT AVG(price)
    FROM sales
);


-- ============================================
-- STEP 29: Real-World Data Analytics Queries
-- ============================================

-- Total sales amount by city
SELECT city, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY city;

-- Category-wise revenue
SELECT category, SUM(quantity * price) AS revenue
FROM sales
GROUP BY category;

-- Best selling product by quantity
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity DESC;

-- Monthly sales report
SELECT MONTH(order_date) AS sales_month,
       SUM(quantity * price) AS monthly_sales
FROM sales
GROUP BY MONTH(order_date);

-- Orders from Kolkata
SELECT customer_name, product, quantity, price
FROM sales
WHERE city = 'Kolkata';
