-- View 5: ActiveReceptionist - Receptionists who resolved > 5 inquiries in past month
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

CREATE OR REPLACE VIEW ActiveReceptionist AS
SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS ReceptionistName
FROM EMPLOYEE e
JOIN PERSON p ON e.EmployeeID = p.PersonID
WHERE e.EType = 'Receptionist'
  AND (
      SELECT COUNT(*)
      FROM INQUIRY i
      WHERE i.ReceptID = e.EmployeeID
        AND i.Status IN ('Resolved', 'Closed')
        AND i.InquiryTime >= CURRENT_DATE - INTERVAL '1 month'
  ) > 5;
