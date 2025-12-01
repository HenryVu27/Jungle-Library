-- Query 8: Find the year with the maximum number of books borrowed.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    EXTRACT(YEAR FROM IssueDate) AS Year,
    COUNT(*) AS BooksBorrowed
FROM BORROWED
GROUP BY EXTRACT(YEAR FROM IssueDate)
ORDER BY BooksBorrowed DESC
LIMIT 1;
