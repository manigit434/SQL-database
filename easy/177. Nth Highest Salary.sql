-- ==================================================
-- Problem: 177. Nth Highest Salary
-- Difficulty: Medium
-- Concepts: DISTINCT, ORDER BY, LIMIT, User-Defined Function
-- ==================================================

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE offset_val INT;
    SET offset_val = N - 1;

    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT offset_val, 1
    );
END;
