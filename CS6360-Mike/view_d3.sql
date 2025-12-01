-- BestRatingPublisher – This view returns the names of publishers
-- whose books have at least a 4.0 average rating score.

CREATE VIEW BestRatingPublisher AS
SELECT
    p.PublisherID,
    p.PublisherName,
    AVG(r.Rating) AS AvgRating
FROM PUBLISHER AS p
JOIN BOOK      AS b
    ON b.PublisherID = p.PublisherID
JOIN REVIEW    AS r
    ON r.BookID = b.BookID
GROUP BY
    p.PublisherID,
    p.PublisherName
HAVING
    AvgRating >= 4.0;
    
