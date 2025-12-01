-- Query 11: Find receptionists with an average rating of 4.0 from resolved inquiries.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS ReceptionistName,
    AVG(i.Rating) AS AvgRating
FROM EMPLOYEE e
JOIN PERSON p ON e.EmployeeID = p.PersonID
JOIN INQUIRY i ON e.EmployeeID = i.ReceptID
WHERE e.EType = 'Receptionist'
  AND i.Status IN ('Resolved', 'Closed')
  AND i.Rating IS NOT NULL
GROUP BY e.EmployeeID, p.FName, p.MName, p.LName
HAVING AVG(i.Rating) >= 4.0;
