-- ==================================================
-- Problem: 3421. Find Students Who Improved
-- Link: https://leetcode.com/problems/find-students-who-improved/
-- Difficulty: Medium
-- Concepts: Window Functions, ROW_NUMBER, PARTITION BY, JOIN, String/Date Ordering
-- ==================================================

WITH RankedScores AS (
    SELECT 
        student_id, 
        subject, 
        score,
        -- Rank 1 is the first exam (earliest date)
        ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC) as first_rank,
        -- Rank 1 is the latest exam (latest date)
        ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date DESC) as latest_rank
    FROM Scores
)
SELECT 
    f.student_id, 
    f.subject, 
    f.score AS first_score, 
    l.score AS latest_score
FROM RankedScores f
JOIN RankedScores l 
    ON f.student_id = l.student_id 
    AND f.subject = l.subject
WHERE f.first_rank = 1     -- Get the first exam
  AND l.latest_rank = 1    -- Get the latest exam
  AND f.score < l.score    -- Condition: improvement shown
ORDER BY student_id, subject;
