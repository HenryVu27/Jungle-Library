-- e5. Find names of books that were not borrowed in the last 5 months.

SELECT
    b.BookID,
    b.BookTitle
FROM BOOK AS b
WHERE NOT EXISTS (
    SELECT 1
    FROM BORROWED AS bo
    WHERE bo.BookID = b.BookID
      AND bo.IssueDate >= CURRENT_DATE - INTERVAL '5' MONTH
);
