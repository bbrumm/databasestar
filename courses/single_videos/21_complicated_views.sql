

/*
Video - Creating Complicated Views
1- Customers and count of bookings
2- Highest spending customers (sum of price per customer)
3- Count of flights per date and airport
4- Most profitable legs (avg price per leg)
5- Income per airport

Other queries:
6 - Customers booking a flight between two airports in the same country (if any)
7 - Most common departure countries
8 - Most common departure dates
9 - Which customers have the longest flights
10- Most bookings per aircraft model
*/

--1 Customers and count of bookings
SELECT
cust.customer_id,
cust.first_name,
cust.last_name,
COUNT(b.booking_id) AS booking_count
FROM air_customer cust
INNER JOIN booking b ON b.customer_id = cust.customer_id
GROUP BY cust.customer_id,
cust.first_name,
cust.last_name;

CREATE VIEW cust_booking_count AS
SELECT
cust.customer_id,
cust.first_name,
cust.last_name,
COUNT(b.booking_id) AS booking_count
FROM air_customer cust
INNER JOIN booking b ON b.customer_id = cust.customer_id
GROUP BY cust.customer_id,
cust.first_name,
cust.last_name;

SELECT
customer_id,
first_name,
last_name,
booking_count
FROM cust_booking_count
ORDER BY booking_count DESC;

--2 Highest spending customers (sum of price per customer)
SELECT
cust.customer_id,
cust.first_name,
cust.last_name,
SUM(bl.price) AS total_spend
FROM air_customer cust
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
GROUP BY cust.customer_id,
cust.first_name,
cust.last_name
ORDER BY total_spend DESC
;

CREATE VIEW highest_spend_cust AS
SELECT
cust.customer_id,
cust.first_name,
cust.last_name,
SUM(bl.price) AS total_spend
FROM air_customer cust
INNER JOIN booking b ON b.customer_id = cust.customer_id
INNER JOIN booking_leg bl ON bl.booking_id = b.booking_id
GROUP BY cust.customer_id,
cust.first_name,
cust.last_name
ORDER BY total_spend DESC
;

SELECT * FROM highest_spend_cust;



--3 Count of flights per month and airport - departing
SELECT
depa.airport_name AS airport,
dc.city_name AS city,
dcn.country_name AS country,
TO_CHAR(l.departure_time, 'YYYY-MM') AS departure_date,
COUNT(*) AS booking_count
FROM booking_leg bl
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
GROUP BY depa.airport_name, dc.city_name, dcn.country_name, TO_CHAR(l.departure_time, 'YYYY-MM')
ORDER BY depa.airport_name ASC, departure_date ASC
;

CREATE VIEW common_departures AS
SELECT
depa.airport_name AS airport,
dc.city_name AS city,
dcn.country_name AS country,
TO_CHAR(l.departure_time, 'YYYY-MM') AS departure_date,
COUNT(*) AS booking_count
FROM booking_leg bl
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
GROUP BY depa.airport_name, dc.city_name, dcn.country_name, TO_CHAR(l.departure_time, 'YYYY-MM')
ORDER BY depa.airport_name ASC, departure_date ASC
;

SELECT * FROM common_departures;


--4 Most profitable legs (avg price per leg)
SELECT
depa.airport_name AS departure_airport,
dc.city_name AS departure_city,
dcn.country_name AS departure_country,
arra.airport_name AS arrival_airport,
ac.city_name AS arrival_city,
acn.country_name AS arrival_country,
COUNT(bl.booking_leg_id) AS booking_count,
ROUND(AVG(bl.price), 2) AS avg_price
FROM booking_leg bl
INNER JOIN leg l ON bl.leg_id = l.leg_id
INNER JOIN airport depa ON l.departure_airport_id = depa.airport_id
INNER JOIN airport arra ON l.arrival_airport_id = arra.airport_id
INNER JOIN city dc ON depa.city_id = dc.city_id
INNER JOIN city ac ON arra.city_id = ac.city_id
INNER JOIN country dcn ON dc.country_id = dcn.country_id
INNER JOIN country acn ON ac.country_id = acn.country_id
GROUP BY depa.airport_name, dc.city_name, dcn.country_name, arra.airport_name, ac.city_name, acn.country_name
ORDER BY avg_price DESC
;

SELECT * FROM seat_class;

--5 Income per airport (assuming 50/50 split between arrival and departure airport)
SELECT
a.airport_name AS airport,
c.city_name AS city,
cn.country_name AS country,
ROUND(SUM((depbl.price/2) + (arrbl.price/2))) AS airport_income
FROM airport a
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country cn ON c.country_id = cn.country_id
LEFT JOIN leg depl ON a.airport_id = depl.departure_airport_id
LEFT JOIN leg arrl ON a.airport_id = arrl.arrival_airport_id
INNER JOIN booking_leg depbl ON depl.leg_id = depbl.leg_id
INNER JOIN booking_leg arrbl ON arrl.leg_id = arrbl.leg_id
GROUP BY a.airport_name, c.city_name, cn.country_name
;

