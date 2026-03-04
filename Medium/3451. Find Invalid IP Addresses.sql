-- ==================================================
-- Problem: 3451. Find Invalid IP Addresses
-- Link: https://leetcode.com/problems/find-invalid-ip-addresses/
-- Difficulty: Medium
-- Concepts: Regular Expressions, COUNT, GROUP BY, Filtering, String Validation
-- ==================================================

SELECT 
    ip, 
    COUNT(*) AS invalid_count
FROM 
    logs
WHERE 
    -- Filter for IPs that DO NOT match the valid IPv4 pattern
    ip NOT REGEXP '^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$'
GROUP BY 
    ip
ORDER BY 
    invalid_count DESC, 
    ip DESC;
