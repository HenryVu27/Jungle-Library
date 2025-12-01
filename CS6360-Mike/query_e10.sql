-- d10. List all the employees that have enrolled into gold membership
--      within a month of being employed.

WITH MemberEnrollDate AS (
    SELECT
        MemberID,
        MIN(IssueDate) AS EnrollDate
    FROM LIBCARD
    GROUP BY
        MemberID
)
SELECT
    p.FName,
    p.LName,
    e.EmployeeID,
    e.StartDate,
    med.EnrollDate
FROM EMPLOYEE        AS e
JOIN MEMBER          AS m   ON m.MemberID  = e.EmployeeID
JOIN MemberEnrollDate AS med ON med.MemberID = m.MemberID
JOIN PERSON          AS p   ON p.PersonID  = e.EmployeeID
WHERE
    m.Level = 'Gold'
    AND med.EnrollDate BETWEEN e.StartDate
                           AND (e.StartDate + INTERVAL '1' MONTH);
