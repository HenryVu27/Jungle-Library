-- e8. Find the year with the maximum number of books borrowed.

WITH YearCounts AS (
    SELECT
        EXTRACT(YEAR FROM bo.IssueDate) AS BorrowYear,
        COUNT(*)                        AS BorrowCount
    FROM BORROWED AS bo
    GROUP BY
        EXTRACT(YEAR FROM bo.IssueDate)
),
RankedYears AS (
    SELECT
        BorrowYear,
        BorrowCount,
        RANK() OVER (ORDER BY BorrowCount DESC) AS YearRank
    FROM YearCounts
)
SELECT
    BorrowYear,
    BorrowCount
FROM RankedYears
WHERE
    YearRank = 1;
