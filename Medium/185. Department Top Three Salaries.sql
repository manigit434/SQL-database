-- ==================================================
-- Problem: 185. Department Top Three Salaries
-- Link: https://leetcode.com/problems/department-top-three-salaries/
-- Difficulty: Medium
-- Concepts: Window Functions, DENSE_RANK, PARTITION BY, JOIN
-- ==================================================

SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.salary AS Salary
FROM (
    SELECT 
        departmentId, 
        name, 
        salary, 
        DENSE_RANK() OVER (
            PARTITION BY departmentId 
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
) e
JOIN Department d 
    ON e.departmentId = d.id
WHERE e.rnk <= 3;
