-- Query 9: Find the names of members who borrowed the most popular books.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

WITH MostPopularBooks AS (
    SELECT BookID
    FROM BORROWED
    GROUP BY BookID
    HAVING COUNT(*) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM BORROWED
            GROUP BY BookID
        ) AS counts
    )
)
SELECT DISTINCT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS MemberName
FROM MEMBER m
JOIN PERSON p ON m.MemberID = p.PersonID
JOIN BORROWED br ON m.MemberID = br.MemberID
WHERE br.BookID IN (SELECT BookID FROM MostPopularBooks);
