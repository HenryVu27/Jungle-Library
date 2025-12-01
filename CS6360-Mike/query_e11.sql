-- d11. Find the names of receptionists with an average rating of 4.0
--      from the inquiries they resolved.

SELECT
    p.FName,
    p.LName,
    e.EmployeeID,
    AVG(i.Rating) AS AvgRating
FROM EMPLOYEE AS e
JOIN INQUIRY  AS i ON i.ReceptID = e.EmployeeID
JOIN PERSON   AS p ON p.PersonID = e.EmployeeID
WHERE
    e.EType  = 'Recept'
    AND i.Status = 'closed'
GROUP BY
    p.FName,
    p.LName,
    e.EmployeeID
HAVING
    AVG(i.Rating) >= 4.0;
