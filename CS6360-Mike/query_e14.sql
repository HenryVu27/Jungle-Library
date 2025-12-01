-- e14. List the Cataloging Managers who cataloged all categories
--      every week in the past 4 weeks.

-- Assumption: all categories = all distinct Category values in CATALOGS
-- Assumption: past 4 weeks = last 4 calendar weeks from today

WITH AllCategories AS (
    SELECT DISTINCT
        c.Category
    FROM CATALOGS AS c
),
CategoryCount AS (
    SELECT
        COUNT(*) AS TotalCategories
    FROM AllCategories
),
RecentCatalogs AS (
    SELECT
        c.ManagerID,
        EXTRACT(YEAR FROM c.CatalogDate) AS CatalogYear,
        EXTRACT(WEEK FROM c.CatalogDate) AS CatalogWeek,
        c.Category
    FROM CATALOGS AS c
    JOIN EMPLOYEE AS e ON e.EmployeeID = c.ManagerID
    WHERE
        e.EType = 'Manager'
        AND c.CatalogDate >= CURRENT_DATE - INTERVAL '4' WEEK
),
ManagerWeekCategoryCounts AS (
    SELECT
        ManagerID,
        CatalogYear,
        CatalogWeek,
        COUNT(DISTINCT Category) AS CategoryCount
    FROM RecentCatalogs
    GROUP BY
        ManagerID,
        CatalogYear,
        CatalogWeek
),
ManagerWeeksWithAllCategories AS (
    SELECT
        mw.ManagerID,
        mw.CatalogYear,
        mw.CatalogWeek
    FROM ManagerWeekCategoryCounts AS mw,
         CategoryCount             AS cc
    WHERE
        mw.CategoryCount = cc.TotalCategories
),
ManagersWith4Weeks AS (
    SELECT
        ManagerID
    FROM ManagerWeeksWithAllCategories
    GROUP BY
        ManagerID
    HAVING
        COUNT(*) >= 4
)
SELECT
    p.FName,
    p.LName,
    e.EmployeeID
FROM ManagersWith4Weeks AS mw
JOIN EMPLOYEE          AS e ON e.EmployeeID = mw.ManagerID
JOIN PERSON            AS p ON p.PersonID  = e.EmployeeID;
