-- Find user with most ratings
    -- if there is a tie return the smallest name
-- find movie with highest average rating in Feb 2020


-- select user as result
-- where count in movierating table is most

-- get counts for each user and how many rating s they have done using group by
-- order by desc and get the top

SELECT *
FROM (
    SELECT TOP 1 u.name AS results
    FROM MovieRating mr
    JOIN Users u ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
) AS most_user

UNION all

SELECT *
FROM (
    SELECT TOP 1 m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON m.movie_id = mr.movie_id
    WHERE created_at >= CAST('2020-02-01' AS DATE) AND created_at <= CAST('2020-02-29' AS DATE)
    GROUP BY m.title
    ORDER BY AVG(CAST(mr.rating AS DECIMAL)) DESC, m.title ASC
) AS most_movie

ORDER BY results ASC;
