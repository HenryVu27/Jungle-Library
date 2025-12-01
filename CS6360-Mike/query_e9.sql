-- d9. Find the names of members who borrowed the most popular books.

WITH BookBorrowCounts AS (
    SELECT
        b.BookID,
        COUNT(*) AS BorrowCount
    FROM BOOK     AS b
    JOIN BORROWED AS bo ON bo.BookID = b.BookID
    GROUP BY
        b.BookID
),
TopBooks AS (
    SELECT
        BookID,
        BorrowCount,
        RANK() OVER (ORDER BY BorrowCount DESC) AS BookRank
    FROM BookBorrowCounts
)
SELECT DISTINCT
    p.FName,
    p.LName,
    m.MemberID
FROM TopBooks AS tb
JOIN BORROWED AS bo ON bo.BookID   = tb.BookID
JOIN MEMBER   AS m  ON m.MemberID  = bo.MemberID
JOIN PERSON   AS p  ON p.PersonID  = m.MemberID
WHERE
    tb.BookRank = 1;
