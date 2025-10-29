-- 1. CREATE TABLE
CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  order_date  DATE,
  amount      NUMERIC(10,2),
  product_id  INTEGER
);



-- 2. VERIFY IMPORT
SELECT COUNT(*) AS total_rows FROM orders;
SELECT * FROM orders LIMIT 5;

-- 3. MONTHLY TREND ANALYSIS
SELECT
  EXTRACT(YEAR FROM order_date)  AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount)                     AS total_revenue,
  COUNT(DISTINCT order_id)        AS total_orders
FROM
  orders
GROUP BY
  order_year,
  order_month
ORDER BY
  order_year,
  order_month;