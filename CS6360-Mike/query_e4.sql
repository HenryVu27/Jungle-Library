-- e4. Find the name of the publishers and the title of the most
--     popular book for each publisher.

WITH BookBorrowCounts AS (
    SELECT
        b.BookID,
        b.BookTitle,
        b.PublisherID,
        COUNT(*) AS BorrowCount
    FROM BOOK     AS b
    JOIN BORROWED AS bo ON bo.BookID = b.BookID
    GROUP BY
        b.BookID,
        b.BookTitle,
        b.PublisherID
),
RankedBooks AS (
    SELECT
        BookID,
        BookTitle,
        PublisherID,
        BorrowCount,
        RANK() OVER (PARTITION BY PublisherID
                     ORDER BY BorrowCount DESC) AS BorrowRank
    FROM BookBorrowCounts
)
SELECT
    p.PublisherName,
    rb.BookTitle,
    rb.BorrowCount
FROM RankedBooks AS rb
JOIN PUBLISHER  AS p ON p.PublisherID = rb.PublisherID
WHERE
    rb.BorrowRank = 1;
