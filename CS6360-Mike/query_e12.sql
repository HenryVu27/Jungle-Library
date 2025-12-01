-- d12. Find the names of receptionists and their trainers who resolved
--      at least 2 inquiries every month in the past 3 months.

WITH RecentInquiries AS (
    SELECT
        e.EmployeeID,
        e.TrainedByID,
        EXTRACT(YEAR  FROM i.InquiryTime) AS InquiryYear,
        EXTRACT(MONTH FROM i.InquiryTime) AS InquiryMonth,
        COUNT(*) AS InquiryCount
    FROM EMPLOYEE AS e
    JOIN INQUIRY  AS i ON i.ReceptID = e.EmployeeID
    WHERE
        e.EType = 'Recept'
        AND i.Status = 'closed'
        AND i.InquiryTime >= CURRENT_DATE - INTERVAL '3' MONTH
    GROUP BY
        e.EmployeeID,
        e.TrainedByID,
        InquiryYear,
        InquiryMonth
),
ReceptionistsWith3Months AS (
    SELECT
        EmployeeID,
        TrainedByID
    FROM RecentInquiries
    WHERE
        InquiryCount >= 2
    GROUP BY
        EmployeeID,
        TrainedByID
    HAVING
        COUNT(*) >= 3
)
SELECT
    pr.FName AS ReceptFirstName,
    pr.LName AS ReceptLastName,
    tr.FName AS TrainerFirstName,
    tr.LName AS TrainerLastName
--    r.EmployeeID AS ReceptionistID,
--    r.TrainedByID AS TrainerID
FROM ReceptionistsWith3Months AS r
JOIN PERSON AS pr ON pr.PersonID = r.EmployeeID
JOIN PERSON AS tr ON tr.PersonID = r.TrainedByID;
