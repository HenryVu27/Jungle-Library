-- Query 12: Find receptionists and trainers who resolve >= 2 inquiries every month (past 3 months).
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

WITH MonthlyInquiryCounts AS (
    SELECT
        i.ReceptID,
        DATE_TRUNC('month', i.InquiryTime) AS month,
        COUNT(*) AS inquiry_count
    FROM INQUIRY i
    WHERE i.Status IN ('Resolved', 'Closed')
      AND i.InquiryTime >= CURRENT_DATE - INTERVAL '3 months'
    GROUP BY i.ReceptID, DATE_TRUNC('month', i.InquiryTime)
)
SELECT
    p_recept.FName || ' ' || COALESCE(p_recept.MName || ' ', '') || p_recept.LName AS ReceptionistName,
    p_trainer.FName || ' ' || COALESCE(p_trainer.MName || ' ', '') || p_trainer.LName AS TrainerName
FROM EMPLOYEE e_recept
JOIN PERSON p_recept ON e_recept.EmployeeID = p_recept.PersonID
JOIN TRAINER t ON e_recept.TrainedByID = t.TrainerID
JOIN EMPLOYEE e_trainer ON t.TrainerID = e_trainer.EmployeeID
JOIN PERSON p_trainer ON e_trainer.EmployeeID = p_trainer.PersonID
WHERE e_recept.EType = 'Receptionist'
  AND (
      SELECT COUNT(*)
      FROM MonthlyInquiryCounts mic
      WHERE mic.ReceptID = e_recept.EmployeeID
        AND mic.inquiry_count >= 2
  ) = 3;  -- Must have >= 2 inquiries in all 3 months
