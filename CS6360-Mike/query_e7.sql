-- e7. Find the Gold Member with the greatest number of guests.

WITH GoldGuestCounts AS (
    SELECT
        m.MemberID,
        COUNT(g.GuestID) AS GuestCount
    FROM MEMBER AS m
    LEFT JOIN GUEST AS g ON g.GuestofID = m.MemberID
    WHERE
        m.Level = 'Gold'
    GROUP BY
        m.MemberID
),
TopGold AS (
    SELECT
        MemberID,
        GuestCount,
        RANK() OVER (ORDER BY GuestCount DESC) AS GuestRank
    FROM GoldGuestCounts
)
SELECT
    p.FName,
    p.LName,
    tg.MemberID,
    tg.GuestCount
FROM TopGold AS tg
JOIN PERSON  AS p ON p.PersonID = tg.MemberID
WHERE
    tg.GuestRank = 1;
