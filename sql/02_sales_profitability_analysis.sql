-- 02_sales_profitability_analysis.sql
-- Run after loading staging.sample_superstore_sales.
-- These are reproducible descriptive queries, not causal analyses.

-- 1. Baseline totals and distinct entities.
SELECT
    COUNT(*) AS order_lines,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT product_id) AS products,
    SUM(sales) AS sales_total,
    SUM(profit) AS recorded_profit_total,
    SUM(quantity) AS units_total,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging.sample_superstore_sales;

-- 2. Average order value: aggregate order lines to order grain first.
WITH order_totals AS (
    SELECT order_id, SUM(sales) AS order_sales
    FROM staging.sample_superstore_sales
    GROUP BY order_id
)
SELECT
    COUNT(*) AS order_count,
    AVG(order_sales) AS average_order_value,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY order_sales) AS median_order_value
FROM order_totals;

-- 3. Monthly performance.
SELECT
    DATE_TRUNC('month', order_date)::date AS order_month,
    SUM(sales) AS sales,
    SUM(profit) AS recorded_profit,
    SUM(quantity) AS units,
    COUNT(DISTINCT order_id) AS orders,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging.sample_superstore_sales
GROUP BY 1
ORDER BY 1;

-- 4. Category and subcategory performance.
SELECT
    category,
    sub_category,
    SUM(sales) AS sales,
    SUM(profit) AS recorded_profit,
    SUM(quantity) AS units,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin,
    COUNT(*) AS order_lines
FROM staging.sample_superstore_sales
GROUP BY category, sub_category
ORDER BY sales DESC;

-- 5. Geographic performance. These are regions/states/cities, not stores.
SELECT
    region,
    state,
    city,
    SUM(sales) AS sales,
    SUM(profit) AS recorded_profit,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin,
    COUNT(DISTINCT order_id) AS orders
FROM staging.sample_superstore_sales
GROUP BY region, state, city
ORDER BY sales DESC;

-- 6. Discount bands. Descriptive association only; this does not prove causality.
SELECT
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.10 THEN '>0% to 10%'
        WHEN discount <= 0.20 THEN '>10% to 20%'
        WHEN discount <= 0.30 THEN '>20% to 30%'
        WHEN discount <= 0.50 THEN '>30% to 50%'
        ELSE '>50%'
    END AS discount_band,
    COUNT(*) AS order_lines,
    SUM(sales) AS sales,
    SUM(profit) AS recorded_profit,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging.sample_superstore_sales
GROUP BY 1
ORDER BY MIN(discount);

-- 7. Products with negative recorded profit.
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    SUM(sales) AS sales,
    SUM(profit) AS recorded_profit,
    SUM(quantity) AS units,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM staging.sample_superstore_sales
GROUP BY product_id, product_name, category, sub_category
HAVING SUM(profit) < 0
ORDER BY recorded_profit ASC;

-- 8. Reconciliation check: row count and core totals.
SELECT
    COUNT(*) AS rows_loaded,
    COUNT(DISTINCT row_id) AS distinct_row_ids,
    SUM(sales) AS sales_total,
    SUM(profit) AS recorded_profit_total,
    SUM(quantity) AS units_total
FROM staging.sample_superstore_sales;
