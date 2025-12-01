-- e6. Find the members who have borrowed all the books written by the
--     most popular author.

WITH AuthorBorrowCounts AS (
    SELECT
        w.AuthorID AS AuthorID,
        COUNT(*)   AS BorrowCount
    FROM WRITTENBY AS w
    JOIN BORROWED  AS bo ON bo.BookID = w.BookID
    GROUP BY
        w.AuthorID
),
TopAuthor AS (
    SELECT
        AuthorID
    FROM (
        SELECT
            AuthorID,
            BorrowCount,
            RANK() OVER (ORDER BY BorrowCount DESC) AS AuthorRank
        FROM AuthorBorrowCounts
    ) AS ranked
    WHERE AuthorRank = 1
),
BooksByTopAuthor AS (
    SELECT DISTINCT
        w.BookID
    FROM WRITTENBY AS w
    JOIN TopAuthor AS ta ON ta.AuthorID = w.AuthorID
),
MembersWhoBorrowAll AS (
    SELECT
        m.MemberID
    FROM MEMBER AS m
    WHERE NOT EXISTS (
        SELECT 1
        FROM BooksByTopAuthor AS bta
        WHERE NOT EXISTS (
            SELECT 1
            FROM BORROWED AS bo
            WHERE bo.MemberID = m.MemberID
              AND bo.BookID   = bta.BookID
        )
    )
)
SELECT
    p.FName,
    p.LName,
    m.MemberID
FROM MembersWhoBorrowAll AS mwa
JOIN MEMBER AS m ON m.MemberID  = mwa.MemberID
JOIN PERSON AS p ON p.PersonID  = m.MemberID;
