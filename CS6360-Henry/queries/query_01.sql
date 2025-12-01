-- Query 1: List the details of all the supervisors hired in the past two months.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    p.PersonID,
    p.FName,
    p.MName,
    p.LName,
    p.Address,
    p.Gender,
    p.DateOfBirth,
    e.StartDate,
    e.EType
FROM EMPLOYEE e
JOIN PERSON p ON e.EmployeeID = p.PersonID
WHERE e.EType = 'Supervisor'
  AND e.StartDate >= CURRENT_DATE - INTERVAL '2 months';
