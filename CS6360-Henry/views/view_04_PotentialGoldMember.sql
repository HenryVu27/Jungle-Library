-- View 4: PotentialGoldMember - Silver members who borrowed every month in past year
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

CREATE OR REPLACE VIEW PotentialGoldMember AS
SELECT
    p.PersonID AS MemberID,
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS Name,
    ph.PhoneNumber
FROM MEMBER m
JOIN PERSON p ON m.MemberID = p.PersonID
LEFT JOIN PHONE ph ON p.PersonID = ph.PersonID
WHERE m.Level = 'Silver'
  AND (
      SELECT COUNT(DISTINCT DATE_TRUNC('month', b.IssueDate))
      FROM BORROWED b
      WHERE b.MemberID = m.MemberID
        AND b.IssueDate >= CURRENT_DATE - INTERVAL '1 year'
  ) = 12;
