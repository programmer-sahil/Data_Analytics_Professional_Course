SHOW DATABASES;

CREATE DATABASE school_db;

USE school_db;

-- Creating Table: Create a table for students
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

-- Show all tables in the selected database
SHOW TABLES;

-- Show the structure of the students table
DESCRIBE students;

-- Inserting Data: Insert one row into the students table
INSERT INTO students (id, name, age, course)
VALUES 
(101, 'Sahil', 24, 'MSC'),
(102, 'Ribani', 21, 'Diploma'),
(103, 'Ankita', 20, 'Diploma'),
(104, 'Arushi', 22, 'BSC');


-- Retrieve Data: Show all records from the students table
SELECT * FROM students;

-- Retrieve Data: Show only name and course columns
SELECT name, course FROM students;

-- Filter Data: Show students whose course is BCA
SELECT * FROM students
WHERE course = 'BSC';


-- Filter Data: Show student whose age is greater than 21
SELECT * FROM students 
WHERE age > 21;


-- Show student whose id is 1
SELECT * FROM students
WHERE id = 101;

-- Update the course of student with id 1
UPDATE students
SET course = 'BSC'
WHERE id = 101;

-- id should be Primary Key then we can update
-- adding primary key in ID
ALTER TABLE students
ADD PRIMARY KEY (id);

UPDATE students
SET course = 'Btech'
WHERE id = 101;



-- Delete the student whose id is 104
DELETE FROM students
WHERE id = 104;


-- Delete the students table permanently
DROP TABLE students;

-- Delete the database permanently
DROP DATABASE school_db;

SELECT * from students;
