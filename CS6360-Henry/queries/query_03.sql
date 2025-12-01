-- Query 3: Find the average number of books borrowed by the top five gold members.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    AVG(borrow_count) AS AvgBooksBorrowed
FROM (
    SELECT
        m.MemberID,
        COUNT(br.BorrowedID) AS borrow_count
    FROM MEMBER m
    JOIN BORROWED br ON m.MemberID = br.MemberID
    WHERE m.Level = 'Gold'
    GROUP BY m.MemberID
    ORDER BY borrow_count DESC
    LIMIT 5
) AS top_five_gold;
