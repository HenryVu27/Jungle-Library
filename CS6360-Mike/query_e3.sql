-- e3. Find the average number of books borrowed by the top five
--     gold members in the library.

WITH GoldBorrowCounts AS (
    SELECT
        m.MemberID AS MemberID,
        COUNT(*)   AS BorrowCount
    FROM MEMBER   AS m
    JOIN BORROWED AS b ON b.MemberID = m.MemberID
    WHERE
        m.Level = 'Gold'
        AND b.IssueDate >= CURRENT_DATE - INTERVAL '1' MONTH
    GROUP BY
        m.MemberID
),
Top5Gold AS (
    SELECT
        MemberID,
        BorrowCount
    FROM GoldBorrowCounts
    ORDER BY
        BorrowCount DESC
    LIMIT 5
)
SELECT
    AVG(BorrowCount) AS AvgBooksBorrowed
FROM
    Top5Gold;
