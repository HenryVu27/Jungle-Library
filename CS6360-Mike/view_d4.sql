-- PotentialGoldMember - This view returns the name, phone number and ID
-- of the silver members who borrowed books every month in the past year.

-- Assumption: return only the first phone number listed if multiple.

CREATE VIEW PotentialGoldMember AS
WITH SilverMonthlyCounts AS (
    SELECT
        m.MemberID AS MemberID,
        EXTRACT(YEAR  FROM b.IssueDate) AS BorrowYear,
        EXTRACT(MONTH FROM b.IssueDate) AS BorrowMonth
    FROM MEMBER   AS m
    JOIN BORROWED AS b
        ON b.MemberID = m.MemberID
    WHERE
        m.Level = 'Silver'
        AND b.IssueDate >= CURRENT_DATE - INTERVAL '1' YEAR
    GROUP BY
        MemberID,
        BorrowYear,
        BorrowMonth
),
SilverWith12Months AS (
    SELECT
        MemberID
    FROM SilverMonthlyCounts
    GROUP BY
        MemberID
    HAVING
        COUNT(*) >= 12
)
SELECT
    p.FName AS FirstName,
    p.LName AS LastName,
    MIN(ph.PhoneNumber) AS PhoneNumber,
    m.MemberID
FROM SilverWith12Months AS s
JOIN MEMBER            AS m
    ON m.MemberID = s.MemberID
JOIN PERSON            AS p
    ON p.PersonID = m.MemberID
LEFT JOIN PHONE        AS ph
    ON ph.PersonID = m.MemberID
GROUP BY
    FirstName,
    LastName,
    MemberID;
    
