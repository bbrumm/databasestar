/*
General
*/

--Airports and locations
SELECT
cn.country_id,
cn.country_name,
ci.city_name,
a.airport_code,
a.Airport_Name
FROM country cn
INNER JOIN city ci ON ci.country_id = cn.country_id
INNER JOIN airport a ON a.city_id = ci.city_id
ORDER BY Cn.Country_Name, Ci.City_Name, A.Airport_Name;

--City, country, and airports in that country
SELECT
cn.country_id,
cn.country_name,
ci.city_name,
COUNT(a.airport_id) OVER (PARTITION BY cn.country_id) AS airports_in_country
FROM country cn
INNER JOIN city ci ON ci.country_id = cn.country_id
INNER JOIN airport a ON a.city_id = ci.city_id;

--City, country, and airports in that CITY
SELECT
cn.country_id,
cn.country_name,
ci.city_name,
a.airport_name,
COUNT(a.airport_id) OVER (PARTITION BY ci.city_id) AS airports_in_city
FROM country cn
INNER JOIN city ci ON ci.country_id = cn.country_id
INNER JOIN airport a ON a.city_id = ci.city_id
ORDER BY airports_in_city DESC, ci.city_id ASC, cn.country_id ASC;


--Customer and booking details
SELECT
cust.customer_id,
cust.first_name,
cust.last_name,
ccn.country_name AS customer_country,
a.airline_name,
b.booking_id,
bl.booking_leg_id,
bl.price,
TO_CHAR(l.departure_time, 'DD-MON-YYYY HH:MI:SS AM') AS departure_time,
depa.airport_name AS departure_airport,
dc.city_name AS departure_city,
dcn.country_name AS departure_country,
TO_CHAR(l.arrival_time, 'DD-MON-YYYY HH:MI:SS AM') AS arrival_time,
arra.airport_name AS arrival_airport,
ac.city_name AS arrival_city,
acn.country_name AS arrival_country
FROM air_customer cust
INNER JOIN country ccn ON cust.country_id = ccn.country_id
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN flight f ON l.flight_code = f.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN airport arra ON l.arrival_airport_id = arra.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN city ac ON arra.city_id = ac.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
INNER JOIN country acn ON ac.country_id = acn.country_id
;

/*
Find out:
1 - Which customers are on the flights with the most other customers (analytic function)
2 - Airport city country info with the most booked customers on a date (analytic function)
*/


--1 Which customers are on the flights with the most other customers (analytic function)
SELECT
cust.customer_id,
cust.first_name,
cust.last_name,
COUNT(b.booking_id) OVER (PARTITION BY l.leg_id) AS cust_count,
a.airline_name,
b.booking_id,
bl.booking_leg_id,
l.leg_id,
bl.price,
TO_CHAR(l.departure_time, 'DD-MON-YYYY HH:MI:SS AM') AS departure_time,
depa.airport_name AS departure_airport,
dc.city_name AS departure_city,
dcn.country_name AS departure_country,
TO_CHAR(l.arrival_time, 'DD-MON-YYYY HH:MI:SS AM') AS arrival_time,
arra.airport_name AS arrival_airport,
ac.city_name AS arrival_city,
acn.country_name AS arrival_country
FROM air_customer cust
INNER JOIN country ccn ON cust.country_id = ccn.country_id
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN flight f ON l.flight_code = f.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN airport arra ON l.arrival_airport_id = arra.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN city ac ON arra.city_id = ac.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
INNER JOIN country acn ON ac.country_id = acn.country_id
ORDER BY cust_count DESC, leg_id ASC
;


--2 Arrival airport city country info with the most booked customers on a date (analytic function)
SELECT
arra.airport_name AS arrival_airport,
ac.city_name AS arrival_city,
acn.country_name AS arrival_country,
TO_CHAR(l.arrival_time, 'DD-MON-YYYY') AS arrival_date,
cust.customer_id,
cust.first_name,
cust.last_name,
COUNT(cust.customer_id) OVER (PARTITION BY arra.airport_id, TO_CHAR(l.arrival_time, 'DD-MON-YYYY')) AS cust_count
FROM air_customer cust
INNER JOIN country ccn ON cust.country_id = ccn.country_id
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN flight f ON l.flight_code = f.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
INNER JOIN airport arra ON l.arrival_airport_id = arra.airport_id
INNER JOIN city ac ON arra.city_id = ac.city_id
INNER JOIN country acn ON ac.country_id = acn.country_id
ORDER BY cust_count DESC, acn.country_name ASC
;
