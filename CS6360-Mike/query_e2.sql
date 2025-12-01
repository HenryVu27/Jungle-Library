-- e2. Find the names of employees who are also members and the books
--     they have borrowed in the past month.

SELECT
    p.FName,
    p.LName,
    e.EmployeeID,
    b.BorrowedID,
    bk.BookID,
    bk.BookTitle,
    b.IssueDate
FROM EMPLOYEE AS e
JOIN MEMBER   AS m  ON m.MemberID  = e.EmployeeID
JOIN PERSON   AS p  ON p.PersonID  = e.EmployeeID
JOIN BORROWED AS b  ON b.MemberID  = m.MemberID
JOIN BOOK     AS bk ON bk.BookID   = b.BookID
WHERE
    b.IssueDate >= CURRENT_DATE - INTERVAL '1' MONTH;
