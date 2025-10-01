ALTER TABLE movies_DB
ADD COLUMN ratingAverage NUMERIC;

UPDATE movies_DB
SET ratingAverage = (COALESCE(imdbRating, 0) + COALESCE(tmdbRating, 0) + COALESCE(rottenTomatoesRating, 0) + COALESCE(metacriticRating, 0))/
(CASE 	WHEN imdbRating IS NOT NULL THEN 1 ELSE 0 END +
 CASE   WHEN tmdbRating IS NOT NULL THEN 1 ELSE 0 END +
CASE	WHEN rottenTomatoesRating IS NOT NULL THEN 1 ELSE 0 END +
CASE	WHEN metacriticRating IS NOT NULL THEN 1 ELSE 0 END
);