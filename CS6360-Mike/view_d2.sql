-- PopularBooks - This view returns the details of the most borrowed
-- books over the past year.

-- Assumption: most borrowed books = those borrowed at least 4 times

CREATE VIEW PopularBooks AS
SELECT
    b.BookID,
    b.BookTitle,
    p.PublisherName,
    COUNT(*) AS BorrowCount
FROM BOOK      AS b
JOIN PUBLISHER AS p
    ON p.PublisherID = b.PublisherID
JOIN BORROWED  AS bo
    ON bo.BookID = b.BookID
WHERE
    bo.IssueDate >= CURRENT_DATE - INTERVAL '1' YEAR
GROUP BY
    b.BookID,
    b.BookTitle,
    p.PublisherName
HAVING
    BorrowCount >= 4;
ORDER BY
    BorrowCount DESC;
