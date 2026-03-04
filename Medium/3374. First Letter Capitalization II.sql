-- ==================================================
-- Problem: 3374. First Letter Capitalization II
-- Link: https://leetcode.com/problems/first-letter-capitalization-ii/
-- Difficulty: Medium
-- Concepts: String Manipulation, Recursive CTE, SUBSTRING, UPPER, LOWER, GROUP_CONCAT
-- ==================================================

WITH RECURSIVE seq AS (
    SELECT 1 AS pos
    UNION ALL
    SELECT pos + 1
    FROM seq
    WHERE pos < 1000
)

SELECT
    u.content_id,
    u.content_text AS original_text,
    GROUP_CONCAT(
        CASE
            WHEN s.pos = 1 THEN UPPER(SUBSTRING(LOWER(u.content_text), s.pos, 1))
            WHEN SUBSTRING(LOWER(u.content_text), s.pos - 1, 1) IN (' ', '-')
                THEN UPPER(SUBSTRING(LOWER(u.content_text), s.pos, 1))
            ELSE SUBSTRING(LOWER(u.content_text), s.pos, 1)
        END
        ORDER BY s.pos
        SEPARATOR ''
    ) AS converted_text
FROM user_content u
JOIN seq s
    ON s.pos <= LENGTH(u.content_text)
GROUP BY u.content_id, u.content_text
ORDER BY u.content_id;
