-- Query 6: Find members who have borrowed all books by the most popular author.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

WITH MostPopularAuthor AS (
    SELECT
        wb.AuthorID
    FROM WRITTENBY wb
    JOIN BORROWED br ON wb.BookID = br.BookID
    GROUP BY wb.AuthorID
    ORDER BY COUNT(*) DESC
    LIMIT 1
),
BooksOfMostPopularAuthor AS (
    SELECT wb.BookID
    FROM WRITTENBY wb
    WHERE wb.AuthorID = (SELECT AuthorID FROM MostPopularAuthor)
)
SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS MemberName,
    m.MemberID
FROM MEMBER m
JOIN PERSON p ON m.MemberID = p.PersonID
WHERE NOT EXISTS (
    -- Find any book by the most popular author that this member hasn't borrowed
    SELECT 1
    FROM BooksOfMostPopularAuthor bpa
    WHERE NOT EXISTS (
        SELECT 1
        FROM BORROWED br
        WHERE br.MemberID = m.MemberID
          AND br.BookID = bpa.BookID
    )
);
