-- View 1: TopGoldMember - Gold members who borrowed > 5 books in past month
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

CREATE OR REPLACE VIEW TopGoldMember AS
SELECT
    p.FName AS FirstName,
    p.LName AS LastName,
    lc.IssueDate AS MembershipEnrollmentDate
FROM MEMBER m
JOIN PERSON p ON m.MemberID = p.PersonID
JOIN LIBCARD lc ON m.MemberID = lc.MemberID
WHERE m.Level = 'Gold'
  AND m.MemberID IN (
      SELECT b.MemberID
      FROM BORROWED b
      WHERE b.IssueDate >= CURRENT_DATE - INTERVAL '1 month'
      GROUP BY b.MemberID
      HAVING COUNT(*) > 5
  );

