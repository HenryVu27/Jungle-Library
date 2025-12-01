-- Query 5: Find names of books that were not borrowed in the last 5 months.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    bk.BookTitle
FROM BOOK bk
WHERE NOT EXISTS (
    SELECT 1
    FROM BORROWED br
    WHERE br.BookID = bk.BookID
      AND br.IssueDate >= CURRENT_DATE - INTERVAL '5 months'
);
