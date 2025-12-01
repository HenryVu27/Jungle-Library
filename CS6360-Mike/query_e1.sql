-- e1. List the details of all the supervisors of the library
--     hired in the past two months.

SELECT
    p.FName,
    p.LName,
    e.EmployeeID,
    e.StartDate,
    e.EType
FROM EMPLOYEE AS e
JOIN PERSON   AS p ON p.PersonID = e.EmployeeID
WHERE
    e.EType = 'Supervisor'
    AND e.StartDate >= CURRENT_DATE - INTERVAL '2' MONTH;
