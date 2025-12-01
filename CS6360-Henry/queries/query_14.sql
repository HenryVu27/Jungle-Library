-- Query 14: List Cataloging Managers who cataloged all categories every week (past 4 weeks).
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

WITH WeeklyCategories AS (
    SELECT
        c.ManagerID,
        DATE_TRUNC('week', c.CatalogDate) AS week,
        COUNT(DISTINCT c.Category) AS categories_cataloged
    FROM CATALOGS c
    WHERE c.CatalogDate >= CURRENT_DATE - INTERVAL '4 weeks'
    GROUP BY c.ManagerID, DATE_TRUNC('week', c.CatalogDate)
)
SELECT
    p.FName || ' ' || COALESCE(p.MName || ' ', '') || p.LName AS ManagerName,
    e.EmployeeID
FROM EMPLOYEE e
JOIN PERSON p ON e.EmployeeID = p.PersonID
WHERE e.EType = 'Manager'
  AND (
      SELECT COUNT(*)
      FROM WeeklyCategories wc
      WHERE wc.ManagerID = e.EmployeeID
        AND wc.categories_cataloged = 3  -- All 3 categories
  ) = 4;  -- In all 4 weeks
