USE imdb_movies;

# Queries
# Query One: The frequency of each rating.
DROP VIEW IF EXISTS RatingFrequency;
CREATE VIEW RatingFrequency AS
SELECT averageRating, COUNT(averageRating) AS numberOfOccurences, COUNT(averageRating) / (SELECT COUNT(averageRating) FROM Ratings) as percentage
FROM Ratings
GROUP BY averageRating 
ORDER BY averageRating DESC;

SELECT * FROM RatingFrequency;

