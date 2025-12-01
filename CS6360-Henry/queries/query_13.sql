-- Query 13: List the employee who trained the greatest number of receptionists.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS TrainerName,
    e_trainer.EType,
    COUNT(e_recept.EmployeeID) AS ReceptionistsTrained
FROM TRAINER t
JOIN EMPLOYEE e_trainer ON t.TrainerID = e_trainer.EmployeeID
JOIN PERSON p ON e_trainer.EmployeeID = p.PersonID
JOIN EMPLOYEE e_recept ON e_recept.TrainedByID = t.TrainerID
WHERE e_recept.EType = 'Receptionist'
GROUP BY t.TrainerID, p.FName, p.MName, p.LName, e_trainer.EType
ORDER BY ReceptionistsTrained DESC
LIMIT 1;
