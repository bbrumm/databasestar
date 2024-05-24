/*
 * SQL 01
 */

SELECT
mc.job,
d.department_name,
COUNT(*) AS movie_count
FROM movie_crew mc
INNER JOIN department d ON mc.department_id = d.department_id
INNER JOIN movie m ON mc.movie_id = m.movie_id
WHERE d.department_name = 'Camera'
AND COUNT(*) > 100
GROUP BY mc.job, d.department_name
ORDER BY COUNT(*) DESC;

/*
 * SQL 02
 */

SELECT
mc.job,
d.department_name,
COUNT(*) AS movie_count
FROM movie_crew mc
INNER JOIN department d ON mc.department_id = d.department_id
INNER JOIN movie m ON mc.movie_id = m.movie_id
GROUP BY mc.job, d.department_name
ORDER BY COUNT(*) DESC;


/*
 * SQL 03
 */

SELECT
mc.job,
d.department_name,
COUNT(*) AS movie_count
FROM movie_crew mc
INNER JOIN department d ON mc.department_id = d.department_id
INNER JOIN movie m ON mc.movie_id = m.movie_id
WHERE d.department_name = 'Camera'
GROUP BY mc.job, d.department_name
ORDER BY COUNT(*) DESC;


/*
 * SQL 04
 * Error
 */

SELECT
mc.job,
d.department_name,
COUNT(*) AS movie_count
FROM movie_crew mc
INNER JOIN department d ON mc.department_id = d.department_id
INNER JOIN movie m ON mc.movie_id = m.movie_id
WHERE d.department_name = 'Camera'
AND COUNT(*) > 100
GROUP BY mc.job, d.department_name
ORDER BY COUNT(*) DESC;



/*
 * SQL 05
 */

SELECT
mc.job,
d.department_name,
COUNT(*) AS movie_count
FROM movie_crew mc
INNER JOIN department d ON mc.department_id = d.department_id
INNER JOIN movie m ON mc.movie_id = m.movie_id
WHERE d.department_name = 'Camera'
GROUP BY mc.job, d.department_name
HAVING COUNT(*) > 100
ORDER BY COUNT(*) DESC;