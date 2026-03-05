-- ==================================================
-- Problem: Product Sales Analysis III
-- Link: https://leetcode.com/problems/product-sales-analysis-iii/ 
-- Difficulty: Medium
-- Concepts: JOIN, GROUP BY, Subquery, Aggregation
-- ==================================================

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN (
    -- Find the first year each product was sold
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) t
ON s.product_id = t.product_id
AND s.year = t.first_year;
