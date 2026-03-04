-- ==================================================
-- Problem: 1907. Count Salary Categories
-- Link: https://leetcode.com/problems/count-salary-categories/
-- Difficulty: Easy
-- Concepts: CASE WHEN, UNION, Aggregation, COUNT
-- ==================================================

-- Count for Low Salary
SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION

-- Count for Average Salary
SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION

-- Count for High Salary
SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000;
