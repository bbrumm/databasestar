/* SQL 01 */

SELECT
c.country_name,
a.city
FROM address a
INNER JOIN country c ON a.country_id = c.country_id;

/* SQL 02 - Oracle */

SELECT
c.country_name,
LISTAGG(a.city) AS city_list
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name;

/* SQL 03 - Oracle */

SELECT
c.country_name,
LISTAGG(a.city, ',') AS city_list
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name;

/* SQL 04 - Oracle */

SELECT
c.country_name,
LISTAGG(a.city, ', ') AS city_list
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name;

/* SQL 05 - SQL Server */

SELECT
c.country_name,
STRING_AGG(a.city) AS city_list
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name;

/* SQL 06 - SQL Server (QUERY TBC) */

SELECT
c.country_name,
STRING_AGG(a.city) AS city_list
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name;