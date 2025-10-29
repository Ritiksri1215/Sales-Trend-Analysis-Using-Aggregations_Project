# Sales Trend Analysis Using Aggregations_Project

Task-6: Sales Trend Analysis (SQL Project)

Objective:

To analyze monthly revenue and order volume from online sales data using SQL aggregation and date functions.

Tools Used:

Database: PostgreSQL

Interface: pgAdmin 4 / SQL Shell (psql)

Dataset: online_sales.csv (imported directly into the orders table)

Table Creation

CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  order_date  DATE,
  amount      NUMERIC(10,2),
  product_id  INTEGER
);

Data Import

The data was directly imported into the orders table (not using pgAdmin Import tool).
The CSV file contained columns — order_id, order_date, amount, and product_id.

After import:

SELECT COUNT(*) AS total_rows FROM orders;

SELECT * FROM orders LIMIT 5;

Monthly Trend Analysis Query:

SELECT
  EXTRACT(YEAR FROM order_date)  AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount)                    AS total_revenue,
  COUNT(DISTINCT order_id)       AS total_orders
FROM
  orders
GROUP BY
  order_year,
  order_month
ORDER BY
  order_year,
  order_month;

🔹 Groups data by year and month
🔹 Calculates total revenue using SUM(amount)
🔹 Counts unique orders using COUNT(DISTINCT order_id)
🔹 Sorts results in chronological order

Result / Observation:

The query successfully displayed monthly sales trends for the year 2025.
Each month’s total revenue and number of orders were correctly calculated, showing variations in sales volume and revenue.
The results highlighted seasonal changes in customer purchasing behavior.

Key Learnings:

Using EXTRACT() for time-based grouping

Applying aggregate functions like SUM() and COUNT()

Understanding GROUP BY and ORDER BY usage

Data validation using COUNT(*) and preview queries

Generating insights from real-world sales data

