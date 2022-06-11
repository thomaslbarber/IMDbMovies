# Create the database.
DROP DATABASE IF EXISTS imdb_movies;
CREATE DATABASE imdb_movies;
USE imdb_movies;


DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies(
	tconst VARCHAR(100),
    titleType VARCHAR(100),
    primaryTitle VARCHAR(7000),
    originalTitle VARCHAR(7000),
    isAdult BOOLEAN,
    startYear VARCHAR(100),
    EndYear VARCHAR(100),
    runtimeMinutes INT,
    genres VARCHAR(300)
);


DROP TABLE IF EXISTS Ratings;
CREATE TABLE Ratings(
	tconst VARCHAR(100),
    averageRating FLOAT,
    numVotes INT
);

LOAD DATA INFILE 'D:\Projects\\SQL\\IMDbMoviesTSVs\\ratings.tsv' INTO TABLE Ratings
  FIELDS TERMINATED BY '\t'
  ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES;
  
SELECT * FROM Ratings;

LOAD DATA INFILE 'D:\Projects\\SQL\\IMDbMoviesTSVs\\basics.tsv' INTO TABLE Movies
	FIELDS TERMINATED BY '\t'
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
