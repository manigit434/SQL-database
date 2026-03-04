-- ==================================================
-- Problem: 184. Department Highest Salary
-- Link: https://leetcode.com/problems/department-highest-salary/
-- Difficulty: Medium
-- Concepts: JOIN, GROUP BY, MAX, Subquery
-- ==================================================

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
JOIN (
    SELECT departmentId, MAX(salary) AS max_salary
    FROM Employee
    GROUP BY departmentId
) m
    ON e.departmentId = m.departmentId
   AND e.salary = m.max_salary;
