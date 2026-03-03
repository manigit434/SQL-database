-- ==================================================
-- Problem: 1045. Customers Who Bought All Products
-- Difficulty: Medium
-- Concepts: GROUP BY, HAVING, Subquery
-- ==================================================

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) =
       (SELECT COUNT(*) FROM Product);
