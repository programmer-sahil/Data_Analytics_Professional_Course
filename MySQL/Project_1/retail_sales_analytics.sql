-- ============================================================
-- PROJECT: Retail Sales Analytics using MySQL
-- TOOL: MySQL Workbench (MySQL 8.0+ recommended)
-- PURPOSE: Beginner-friendly SQL data analytics project
-- ============================================================

-- ------------------------------------------------------------
-- PART 1: CREATE AND SELECT THE DATABASE
-- ------------------------------------------------------------
-- A database stores related tables in one place.
CREATE DATABASE IF NOT EXISTS retail_sales_analytics;

-- USE tells MySQL which database should receive our commands.
USE retail_sales_analytics;


-- ------------------------------------------------------------
-- PART 2: RESET OLD OBJECTS
-- ------------------------------------------------------------
-- These commands make the script reusable.
-- The child table, order_items, is dropped before its parent tables.
DROP VIEW IF EXISTS completed_sales_details;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;


-- ------------------------------------------------------------
-- PART 3: CREATE TABLES
-- ------------------------------------------------------------

-- Each row represents one customer.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL
);

-- DECIMAL is used for money because it stores exact decimal values.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Each row represents one order.
-- customer_id is a foreign key that connects an order to a customer.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- One order may contain several products.
-- This table creates a many-to-many relationship between orders and products.
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_items_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_items_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ------------------------------------------------------------
-- PART 4: INSERT SAMPLE DATA
-- ------------------------------------------------------------

INSERT INTO customers
    (customer_id, customer_name, city, signup_date)
VALUES
    (1, 'Aisha Khan', 'Kolkata', '2026-01-05'),
    (2, 'Rahul Das', 'Howrah', '2026-01-10'),
    (3, 'Priya Sen', 'Kolkata', '2026-01-15'),
    (4, 'Arjun Roy', 'Hooghly', '2026-02-01'),
    (5, 'Neha Gupta', 'Howrah', '2026-02-10'),
    (6, 'Imran Ali', 'Kolkata', '2026-02-12'),
    (7, 'Sneha Pal', 'Hooghly', '2026-03-01'),
    (8, 'Rohan Ghosh', 'Kolkata', '2026-03-11'),
    (9, 'Fatima Noor', 'Howrah', '2026-03-18'),
    (10, 'Kabir Singh', 'Hooghly', '2026-04-02');

INSERT INTO products
    (product_id, product_name, category, price)
VALUES
    (1, 'Laptop Bag', 'Accessories', 1200.00),
    (2, 'Wireless Mouse', 'Electronics', 800.00),
    (3, 'Mechanical Keyboard', 'Electronics', 2500.00),
    (4, 'USB-C Hub', 'Electronics', 1800.00),
    (5, 'Notebook', 'Stationery', 150.00),
    (6, 'Pen Set', 'Stationery', 300.00),
    (7, 'Headphones', 'Electronics', 2200.00),
    (8, 'Water Bottle', 'Lifestyle', 600.00),
    (9, 'Desk Lamp', 'Lifestyle', 1400.00),
    (10, 'Phone Stand', 'Accessories', 500.00),
    (11, 'Webcam', 'Electronics', 2000.00);

INSERT INTO orders
    (order_id, customer_id, order_date, payment_method, order_status)
VALUES
    (1001, 1, '2026-01-10', 'UPI', 'Completed'),
    (1002, 2, '2026-01-12', 'Card', 'Completed'),
    (1003, 3, '2026-01-20', 'COD', 'Cancelled'),
    (1004, 1, '2026-02-05', 'UPI', 'Completed'),
    (1005, 4, '2026-02-08', 'Card', 'Completed'),
    (1006, 5, '2026-02-14', 'UPI', 'Pending'),
    (1007, 6, '2026-02-18', 'COD', 'Completed'),
    (1008, 2, '2026-03-02', 'Card', 'Completed'),
    (1009, 7, '2026-03-07', 'UPI', 'Completed'),
    (1010, 3, '2026-03-12', 'Card', 'Completed'),
    (1011, 8, '2026-03-19', 'UPI', 'Cancelled'),
    (1012, 5, '2026-03-21', 'COD', 'Completed'),
    (1013, 9, '2026-04-04', 'UPI', 'Completed'),
    (1014, 6, '2026-04-10', 'Card', 'Completed'),
    (1015, 4, '2026-04-15', 'UPI', 'Pending'),
    (1016, 8, '2026-04-20', 'COD', 'Completed');

-- unit_price records the actual price charged when the order was placed.
INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
    (1, 1001, 2, 1, 800.00),
    (2, 1001, 5, 2, 150.00),
    (3, 1002, 3, 1, 2500.00),
    (4, 1002, 4, 1, 1800.00),
    (5, 1003, 7, 1, 2200.00),
    (6, 1004, 1, 1, 1200.00),
    (7, 1004, 6, 2, 300.00),
    (8, 1005, 9, 1, 1400.00),
    (9, 1005, 8, 1, 600.00),
    (10, 1006, 10, 2, 500.00),
    (11, 1007, 7, 1, 2200.00),
    (12, 1007, 5, 3, 150.00),
    (13, 1008, 2, 2, 800.00),
    (14, 1008, 10, 1, 500.00),
    (15, 1009, 3, 1, 2500.00),
    (16, 1009, 5, 5, 150.00),
    (17, 1010, 4, 1, 1800.00),
    (18, 1010, 7, 1, 2200.00),
    (19, 1011, 1, 1, 1200.00),
    (20, 1012, 8, 2, 600.00),
    (21, 1012, 6, 1, 300.00),
    (22, 1013, 1, 2, 1200.00),
    (23, 1013, 10, 2, 500.00),
    (24, 1014, 9, 1, 1400.00),
    (25, 1014, 2, 1, 800.00),
    (26, 1015, 3, 1, 2500.00),
    (27, 1016, 7, 1, 2200.00),
    (28, 1016, 4, 1, 1800.00),
    (29, 1016, 10, 1, 500.00);


-- ------------------------------------------------------------
-- PART 5: BASIC DATA CHECKS
-- ------------------------------------------------------------

-- * means "all columns."
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

-- COUNT counts rows.
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_orders FROM orders;

-- WHERE filters rows before displaying them.
SELECT *
FROM orders
WHERE order_status = 'Completed'
ORDER BY order_date;


-- ------------------------------------------------------------
-- PART 6: BUSINESS ANALYSIS
-- ------------------------------------------------------------

-- QUERY 1: What is the total revenue from completed orders?
-- Revenue for one item = quantity * unit_price.
SELECT
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';


-- QUERY 2: How many orders are in each status?
SELECT
    order_status,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY order_status
ORDER BY number_of_orders DESC;


-- QUERY 3: How much revenue was earned each month?
-- DATE_FORMAT converts 2026-01-10 into 2026-01.
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS monthly_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;


-- QUERY 4: Which product categories generate the most revenue?
SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS category_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;


-- QUERY 5: What are the five best-selling products by revenue?
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS product_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY product_revenue DESC
LIMIT 5;


-- QUERY 6: Who are the top customers by total spending?
SELECT
    c.customer_name,
    c.city,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_spent DESC
LIMIT 5;


-- QUERY 7: Which city generates the most revenue?
SELECT
    c.city,
    COUNT(DISTINCT o.order_id) AS completed_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS city_revenue
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.city
ORDER BY city_revenue DESC;


-- QUERY 8: What is the average completed order value?
-- The inner query first calculates the total of every completed order.
-- The outer query then calculates the average of those order totals.
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.order_id
) AS completed_order_totals;


-- QUERY 9: Which customers have never placed an order?
-- LEFT JOIN keeps every customer, even if a matching order does not exist.
SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- QUERY 10: Which products have never appeared in a completed order?
SELECT
    p.product_id,
    p.product_name,
    p.category
FROM products AS p
LEFT JOIN order_items AS oi
    ON p.product_id = oi.product_id
LEFT JOIN orders AS o
    ON oi.order_id = o.order_id
    AND o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
HAVING COUNT(o.order_id) = 0;


-- ------------------------------------------------------------
-- PART 7: CREATE A REUSABLE VIEW
-- ------------------------------------------------------------
-- A view is a saved SELECT query. It does not duplicate the original data.
CREATE VIEW completed_sales_details AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS line_revenue
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';

-- The view can now be queried like a table.
SELECT *
FROM completed_sales_details
ORDER BY order_date, order_id;


-- ------------------------------------------------------------
-- PART 8: OPTIONAL ADVANCED QUERY FOR MYSQL 8.0+
-- ------------------------------------------------------------
-- DENSE_RANK gives each product a position inside its own category.
WITH product_sales AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS product_revenue
    FROM products AS p
    JOIN order_items AS oi
        ON p.product_id = oi.product_id
    JOIN orders AS o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY p.category, p.product_id, p.product_name
)
SELECT
    category,
    product_name,
    ROUND(product_revenue, 2) AS product_revenue,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY product_revenue DESC
    ) AS category_rank
FROM product_sales
ORDER BY category, category_rank, product_name;


-- ------------------------------------------------------------
-- PART 9: OPTIONAL PERFORMANCE IMPROVEMENT
-- ------------------------------------------------------------
-- Indexes help MySQL find matching rows faster in larger datasets.
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_status ON orders(order_status);
CREATE INDEX idx_items_order_id ON order_items(order_id);
CREATE INDEX idx_items_product_id ON order_items(product_id);

