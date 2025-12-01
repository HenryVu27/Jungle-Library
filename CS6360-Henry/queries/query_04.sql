-- Query 4: Find publishers and the title of their most popular book.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    pub.PublisherName,
    bk.BookTitle,
    book_counts.BorrowCount
FROM PUBLISHER pub
JOIN BOOK bk ON pub.PublisherID = bk.PublisherID
JOIN (
    SELECT
        br.BookID,
        COUNT(*) AS BorrowCount,
        RANK() OVER (
            PARTITION BY b.PublisherID
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM BORROWED br
    JOIN BOOK b ON br.BookID = b.BookID
    GROUP BY br.BookID, b.PublisherID
) AS book_counts ON bk.BookID = book_counts.BookID
WHERE book_counts.rnk = 1;
