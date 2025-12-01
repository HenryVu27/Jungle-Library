-- ActiveReceptionist - This view returns the names of receptionists who
-- resolved more than 5 inquiries from members in the past month.

CREATE VIEW ActiveReceptionist AS
SELECT
    p.FName AS FirstName,
    p.LName AS LastName,
    e.EmployeeID,
    COUNT(*) AS ClosedInquiryCount
FROM EMPLOYEE AS e
JOIN INQUIRY  AS i
    ON i.ReceptID = e.EmployeeID
JOIN PERSON   AS p
    ON p.PersonID = e.EmployeeID
WHERE
    e.EType = 'Recept'
    AND i.Status = 'closed'
    AND i.InquiryTime >= CURRENT_DATE - INTERVAL '1' MONTH
GROUP BY
    FirstName,
    LastName,
    e.EmployeeID
HAVING
    ClosedInquiryCount > 5;
ORDER BY 
    ClosedInquiryCount DESC;
