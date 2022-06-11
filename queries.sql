USE imdb_movies;

# Queries
# The frequency of each rating
CREATE VIEW RatingFrequency AS
SELECT averageRating, COUNT(averageRating) AS numberOfOccurences, COUNT(averageRating) / (SELECT COUNT(averageRating) FROM Ratings) as percentage
FROM Ratings
GROUP BY averageRating 
ORDER BY averageRating DESC;

SELECT * FROM RatingFrequency;