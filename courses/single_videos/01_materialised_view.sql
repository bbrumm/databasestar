/*
Creating a materialised view to improve performance
*/

-- Count of flights per month and airport - departing
--Approx 3 seconds
SELECT
depa.airport_name AS airport,
dc.city_name AS city,
dcn.country_name AS country,
TO_CHAR(l.departure_time, 'YYYY-MM') AS departure_date,
COUNT(*) AS booking_count
FROM air_customer cust
INNER JOIN country ccn ON cust.country_id = ccn.country_id
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN flight f ON l.flight_code = f.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
INNER JOIN airport arra ON l.arrival_airport_id = arra.airport_id 
INNER JOIN city arc ON arra.city_id = arc.city_id
INNER JOIN country arcn ON arc.country_id = arcn.country_id
WHERE arcn.country_id = dcn.country_id --Only show flights within the same country
AND l.arrival_airport_id IN (
	SELECT arrival_airport_id
	FROM (
		SELECT arrival_airport_id, COUNT(*)
		FROM leg
		GROUP BY arrival_airport_id
		HAVING COUNT(*) > 3
	)
)
AND l.departure_time NOT BETWEEN '01-JAN-2018' AND '01-JUL-2018'
GROUP BY depa.airport_name, dc.city_name, dcn.country_name, TO_CHAR(l.departure_time, 'YYYY-MM')
ORDER BY depa.airport_name ASC, departure_date ASC
;


DROP MATERIALIZED VIEW flights_airport_month;

--Create materialised view
--Approx 6 seconds
CREATE MATERIALIZED VIEW flights_airport_month AS
SELECT
depa.airport_name AS airport,
dc.city_name AS city,
dcn.country_name AS country,
TO_CHAR(l.departure_time, 'YYYY-MM') AS departure_date,
COUNT(*) AS booking_count
FROM air_customer cust
INNER JOIN country ccn ON cust.country_id = ccn.country_id
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN flight f ON l.flight_code = f.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
INNER JOIN airport arra ON l.arrival_airport_id = arra.airport_id 
INNER JOIN city arc ON arra.city_id = arc.city_id
INNER JOIN country arcn ON arc.country_id = arcn.country_id
WHERE arcn.country_id = dcn.country_id
AND l.arrival_airport_id IN (
	SELECT arrival_airport_id
	FROM (
		SELECT arrival_airport_id, COUNT(*)
		FROM leg
		GROUP BY arrival_airport_id
		HAVING COUNT(*) > 3
	)
)
AND l.departure_time NOT BETWEEN '01-JAN-2018' AND '01-JUL-2018'
GROUP BY depa.airport_name, dc.city_name, dcn.country_name, TO_CHAR(l.departure_time, 'YYYY-MM')
ORDER BY depa.airport_name ASC, departure_date ASC
;

--Select from MV
-- Approx 0.2 seconds
SELECT
airport,
city,
country,
departure_date,
booking_count
FROM flights_airport_month;

