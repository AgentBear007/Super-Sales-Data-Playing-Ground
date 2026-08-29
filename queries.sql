-- ============================================
-- Retail Sales & Profit Analysis — SQL Queries
-- Dataset: Superstore Sales
-- ============================================

-- 1. See only what you need: specific columns
SELECT "Customer Name", "Sales", "Profit" 
FROM "Super Store sales" 
LIMIT 10;

-- 2. Filter orders by region
SELECT * 
FROM "Super Store sales" 
WHERE "Region" = 'South';

-- 3. Find the biggest orders by sales
SELECT "Customer Name", "Sales" 
FROM "Super Store sales" 
ORDER BY "Sales" DESC 
LIMIT 5;

-- 4. Total sales and order count per region
SELECT "Region", 
       SUM("Sales") AS total_sales, 
       COUNT(*) AS num_orders
FROM "Super Store sales"
GROUP BY "Region"
ORDER BY total_sales DESC;

-- 5. Which category loses the most profit on discounted orders
SELECT "Category", 
       SUM("Profit") AS total_profit
FROM "Super Store sales"
WHERE "Discount" > 0
GROUP BY "Category"
ORDER BY total_profit ASC;

-- 6. Top 3 most profitable products within each category
-- (uses a window function to rank, then a CTE to filter the rank)
WITH ranked_products AS (
  SELECT "Category", "Product Name", "Profit",
         RANK() OVER (PARTITION BY "Category" ORDER BY "Profit" DESC) AS profit_rank
  FROM "Super Store sales"
)
SELECT * 
FROM ranked_products 
WHERE profit_rank <= 3;

-- 7. Monthly sales with a running total over time
WITH monthly_sales AS (
  SELECT DATE_TRUNC('month', TO_DATE("Order Date", 'DD/MM/YYYY')) AS month,
         SUM("Sales") AS total_sales
  FROM "Super Store sales"
  GROUP BY DATE_TRUNC('month', TO_DATE("Order Date", 'DD/MM/YYYY'))
)
SELECT month, 
       total_sales,
       SUM(total_sales) OVER (ORDER BY month) AS running_total
FROM monthly_sales
ORDER BY month;

-- 8. Month-over-month sales growth (%)
-- Reveals a recurring seasonal spike every September and November
WITH monthly_sales AS (
  SELECT DATE_TRUNC('month', TO_DATE("Order Date", 'DD/MM/YYYY')) AS month,
         SUM("Sales") AS total_sales
  FROM "Super Store sales"
  GROUP BY DATE_TRUNC('month', TO_DATE("Order Date", 'DD/MM/YYYY'))
)
SELECT month, 
       total_sales,
       LAG(total_sales) OVER (ORDER BY month) AS previous_month_sales,
       ROUND(
         ((total_sales - LAG(total_sales) OVER (ORDER BY month))
         / LAG(total_sales) OVER (ORDER BY month) * 100)::numeric, 1
       ) AS pct_growth
FROM monthly_sales
ORDER BY month;
