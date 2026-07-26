# Retail Sales Analytics Using MySQL

A beginner-friendly SQL data analytics project for MySQL Workbench. It creates a normalized retail database, inserts sample data, and answers practical business questions using SQL.

## Skills demonstrated

- Database and table creation
- Primary and foreign keys
- Data insertion
- Filtering and sorting
- Aggregate functions: `COUNT`, `SUM`, and `AVG`
- `INNER JOIN` and `LEFT JOIN`
- `GROUP BY`, `HAVING`, and subqueries
- Views, common table expressions, and window functions
- Basic indexing

## Database structure

| Relationship | Meaning |
|---|---|
| One customer → many orders | A customer may place several orders |
| One order → many order items | An order may contain several products |
| One product → many order items | A product may appear in several orders |

## Project files

```text
retail-sales-sql-project/
├── README.md
├── CLASS_TEACHING_GUIDE.md
└── sql/
    └── retail_sales_analytics.sql
```

## How to run in MySQL Workbench

1. Start **MySQL Server**.
2. Open **MySQL Workbench**.
3. Open your local MySQL connection.
4. Select **File → Open SQL Script**.
5. Open `sql/retail_sales_analytics.sql`.
6. Click the lightning-bolt **Execute** button to run the whole file.
7. In the left **SCHEMAS** panel, click Refresh.
8. Expand `retail_sales_analytics` to see the tables and view.
9. Read the result grids shown below the SQL editor.

The script safely resets its own project tables, so it can be run again.

## Recommended beginner method

Do not run everything immediately while learning. Highlight and execute one part at a time:

1. Parts 1–2: create and select the database.
2. Part 3: create the four tables.
3. Part 4: insert sample data.
4. Part 5: check the data.
5. Part 6: run each analysis query separately.
6. Parts 7–9: create a view, rank products, and add indexes.

On macOS, execute selected SQL with `Command + Shift + Enter`. On Windows, use `Ctrl + Shift + Enter`, or use the lightning buttons in Workbench.

## Business questions answered

1. What is the total completed revenue?
2. How many orders are completed, pending, or cancelled?
3. What is the monthly revenue?
4. Which category earns the most revenue?
5. Which five products perform best?
6. Who are the top customers?
7. Which city generates the most sales?
8. What is the average completed order value?
9. Which customer has never ordered?
10. Which product has no completed sale?

## Main findings

- Total completed revenue is **₹32,800**.
- March 2026 is the strongest month with **₹10,850**.
- Electronics is the strongest category with **₹20,200**.
- Headphones is the top product with **₹6,600** in revenue.
- Rahul Das is the top customer with **₹6,400** in spending.
- Kolkata is the strongest city with **₹16,250** in revenue.

These results are descriptive findings from the included practice dataset, not real commercial data.

## Common beginner errors

| Error | Fix |
|---|---|
| `No database selected` | Run `USE retail_sales_analytics;` |
| `Table already exists` | Run the complete script from Part 1 |
| Foreign-key insertion error | Insert customers and products before orders and order items |
| Red underline near `DENSE_RANK` | Use MySQL 8.0 or newer |
| Schema is not visible | Refresh the **SCHEMAS** panel |
| No result is visible | Run one `SELECT` statement and check the Result Grid |

## Push this project to GitHub

Create a new empty repository on GitHub named `retail-sales-sql-analytics`. Do not add a README on GitHub because this project already has one.

Open Terminal inside this project folder and run:

```bash
git init
git add .
git commit -m "Add MySQL retail sales analytics project"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/retail-sales-sql-analytics.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username. If Git asks you to sign in, complete the browser authentication.

## Suggested GitHub repository description

> Beginner-friendly retail sales analytics project using MySQL, featuring joins, aggregation, subqueries, views, CTEs, and window functions.

## Suggested classroom introduction

> Today we will act as junior data analysts for a retail business. We have customer, product, order, and order-item data. Our goal is to use SQL to convert these raw rows into useful business information such as revenue, best products, top customers, and monthly performance.

## Author

SK Sahil

