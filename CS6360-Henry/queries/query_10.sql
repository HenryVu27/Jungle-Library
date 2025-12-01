-- Query 10: List employees who enrolled into gold membership within a month of being employed.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS EmployeeName,
    e.StartDate AS EmploymentStartDate,
    lc.IssueDate AS MembershipDate
FROM EMPLOYEE e
JOIN MEMBER m ON e.EmployeeID = m.MemberID
JOIN PERSON p ON e.EmployeeID = p.PersonID
JOIN LIBCARD lc ON m.MemberID = lc.MemberID
WHERE m.Level = 'Gold'
  AND lc.IssueDate <= e.StartDate + INTERVAL '1 month';
