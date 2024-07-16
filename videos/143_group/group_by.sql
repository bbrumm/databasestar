SELECT * FROM address;

SELECT country_id, COUNT(*)
FROM address
GROUP BY country_id;

SELECT country_id, city, COUNT(*)
FROM address
GROUP BY country_id, city;