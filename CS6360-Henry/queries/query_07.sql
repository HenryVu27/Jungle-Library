-- Query 7: Find the Gold Member with the greatest number of guests.
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS MemberName,
    m.MemberID,
    COUNT(g.GuestID) AS GuestCount
FROM MEMBER m
JOIN PERSON p ON m.MemberID = p.PersonID
JOIN GUEST g ON m.MemberID = g.GuestOfID
WHERE m.Level = 'Gold'
GROUP BY m.MemberID, p.FName, p.MName, p.LName
ORDER BY GuestCount DESC
LIMIT 1;
