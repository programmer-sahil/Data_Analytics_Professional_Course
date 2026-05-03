-- Select the database
USE class4_db;



-- GROUP BY (we will start from here)

-- Count how many students are in each course
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;


-- Find average marks for each course
SELECT course, AVG(marks) AS average_marks
FROM students
GROUP BY course;



-- Show only those courses where average marks are greater than 85
SELECT course, AVG(marks) AS average_marks
FROM students
GROUP BY course
HAVING AVG(marks) > 85;

-- Show only those courses where number of students is more than 2
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course
HAVING COUNT(*) > 2;

-- JOIN (Connect two or three tables together)

-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Insert records into departments
INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'Computer Science'),
(2, 'Geography'),
(3, 'AI ML');


-- Create a new student_details table with department id
CREATE TABLE student_details (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT
);


-- Insert records into student_details
INSERT INTO student_details (student_id, student_name, dept_id)
VALUES
(101, 'Sahil', 1),
(102, 'Arushi', 2),
(103, 'Ribani', 1),
(104, 'Ankita', 3);


-- Show student names with their department names
SELECT student_details.student_name, departments.dept_name
FROM student_details
INNER JOIN departments
ON student_details.dept_id = departments.dept_id;

-- Insert one student with unmatched department id
INSERT INTO student_details (student_id, student_name, dept_id)
VALUES (105, 'Arushi', 5);


-- Show all students and their department names if available
SELECT student_details.student_name, departments.dept_name
FROM student_details
LEFT JOIN departments
ON student_details.dept_id = departments.dept_id;

-- Foreign Key

-- Create parent table
CREATE TABLE departments_fk (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Insert records into parent table
INSERT INTO departments_fk (dept_id, dept_name)
VALUES
(1, 'Computer Science'),
(2, 'Management'),
(3, 'Physics');

-- Create child table with foreign key
CREATE TABLE student_details_fk (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_fk(dept_id)
);

-- Correct insert because dept_id 1 exists in parent table
INSERT INTO student_details_fk (student_id, student_name, dept_id)
VALUES (201, 'Sahil', 1);

-- This will cause error because dept_id 10 does not exist
INSERT INTO student_details_fk (student_id, student_name, dept_id)
VALUES (202, 'Riya', 2);


-- Show students whose marks are greater than average marks
SELECT name, marks
FROM students
WHERE marks > (
    SELECT AVG(marks)
    FROM students
);

-- Show student names from Computer Science department
SELECT student_name
FROM student_details
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'Computer Science'
);
