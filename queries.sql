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


# Query Two: All Movies.
DROP VIEW IF EXISTS Movies;
CREATE VIEW Movies AS
SELECT tconst, primaryTitle, originalTitle, isAdult, startYear, runtimeMinutes, genres
FROM Media
WHERE titleType = "movie";

SELECT * FROM Movies;


# Query Three: Join Movies and Ratings together.
DROP VIEW IF EXISTS MoviesWithRatings;
CREATE VIEW MoviesWithRatings AS
SELECT a.tconst as id, primaryTitle, startYear, runtimeMinutes, genres, averageRating, numVotes
FROM Movies AS a
INNER JOIN (
	SELECT *
    FROM Ratings
) AS b ON a.tconst = b.tconst;

SELECT * FROM MoviesWithRatings;


# Query Four: Incorporate a minimum vote count (100,000 votes) for movies to be included.
DROP VIEW IF EXISTS MoviesWithRatingsMinimumVoteCount;
CREATE VIEW MoviesWithRatingsMinimumVoteCount AS
SELECT *
FROM MoviesWithRatings
GROUP BY id
HAVING numVotes >= 100000;

SELECT * FROM MoviesWithRatingsMinimumVoteCount;


# Query Five: 10 highest rated movies of 2021.
DROP VIEW IF EXISTS BestMovies2021;
CREATE VIEW BestMovies2021 AS
SELECT * FROM
MoviesWithRatingsMinimumVoteCount
WHERE startYear = 2021
ORDER BY averageRating DESC
LIMIT 10;

SELECT * FROM BestMovies2021;
