-- e13. List the employee who trained the greatest number of receptionists.

WITH TrainerCounts AS (
    SELECT
        e.TrainedByID AS TrainerID,
        COUNT(*)      AS ReceptionistCount
    FROM EMPLOYEE AS e
    WHERE
        e.EType = 'Recept'
        AND e.TrainedByID IS NOT NULL
    GROUP BY
        e.TrainedByID
),
RankedTrainers AS (
    SELECT
        TrainerID,
        ReceptionistCount,
        RANK() OVER (ORDER BY ReceptionistCount DESC) AS TrainerRank
    FROM TrainerCounts
)
SELECT
    p.FName,
    p.LName,
    rt.TrainerID      AS EmployeeID,
    rt.ReceptionistCount
FROM RankedTrainers AS rt
JOIN PERSON        AS p ON p.PersonID = rt.TrainerID
WHERE
    rt.TrainerRank = 1;
