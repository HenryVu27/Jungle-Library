-- View 3: BestRatingPublisher - Publishers whose ALL books have >= 4.0 avg rating
-- Jungle Library Database - Phase III
-- Authors: Mike Barron (dal436283), Henry Vu (ddv240000)

CREATE OR REPLACE VIEW BestRatingPublisher AS
SELECT
    pub.PublisherName
FROM PUBLISHER pub
WHERE NOT EXISTS (
    -- Find any book by this publisher with avg rating < 4.0
    SELECT 1
    FROM BOOK bk
    WHERE bk.PublisherID = pub.PublisherID
      AND (
          SELECT AVG(c.Rating)
          FROM COMMENT c
          WHERE c.BookID = bk.BookID
      ) < 4.0
)
AND EXISTS (
    -- Ensure the publisher has at least one book with ratings
    SELECT 1
    FROM BOOK bk
    JOIN COMMENT c ON bk.BookID = c.BookID
    WHERE bk.PublisherID = pub.PublisherID
);
