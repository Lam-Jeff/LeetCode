# Write your MySQL query statement below
with countRatingByUser as (
    SELECT name
    , count(rating) as cntRating
    FROM Movies, Users, MovieRating
    WHERE MovieRating.movie_id = Movies.movie_id
    AND MovieRating.user_id = Users.user_id
    GROUP BY name
    ORDER BY cntRating DESC, name ASC
    LIMIT 1
)
, countAVGRating as (
    SELECT title
    , AVG(MovieRating.rating) as avgRating
    FROM MovieRating
    JOIN Movies
    ON MovieRating.movie_id = Movies.movie_id
    AND MONTH(created_at) = 2 
    AND YEAR(created_at) = 2020
    GROUP BY title
    ORDER BY avgRating DESC, title ASC
    LIMIT 1
)

SELECT name as results
FROM  countRatingByUser
UNION ALL
SELECT title as results
FROM countAVGRating
