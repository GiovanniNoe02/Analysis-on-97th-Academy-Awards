-- QUERY 1 and 2: Which is the best movie based on ratings? --

-- show the Oscars' Best Picture winner
SELECT O.title, ratingAverage, imdbRating, tmdbRating, rottenTomatoesRating, metacriticRating, imdbVotes, tmdbVotes, popularity
FROM movies_DB AS M JOIN oscars_df AS O ON M.imdbID = O.imdbID
WHERE award = 'Best Picture' AND winner = 'True'

-- show all the movies ordered by ratingAverage
SELECT title, ratingAverage, imdbRating, tmdbRating, rottenTomatoesRating, metacriticRating, imdbVotes, tmdbVotes, popularity
FROM movies_DB
ORDER BY ratingAverage DESC


-- QUERY 3 and 4: Which is the best movie based on ratings for each Oscars category? --

-- for every category show movie with highest ratingAverage and sort descending
SELECT *
FROM (
SELECT award, M.title, ratingAverage
FROM movies_DB AS M JOIN oscars_df AS O ON M.imdbID = O.imdbID
ORDER BY award, ratingAverage DESC
)
GROUP BY award;

-- show actual winner for each category
SELECT award, O.title, ratingAverage
FROM movies_DB AS M JOIN oscars_df AS O
ON M.imdbID = O.imdbID
WHERE O.winner == 'True'
ORDER BY award;


--Query 5 and 6: Which is the most mentioned movie in Reddit comments for each Oscars category? --

-- for every category show movie with highest mentionsCount and sort descending
SELECT *
FROM (
SELECT award, C.title, mentionsCount
FROM counts_df AS C JOIN oscars_df AS O
ON C.imdbID = O.imdbID
ORDER BY award, mentionsCount DESC
)
GROUP BY award;

-- show actual winner for each category
SELECT award, C.title, mentionsCount
FROM counts_df AS C JOIN oscars_df AS O
ON C.imdbID = O.imdbID
WHERE O.winner == 'True'
ORDER BY award;