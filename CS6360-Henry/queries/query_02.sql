-- Query 2: Find names of employees who are also members and their borrowed books (past month).
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS EmployeeName,
    bk.BookTitle,
    br.IssueDate
FROM EMPLOYEE e
JOIN MEMBER m ON e.EmployeeID = m.MemberID
JOIN PERSON p ON e.EmployeeID = p.PersonID
JOIN BORROWED br ON m.MemberID = br.MemberID
JOIN BOOK bk ON br.BookID = bk.BookID
WHERE br.IssueDate >= CURRENT_DATE - INTERVAL '1 month';
