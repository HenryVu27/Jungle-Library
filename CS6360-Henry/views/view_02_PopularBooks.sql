-- View 2: PopularBooks - Most borrowed books over the past year
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

CREATE OR REPLACE VIEW PopularBooks AS
SELECT
    bk.BookID,
    bk.BookTitle,
    pub.PublisherName,
    COUNT(br.BorrowedID) AS BorrowCount
FROM BOOK bk
JOIN PUBLISHER pub ON bk.PublisherID = pub.PublisherID
JOIN BORROWED br ON bk.BookID = br.BookID
WHERE br.IssueDate >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY bk.BookID, bk.BookTitle, pub.PublisherName
HAVING COUNT(br.BorrowedID) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(BorrowedID) AS cnt
        FROM BORROWED
        WHERE IssueDate >= CURRENT_DATE - INTERVAL '1 year'
        GROUP BY BookID
    ) AS counts
);
