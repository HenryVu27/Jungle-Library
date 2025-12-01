-- TopGoldMember - This view returns the First Name, Last Name and Date of 
-- membership enrollment of those members who have borrowed more than 5 books
-- in the past month.

-- Assumption:  use LIBCARD.IssueDate as the membership enrollment date

CREATE VIEW TopGoldMembers AS
WITH MemberBorrowCounts AS (
    SELECT
        m.MemberID                AS MemberID,
        COUNT(*)                  AS BorrowCount,
        lc.IssueDate              AS EnrollmentDate
    FROM MEMBER   AS m
    JOIN BORROWED AS b
        ON b.MemberID = m.MemberID
    JOIN LIBCARD  AS lc
        ON lc.MemberID = m.MemberID
    WHERE
        EnrollmentDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
	and m.Level = 'Gold'
    GROUP BY
        m.MemberID
)
SELECT
    p.FName,
    p.LName,
    mbc.EnrollmentDate
FROM MemberBorrowCounts AS mbc
JOIN PERSON AS p
    ON p.PersonID = mbc.MemberID
WHERE
    mbc.BorrowCount > 5;
