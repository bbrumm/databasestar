/*
Answers for practice questions for Sample Movie Database
*/

/*
Question 1
*/

SELECT
person_id,
person_name
FROM person;

/*
Question 2
*/

SELECT
p.person_name,
mc.character_name,
m.title
FROM person p
INNER JOIN movie_cast mc ON mc.person_id = p.person_id
INNER JOIN movie m ON mc.movie_id = m.movie_id;

/*
Question 3
Show all crew members with their department in all movies.
*/

SELECT
p.person_name,
mc.job,
m.title
FROM person p
INNER JOIN movie_crew mc ON mc.person_id = p.person_id
INNER JOIN movie m ON mc.movie_id = m.movie_id;


/*
Question 4
*/

SELECT DISTINCT
p.person_name
FROM person p
INNER JOIN movie_cast ca ON p.person_id = ca.person_id
INNER JOIN movie_crew cr ON p.person_id = cr.person_id;


/*
 * Question 5
 */


SELECT
person_name,
COUNT(*)
FROM (
	SELECT
	p.person_name,
	mc.character_name
	FROM person p
	INNER JOIN movie_cast mc ON p.person_id = mc.person_id
	WHERE character_name LIKE '%(uncredited)%'
) s
GROUP BY person_name
ORDER BY COUNT(*) DESC;


/*
Question 6
*/

SELECT
g.genre_name,
COUNT(*)
FROM genre g
INNER JOIN movie_genres mg ON g.genre_id = mg.genre_id 
INNER JOIN movie m ON mg.movie_id = m.movie_id 
GROUP BY g.genre_name
ORDER BY COUNT(*) DESC
LIMIT 10;


/*
Question 7
*/

SELECT
c.country_name,
COUNT(*)
FROM country c
INNER JOIN production_country pc ON c.country_id = pc.country_id 
INNER JOIN movie m ON pc.movie_id = m.movie_id
WHERE c.country_iso_code != 'US'
GROUP BY c.country_name 
ORDER BY COUNT(*) DESC
LIMIT 10;

/*
Question 8
*/

SELECT
p.person_name,
COUNT(*)
FROM person p
INNER JOIN movie_cast mc ON p.person_id = mc.person_id
GROUP BY p.person_name
ORDER BY COUNT(*) DESC
LIMIT 1;

/*
Question 9
*/

SELECT
p.person_name,
COUNT(*)
FROM person p
INNER JOIN movie_crew mc ON p.person_id = mc.person_id
GROUP BY p.person_name
ORDER BY COUNT(*) DESC
LIMIT 1;


/*
Question 10
*/

SELECT
person_1_name,
person_2_name,
COUNT(*)
FROM (
	SELECT
	p1.person_id,
	p1.person_name AS person_1_name,
	p2.person_id,
	p2.person_name AS person_2_name,
	mc1.movie_id,
	m.title 
	FROM person p1
	INNER JOIN movie_cast mc1 ON p1.person_id = mc1.person_id 
	INNER JOIN movie_cast mc2 ON mc1.movie_id = mc2.movie_id 
	INNER JOIN person p2 ON mc2.person_id = p2.person_id
	INNER JOIN movie m ON mc1.movie_id = m.movie_id
	WHERE mc1.person_id < mc2.person_id
) s
GROUP BY person_1_name, person_2_name
ORDER BY COUNT(*) DESC
LIMIT 1;


/*
Question 11
Both queries work
*/

SELECT
EXTRACT('year' FROM release_date) AS release_year,
ROUND(AVG(revenue), 2)
FROM movie
GROUP BY EXTRACT('year' FROM release_date)
ORDER BY EXTRACT('year' FROM release_date) ASC;


SELECT
release_year,
ROUND(AVG(revenue), 2)
FROM (
	SELECT
	EXTRACT('year' FROM release_date) AS release_year,
	revenue
	FROM movie
) s 
GROUP BY release_year
ORDER BY release_year ASC;


/*
Question 12
*/

SELECT
pc.company_name,
SUM(revenue) AS total_revenue
FROM production_company pc
INNER JOIN movie_company mc ON pc.company_id = mc.company_id 
INNER JOIN movie m ON mc.movie_id = m.movie_id 
GROUP BY pc.company_name
ORDER BY SUM(revenue) DESC;

/*
Question 13
*/
SELECT
d.department_name,
mc.job,
COUNT(*)
FROM department d
INNER JOIN movie_crew mc ON d.department_id = mc.department_id 
GROUP BY d.department_name, mc.job
ORDER BY COUNT(*) DESC;

/*
Question 14
Both queries can work
*/

SELECT
person_name,
COUNT(*)
FROM (
	SELECT DISTINCT
	p.person_name,
	mc.job
	FROM person p
	INNER JOIN movie_crew mc ON p.person_id = mc.person_id
) s
GROUP BY person_name
ORDER BY COUNT(*) DESC;


SELECT DISTINCT
p.person_name,
mc.job,
COUNT(*) OVER(PARTITION BY person_name) AS count_diff_jobs
FROM person p
INNER JOIN movie_crew mc ON p.person_id = mc.person_id
ORDER BY count_diff_jobs DESC;


/*
Question 15
*/

SELECT
p.person_name,
mc.character_name
FROM movie m
INNER JOIN movie_cast mc ON m.movie_id = mc.movie_id 
INNER JOIN person p ON mc.person_id = p.person_id 
WHERE m.revenue = (
	SELECT MAX(revenue)
	FROM movie
)
ORDER BY mc.cast_order ASC;

/*
Question 16
*/

--genres in top 10 movies
SELECT DISTINCT
mg.genre_id,
g.genre_name 
FROM movie_genres mg 
INNER JOIN genre g ON mg.genre_id = g.genre_id 
WHERE mg.movie_id IN (
	SELECT
	m.movie_id
	FROM movie m
	ORDER BY m.revenue DESC
	LIMIT 10
);

--highest earning genres
SELECT
g.genre_name,
SUM(m.revenue) AS revenue_for_genre
FROM genre g
INNER JOIN movie_genres mg ON g.genre_id = mg.genre_id 
INNER JOIN movie m ON mg.movie_id = m.movie_id
GROUP BY g.genre_name
ORDER BY revenue_for_genre DESC;

--highest earning genres not in top 10 movies
SELECT
g.genre_name,
SUM(m.revenue) AS revenue_for_genre
FROM genre g
INNER JOIN movie_genres mg ON g.genre_id = mg.genre_id 
INNER JOIN movie m ON mg.movie_id = m.movie_id
WHERE g.genre_id NOT IN (
	SELECT
	mg.genre_id
	FROM movie_genres mg 
	INNER JOIN genre g ON mg.genre_id = g.genre_id 
	WHERE mg.movie_id IN (
		SELECT
		m.movie_id
		FROM movie m
		ORDER BY m.revenue DESC
		LIMIT 10
	)
)
GROUP BY g.genre_name
ORDER BY revenue_for_genre DESC;


