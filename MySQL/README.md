# 🗄️ MySQL — Complete Learning Guide

> **Made by your Tutor — SK SAHIL**
> *Freelance AI Developer · Freelance Coding Tutor · Working in 4 Startups · Graduated from German University with Excellence Grade*

---

## 📌 What is MySQL?

**MySQL** is an open-source **Relational Database Management System (RDBMS)** that uses **Structured Query Language (SQL)** to store, manage, and retrieve data in a structured, table-based format. It is owned by Oracle Corporation and is one of the most widely used databases in the world.

MySQL organizes data into **tables** (like Excel sheets), where each table has **rows** (records) and **columns** (fields). Multiple tables are linked together using **relationships**, forming a **relational database**.

---

## 🌍 Where is MySQL Used?

| Domain | Use Case |
|---|---|
| **Web Development** | Backend of WordPress, Joomla, Drupal |
| **E-Commerce** | Product catalogs, orders, users |
| **Banking & Finance** | Transaction records, accounts |
| **Data Analytics** | Reporting, dashboards, KPI tracking |
| **Healthcare** | Patient records, appointments |
| **Social Media** | User data, posts, relationships |

---

## 🛠️ IDE & Tools

| Tool | Type | Link |
|---|---|---|
| **MySQL Workbench** | Desktop IDE (Official) | [mysql.com/products/workbench](https://www.mysql.com/products/workbench/) |
| **DBeaver** | Desktop IDE (Free) | [dbeaver.io](https://dbeaver.io/) |
| **TablePlus** | Desktop IDE (Modern UI) | [tableplus.com](https://tableplus.com/) |
| **VS Code + MySQL Extension** | Code Editor Plugin | [marketplace.visualstudio.com](https://marketplace.visualstudio.com/) |

## 🌐 Online IDE

| Tool | Link |
|---|---|
| **SQLFiddle** | [sqlfiddle.com](http://sqlfiddle.com/) |
| **DB Fiddle** | [db-fiddle.com](https://www.db-fiddle.com/) |
| **OneCompiler** | [onecompiler.com/mysql](https://onecompiler.com/mysql) |
| **Programiz Online SQL** | [programiz.com/sql/online-compiler](https://www.programiz.com/sql/online-compiler) |

## 📚 Official Documentation

- 📖 **MySQL Official Docs:** [dev.mysql.com/doc](https://dev.mysql.com/doc/)
- 📖 **W3Schools MySQL Tutorial:** [w3schools.com/mysql](https://www.w3schools.com/mysql/)

---

## ⚡ Critical Interview Concepts — Read Before Anything Else

> These are the **most-asked MySQL interview topics**. Understand each one deeply.

---

### 🔑 Primary Key

A **Primary Key** is a column (or combination of columns) that **uniquely identifies each row** in a table. Rules:
- ✅ Must be **UNIQUE** — no two rows can have the same value
- ✅ Cannot be **NULL** — every row must have a value
- ✅ Each table can have **only ONE** primary key
- ✅ Often combined with `AUTO_INCREMENT` to generate IDs automatically

```sql
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
```

> 💡 **Interview Tip:** "A Primary Key enforces entity integrity — it ensures every record is uniquely identifiable."

---

### 🔗 Foreign Key

A **Foreign Key** is a column in one table that **references the Primary Key** of another table. It creates a **relationship** between two tables and enforces **referential integrity** — meaning you cannot insert a value in the foreign key column that doesn't exist in the referenced table.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);
```

> 💡 **Interview Tip:** "Foreign Keys prevent orphan records — you can't have an order for a student that doesn't exist."

---

### 🔒 Constraints

Constraints are **rules enforced on table columns** to maintain data integrity.

| Constraint | Meaning |
|---|---|
| `PRIMARY KEY` | Uniquely identifies each row; NOT NULL + UNIQUE combined |
| `FOREIGN KEY` | Links to another table's Primary Key |
| `NOT NULL` | Column cannot have empty/null values |
| `UNIQUE` | All values in column must be different (can have one NULL) |
| `DEFAULT` | Sets a default value if none is provided |
| `AUTO_INCREMENT` | Automatically increases integer value for each new row |
| `CHECK` | Ensures values meet a specific condition |

---

### 🔍 Difference: PRIMARY KEY vs UNIQUE

| Feature | PRIMARY KEY | UNIQUE |
|---|---|---|
| NULL Allowed | ❌ No | ✅ Yes (one NULL) |
| Count per Table | Only ONE | Multiple allowed |
| Purpose | Row identity | Prevent duplicates |

---

### 🤝 Types of Joins

| Join Type | Returns |
|---|---|
| `INNER JOIN` | Only rows that match in BOTH tables |
| `LEFT JOIN` | All rows from left table + matching rows from right |
| `RIGHT JOIN` | All rows from right table + matching rows from left |
| `FULL JOIN` | All rows from both tables (MySQL uses UNION for this) |

> 💡 **Interview Tip:** "INNER JOIN is the most commonly used. LEFT JOIN is used when you want to keep all records from the main (left) table even if no match exists."

---

### 📊 Aggregate Functions

| Function | Purpose |
|---|---|
| `COUNT()` | Counts number of rows |
| `SUM()` | Adds all values |
| `AVG()` | Calculates average |
| `MAX()` | Finds maximum value |
| `MIN()` | Finds minimum value |

> 💡 **Interview Tip:** "Aggregate functions work on a set of rows and return a single value. Always used with `GROUP BY` when grouping data."

---

### 🔄 GROUP BY vs HAVING vs WHERE

| Clause | Filters | Works On |
|---|---|---|
| `WHERE` | Before grouping | Individual rows |
| `GROUP BY` | Groups rows | Rows with same value |
| `HAVING` | After grouping | Grouped results |

> 💡 **Interview Tip:** "You CANNOT use aggregate functions in WHERE — use HAVING instead."

---

### 🪟 Window Functions

**Window Functions** perform calculations **across a set of rows related to the current row**, without collapsing them into one row (unlike `GROUP BY`).

```sql
SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM employees;
```

Common Window Functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, `SUM() OVER()`

---

### 📋 CTEs (Common Table Expressions)

A **CTE** is a **temporary named result set** defined using `WITH` that you can reference within a query. It makes complex queries more readable.

```sql
WITH high_earners AS (
    SELECT * FROM employees WHERE salary > 70000
)
SELECT * FROM high_earners;
```

---

### 👁️ Views

A **View** is a **virtual table** based on a SQL query. It doesn't store data itself — it stores the query definition. Views simplify complex queries and add a layer of security.

```sql
CREATE VIEW student_summary AS
SELECT id, name FROM students WHERE age > 18;
```

---

### 📇 Indexes

An **Index** is a data structure that speeds up data retrieval operations. Think of it like a book's index — instead of scanning every page, you jump directly to the right page.

- ✅ Speeds up `SELECT` queries
- ❌ Slows down `INSERT`, `UPDATE`, `DELETE` slightly

```sql
CREATE INDEX idx_name ON students(name);
```

---

### 💳 Transactions

A **Transaction** is a sequence of SQL operations executed as a single unit. Either **ALL succeed** or **ALL fail** (ACID properties).

```sql
START TRANSACTION;
UPDATE accounts SET balance = balance - 500 WHERE id = 1;
UPDATE accounts SET balance = balance + 500 WHERE id = 2;
COMMIT;  -- or ROLLBACK if something goes wrong
```

> 💡 **Interview Tip:** "Transactions follow ACID: Atomicity, Consistency, Isolation, Durability."

---

### 📐 Normalization

**Normalization** is the process of organizing a database to **reduce data redundancy** and **improve data integrity**.

| Normal Form | Rule |
|---|---|
| **1NF** | Each column has atomic (single) values; no repeating groups |
| **2NF** | 1NF + No partial dependency on primary key |
| **3NF** | 2NF + No transitive dependency |

---

### 🔁 UNION vs UNION ALL

| | `UNION` | `UNION ALL` |
|---|---|---|
| Duplicates | Removed | Kept |
| Performance | Slower (removes duplicates) | Faster |

---

### NULL Handling

`NULL` means **absence of value** — it is NOT zero, NOT empty string.

```sql
SELECT * FROM students WHERE phone IS NULL;       -- Find NULLs
SELECT COALESCE(phone, 'N/A') FROM students;      -- Replace NULL with default
SELECT IFNULL(phone, 'No Phone') FROM students;   -- MySQL-specific
```

---

## 📚 Class 1 — MySQL Basics

### Introduction to MySQL
MySQL stores data in **databases** → **tables** → **rows & columns**.
- **Database:** A container holding multiple tables
- **Table:** A structured grid of data (like a spreadsheet)
- **Row:** A single record (one entry)
- **Column:** A field/attribute (e.g., name, age, email)

### SQL Basics

```sql
-- Show all databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE school;

-- Select/use a database
USE school;

-- Create a table
CREATE TABLE students (
    id INT,
    name VARCHAR(100),
    age INT,
    city VARCHAR(50)
);

-- Insert data into a table
INSERT INTO students (id, name, age, city)
VALUES (1, 'Rahul', 20, 'Kolkata');

INSERT INTO students VALUES (2, 'Priya', 22, 'Delhi');

-- Select all data
SELECT * FROM students;

-- Select specific columns
SELECT name, age FROM students;

-- Filter with WHERE
SELECT * FROM students WHERE city = 'Kolkata';
SELECT * FROM students WHERE age > 20;

-- Update existing data
UPDATE students SET city = 'Mumbai' WHERE id = 1;

-- Delete a record
DELETE FROM students WHERE id = 2;
```

---

## 📚 Class 2 — Constraints

```sql
-- Full table with all constraints
CREATE TABLE employees (
    id        INT AUTO_INCREMENT PRIMARY KEY,   -- unique, not null, auto-increases
    name      VARCHAR(100) NOT NULL,            -- cannot be empty
    email     VARCHAR(100) UNIQUE,              -- no duplicates allowed
    dept      VARCHAR(50) DEFAULT 'General',    -- default value if not provided
    salary    DECIMAL(10,2) NOT NULL
);

-- Insert using AUTO_INCREMENT (no need to specify id)
INSERT INTO employees (name, email, salary)
VALUES ('SK Sahil', 'sahil@email.com', 85000);

-- NOT NULL prevents this:
-- INSERT INTO employees (email, salary) VALUES ('test@mail.com', 50000); ❌ ERROR

-- UNIQUE prevents this:
-- INSERT INTO employees (name, email, salary) VALUES ('Ali', 'sahil@email.com', 60000); ❌ ERROR

-- DEFAULT works when column is omitted
INSERT INTO employees (name, salary) VALUES ('Riya', 55000);
-- dept will automatically be 'General'
```

---

## 📚 Class 3 — Advanced SELECT

```sql
-- Sample table for practice
CREATE TABLE products (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(100),
    category VARCHAR(50),
    price    DECIMAL(10,2),
    stock    INT
);

INSERT INTO products (name, category, price, stock) VALUES
('Laptop', 'Electronics', 55000, 10),
('Phone', 'Electronics', 25000, 25),
('Desk', 'Furniture', 8000, 5),
('Chair', 'Furniture', 4500, 15),
('Tablet', 'Electronics', 30000, 8),
('Lamp', 'Furniture', 1500, 30);

-- DISTINCT — Remove duplicate values
SELECT DISTINCT category FROM products;

-- ORDER BY — Sort results
SELECT * FROM products ORDER BY price ASC;       -- Low to High
SELECT * FROM products ORDER BY price DESC;      -- High to Low
SELECT * FROM products ORDER BY category ASC, price DESC;  -- Multiple columns

-- LIMIT — Restrict number of rows
SELECT * FROM products LIMIT 3;                  -- First 3 rows
SELECT * FROM products LIMIT 2, 3;               -- Skip 2, show next 3 (pagination)

-- LIKE — Pattern matching
SELECT * FROM products WHERE name LIKE 'L%';     -- Starts with L
SELECT * FROM products WHERE name LIKE '%op%';   -- Contains 'op'
SELECT * FROM products WHERE name LIKE '%k';     -- Ends with k
SELECT * FROM products WHERE name LIKE '_hone';  -- _ matches exactly one character

-- BETWEEN — Range filter (inclusive)
SELECT * FROM products WHERE price BETWEEN 5000 AND 30000;

-- IN — Match against a list of values
SELECT * FROM products WHERE category IN ('Electronics', 'Furniture');
SELECT * FROM products WHERE id IN (1, 3, 5);

-- AND / OR — Combine conditions
SELECT * FROM products WHERE category = 'Electronics' AND price < 30000;
SELECT * FROM products WHERE price < 5000 OR stock > 20;
```

---

## 📚 Class 4 — Functions, Joins & Subqueries

```sql
-- Setup two related tables for JOIN practice
CREATE TABLE departments (
    dept_id   INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE staff (
    staff_id  INT AUTO_INCREMENT PRIMARY KEY,
    name      VARCHAR(100),
    salary    DECIMAL(10,2),
    dept_id   INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_name) VALUES ('Engineering'), ('Marketing'), ('HR');
INSERT INTO staff (name, salary, dept_id) VALUES
('Sahil', 90000, 1),
('Priya', 75000, 2),
('Rajan', 60000, 1),
('Aman', 80000, 3),
('Meera', 70000, 2),
('Zara', 65000, NULL);  -- No department assigned

-- ─────────────────────────────────────────
-- AGGREGATE FUNCTIONS
-- ─────────────────────────────────────────
SELECT COUNT(*) AS total_staff FROM staff;
SELECT SUM(salary) AS total_salary FROM staff;
SELECT AVG(salary) AS avg_salary FROM staff;
SELECT MAX(salary) AS highest_salary FROM staff;
SELECT MIN(salary) AS lowest_salary FROM staff;

-- GROUP BY — Group rows sharing a value
SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_sal
FROM staff
GROUP BY dept_id;

-- HAVING — Filter on grouped results (cannot use WHERE for aggregates)
SELECT dept_id, AVG(salary) AS avg_sal
FROM staff
GROUP BY dept_id
HAVING avg_sal > 70000;

-- ─────────────────────────────────────────
-- JOINS
-- ─────────────────────────────────────────

-- INNER JOIN — Only matching rows in both tables
SELECT s.name, s.salary, d.dept_name
FROM staff s
INNER JOIN departments d ON s.dept_id = d.dept_id;

-- LEFT JOIN — All rows from LEFT (staff) + matches from RIGHT (departments)
-- Zara appears with NULL dept_name
SELECT s.name, s.salary, d.dept_name
FROM staff s
LEFT JOIN departments d ON s.dept_id = d.dept_id;

-- ─────────────────────────────────────────
-- SUBQUERIES
-- ─────────────────────────────────────────

-- Find staff earning above average salary
SELECT name, salary FROM staff
WHERE salary > (SELECT AVG(salary) FROM staff);

-- Find department with the most staff
SELECT dept_name FROM departments
WHERE dept_id = (
    SELECT dept_id FROM staff
    GROUP BY dept_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
```

---

## 📚 Class 5 — Advanced SQL

```sql
-- ─────────────────────────────────────────
-- CTEs (Common Table Expressions)
-- ─────────────────────────────────────────
WITH top_earners AS (
    SELECT name, salary FROM staff WHERE salary > 75000
)
SELECT * FROM top_earners ORDER BY salary DESC;

-- Recursive CTE example (number series)
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 5
)
SELECT * FROM nums;

-- ─────────────────────────────────────────
-- UNION & UNION ALL
-- ─────────────────────────────────────────
-- UNION removes duplicates
SELECT dept_name FROM departments WHERE dept_id = 1
UNION
SELECT dept_name FROM departments WHERE dept_id = 1;   -- Shows only once

-- UNION ALL keeps duplicates
SELECT dept_name FROM departments WHERE dept_id = 1
UNION ALL
SELECT dept_name FROM departments WHERE dept_id = 1;   -- Shows twice

-- ─────────────────────────────────────────
-- VIEWS
-- ─────────────────────────────────────────
CREATE VIEW engineering_team AS
SELECT s.name, s.salary, d.dept_name
FROM staff s
INNER JOIN departments d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Engineering';

SELECT * FROM engineering_team;   -- Use like a table

DROP VIEW engineering_team;       -- Delete the view

-- ─────────────────────────────────────────
-- DATE & TIME FUNCTIONS
-- ─────────────────────────────────────────
SELECT NOW();                              -- Current date and time
SELECT CURDATE();                          -- Current date only
SELECT CURTIME();                          -- Current time only
SELECT YEAR(NOW());                        -- Extract year
SELECT MONTH(NOW());                       -- Extract month
SELECT DAY(NOW());                         -- Extract day
SELECT DATEDIFF('2025-12-31', '2025-01-01') AS days_left;
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y');     -- Format date

-- ─────────────────────────────────────────
-- STRING FUNCTIONS
-- ─────────────────────────────────────────
SELECT UPPER('sk sahil');                  -- SK SAHIL
SELECT LOWER('SK SAHIL');                  -- sk sahil
SELECT LENGTH('hello');                    -- 5
SELECT TRIM('  hello  ');                  -- 'hello'
SELECT SUBSTRING('MySQL', 1, 3);           -- MyS
SELECT REPLACE('Hello World', 'World', 'MySQL');  -- Hello MySQL
SELECT CONCAT('SK', ' ', 'Sahil');         -- SK Sahil
SELECT CONCAT_WS(', ', 'Kolkata', 'India');        -- Kolkata, India

-- ─────────────────────────────────────────
-- CASE Statement
-- ─────────────────────────────────────────
SELECT name, salary,
    CASE
        WHEN salary >= 85000 THEN 'Senior'
        WHEN salary >= 70000 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS level
FROM staff;

-- ─────────────────────────────────────────
-- WINDOW FUNCTIONS
-- ─────────────────────────────────────────
-- ROW_NUMBER — Unique row number per partition
SELECT name, salary, dept_id,
    ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS row_num
FROM staff;

-- RANK — Rank with gaps for ties
SELECT name, salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM staff;

-- DENSE_RANK — Rank without gaps
SELECT name, salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM staff;

-- LAG — Previous row's value
SELECT name, salary,
    LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM staff;

-- LEAD — Next row's value
SELECT name, salary,
    LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM staff;

-- Running Total
SELECT name, salary,
    SUM(salary) OVER (ORDER BY salary) AS running_total
FROM staff;

-- ─────────────────────────────────────────
-- INDEXES
-- ─────────────────────────────────────────
CREATE INDEX idx_staff_name ON staff(name);          -- Single column index
CREATE INDEX idx_dept_salary ON staff(dept_id, salary);  -- Composite index
SHOW INDEX FROM staff;                               -- View indexes on a table
DROP INDEX idx_staff_name ON staff;                  -- Remove index

-- ─────────────────────────────────────────
-- TRANSACTIONS
-- ─────────────────────────────────────────
START TRANSACTION;

UPDATE staff SET salary = salary + 5000 WHERE name = 'Priya';
UPDATE staff SET salary = salary - 5000 WHERE name = 'Rajan';

-- If everything is correct:
COMMIT;

-- If something went wrong:
-- ROLLBACK;

-- SAVEPOINT — Partial rollback
START TRANSACTION;
SAVEPOINT before_update;
UPDATE staff SET salary = 999999 WHERE name = 'Sahil';
ROLLBACK TO before_update;  -- Undo only this change
COMMIT;

-- ─────────────────────────────────────────
-- DATA CLEANING & NULL HANDLING
-- ─────────────────────────────────────────
-- Find NULL values
SELECT * FROM staff WHERE dept_id IS NULL;

-- Replace NULL with a default
SELECT name, IFNULL(dept_id, 0) AS dept FROM staff;
SELECT name, COALESCE(dept_id, 0) AS dept FROM staff;  -- More versatile

-- Remove leading/trailing spaces from data
UPDATE staff SET name = TRIM(name);

-- Standardize casing
UPDATE staff SET name = UPPER(name);

-- Delete duplicate rows (keep lowest id)
DELETE s1 FROM staff s1
INNER JOIN staff s2
WHERE s1.id > s2.id AND s1.name = s2.name;

-- ─────────────────────────────────────────
-- QUERY OPTIMIZATION BASICS
-- ─────────────────────────────────────────
-- Use EXPLAIN to analyze query performance
EXPLAIN SELECT * FROM staff WHERE dept_id = 1;

-- Tips:
-- ✅ Use indexes on frequently filtered columns
-- ✅ Avoid SELECT * — select only needed columns
-- ✅ Use LIMIT when you don't need all rows
-- ✅ Avoid functions on indexed columns in WHERE clause
-- ❌ WHERE YEAR(created_at) = 2024  (slow — disables index)
-- ✅ WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31' (fast)

-- ─────────────────────────────────────────
-- DATABASE DESIGN & NORMALIZATION
-- ─────────────────────────────────────────

-- ❌ BAD (Unnormalized) — Data redundancy
-- | order_id | customer_name | customer_email   | product   | price |
-- | 1        | Sahil         | sahil@email.com  | Laptop    | 55000 |
-- | 2        | Sahil         | sahil@email.com  | Phone     | 25000 |

-- ✅ GOOD (3NF) — Separate tables with foreign keys
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100),
    email       VARCHAR(100) UNIQUE
);

CREATE TABLE orders_clean (
    order_id    INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product     VARCHAR(100),
    price       DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

---

## 🧠 Quick Reference — Cheat Sheet

```sql
-- ── DATABASE ──────────────────────────────────
SHOW DATABASES;
CREATE DATABASE dbname;
USE dbname;
DROP DATABASE dbname;

-- ── TABLE ─────────────────────────────────────
SHOW TABLES;
DESCRIBE tablename;
DROP TABLE tablename;
TRUNCATE TABLE tablename;    -- Delete all rows, keep structure

-- ── CRUD ──────────────────────────────────────
INSERT INTO t (col1, col2) VALUES (v1, v2);
SELECT col1, col2 FROM t WHERE condition;
UPDATE t SET col = value WHERE condition;
DELETE FROM t WHERE condition;

-- ── FILTERING ─────────────────────────────────
WHERE col = val
WHERE col != val
WHERE col > val
WHERE col BETWEEN a AND b
WHERE col IN (a, b, c)
WHERE col LIKE 'pattern%'
WHERE col IS NULL
WHERE col IS NOT NULL
AND / OR / NOT

-- ── SORTING & LIMITING ────────────────────────
ORDER BY col ASC|DESC
LIMIT n
LIMIT offset, count

-- ── AGGREGATION ───────────────────────────────
COUNT(*) / SUM(col) / AVG(col) / MAX(col) / MIN(col)
GROUP BY col
HAVING condition

-- ── JOINS ─────────────────────────────────────
INNER JOIN t2 ON t1.id = t2.id
LEFT JOIN  t2 ON t1.id = t2.id
RIGHT JOIN t2 ON t1.id = t2.id

-- ── ADVANCED ──────────────────────────────────
WITH cte AS (SELECT ...) SELECT * FROM cte;
CREATE VIEW vname AS SELECT ...;
CREATE INDEX iname ON t(col);
EXPLAIN SELECT ...;
START TRANSACTION; ... COMMIT; / ROLLBACK;

-- ── STRING ────────────────────────────────────
UPPER() / LOWER() / LENGTH() / TRIM()
CONCAT() / SUBSTRING() / REPLACE()

-- ── DATE ──────────────────────────────────────
NOW() / CURDATE() / CURTIME()
YEAR() / MONTH() / DAY()
DATEDIFF() / DATE_FORMAT()

-- ── NULL ──────────────────────────────────────
IS NULL / IS NOT NULL
IFNULL(col, default)
COALESCE(col1, col2, default)

-- ── WINDOW ────────────────────────────────────
ROW_NUMBER() OVER (PARTITION BY col ORDER BY col)
RANK()       OVER (ORDER BY col DESC)
DENSE_RANK() OVER (ORDER BY col DESC)
LAG(col)     OVER (ORDER BY col)
LEAD(col)    OVER (ORDER BY col)
SUM(col)     OVER (ORDER BY col)
```

---

## 🎯 Interview Practice Queries

```sql
-- Q1: Find the 2nd highest salary
SELECT MAX(salary) FROM staff
WHERE salary < (SELECT MAX(salary) FROM staff);

-- OR using DENSE_RANK
SELECT salary FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM staff
) ranked
WHERE rnk = 2;

-- Q2: Find employees earning above department average
SELECT s.name, s.salary, s.dept_id
FROM staff s
WHERE s.salary > (
    SELECT AVG(salary) FROM staff s2 WHERE s2.dept_id = s.dept_id
);

-- Q3: Count employees per department including departments with 0
SELECT d.dept_name, COUNT(s.staff_id) AS headcount
FROM departments d
LEFT JOIN staff s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

-- Q4: Find duplicate names
SELECT name, COUNT(*) FROM staff
GROUP BY name HAVING COUNT(*) > 1;

-- Q5: Top 3 earners per department
SELECT name, salary, dept_id FROM (
    SELECT name, salary, dept_id,
           DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM staff
) ranked
WHERE rnk <= 3;

-- Q6: Running total of salaries ordered by hire order
SELECT name, salary,
    SUM(salary) OVER (ORDER BY staff_id) AS running_total
FROM staff;

-- Q7: Find staff with no department (LEFT JOIN)
SELECT s.name FROM staff s
LEFT JOIN departments d ON s.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- Q8: Department with highest average salary
SELECT d.dept_name, AVG(s.salary) AS avg_sal
FROM staff s
INNER JOIN departments d ON s.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_sal DESC
LIMIT 1;
```

---

## 📊 Real-World Data Analytics Queries

```sql
-- Assume a sales table for analytics
CREATE TABLE sales (
    sale_id    INT AUTO_INCREMENT PRIMARY KEY,
    product    VARCHAR(100),
    region     VARCHAR(50),
    amount     DECIMAL(10,2),
    sale_date  DATE
);

-- Monthly revenue trend
SELECT YEAR(sale_date) AS yr, MONTH(sale_date) AS mo,
       SUM(amount) AS monthly_revenue
FROM sales
GROUP BY yr, mo
ORDER BY yr, mo;

-- Top 5 products by revenue
SELECT product, SUM(amount) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 5;

-- Revenue by region with percentage share
SELECT region,
       SUM(amount) AS revenue,
       ROUND(SUM(amount) * 100 / (SELECT SUM(amount) FROM sales), 2) AS pct_share
FROM sales
GROUP BY region
ORDER BY revenue DESC;

-- Month-over-month growth using LAG
SELECT mo, monthly_revenue,
       LAG(monthly_revenue) OVER (ORDER BY mo) AS prev_month,
       ROUND((monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY mo))
             / LAG(monthly_revenue) OVER (ORDER BY mo) * 100, 2) AS growth_pct
FROM (
    SELECT MONTH(sale_date) AS mo, SUM(amount) AS monthly_revenue
    FROM sales GROUP BY mo
) monthly;
```

---

<div align="center">

---

**⭐ If this helped you, star this repo and share it with your friends! ⭐**

*Made with ❤️ by **SK SAHIL** — Freelance AI Developer & Coding Tutor*

*Graduated from German University with Excellence Grade · Working in 4 Startups*

---

</div>
