/* SQL 01 */

CREATE DATABASE flights;
USE flights;

/* SQL 02 */

CREATE TABLE country (
    id INTEGER,
    country_name VARCHAR(200),
    CONSTRAINT pk_country PRIMARY KEY (id)
);

/* SQL 03 */

CREATE TABLE city (
    id INTEGER,
    city_name VARCHAR(100),
    country_id INTEGER,
    CONSTRAINT pk_city PRIMARY KEY (id),
    CONSTRAINT fk_city_country
        FOREIGN KEY (country_id)
        REFERENCES country (id)
);

/* SQL 04 */

INSERT INTO country (id, country_name) VALUES
(1, 'United Kingdom'),
(2, 'France');

/* SQL 05 */

INSERT INTO city (id, city_name, country_id) VALUES
(1, 'London', 1),
(2, 'Paris', 2);

/* SQL 06 */
SELECT id, country_name
FROM country;

/* SQL 07 */
CREATE TABLE airport (
    id INTEGER,
    city_id INTEGER,
    code VARCHAR(5),
    name VARCHAR(100),
    CONSTRAINT pk_airport PRIMARY KEY (id),
    CONSTRAINT fk_airport_city
        FOREIGN KEY (city_id)
        REFERENCES city (id)
);


/* SQL 08 */
INSERT INTO airport (id, city_id, code, name) VALUES
(1, 1, 'LHR','Heathrow'),
(2, 2, 'CDG', 'Charles de Gaulle'),
(3, 1, 'LGW', 'Gatwick'),
(4, 1, 'STN', 'Stanstead'),
(5, 2, 'ORY', 'Orly'),
(6, 2, 'BVA', 'Beauvais');

/* SQL 09 */
CREATE TABLE booking_type (
    id INTEGER,
    type_name VARCHAR(50),
    CONSTRAINT pk_bookingtype PRIMARY KEY (id)
);

CREATE TABLE booking (
    id INTEGER,
    booking_type_id INTEGER,
    CONSTRAINT pk_booking PRIMARY KEY (id),
    CONSTRAINT fk_booking_type
        FOREIGN KEY (booking_type_id)
        REFERENCES booking_type (id)
);

CREATE TABLE flight (
    id INTEGER,
    booking_id INTEGER,
    departing_airport_id INTEGER,
    arriving_airport_id INTEGER,
    departing_date DATE,
    CONSTRAINT pk_flight PRIMARY KEY (id),
    CONSTRAINT fk_flight_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking (id),
    CONSTRAINT fk_flight_depairport
        FOREIGN KEY (departing_airport_id)
        REFERENCES airport (id),
    CONSTRAINT fk_flight_arrairport
        FOREIGN KEY (arriving_airport_id)
        REFERENCES airport (id)
);

/* SQL 10 */

INSERT INTO booking_type (id, type_name) VALUES
(1, 'Return'),
(2, 'One-way'),
(3, 'Multi-city');

/* SQL 11 */

CREATE TABLE booking_class (
    id INTEGER,
    class_name VARCHAR(20),
    item_order INTEGER,
    CONSTRAINT pk_bookingclass PRIMARY KEY (id)
);

/* SQL 12 */
ALTER TABLE booking
ADD COLUMN booking_class_id INTEGER;

/* SQL 13 */
ALTER TABLE booking
ADD CONSTRAINT fk_booking_class
FOREIGN KEY (booking_class_id)
REFERENCES booking (id);

/* SQL 14 */
INSERT INTO booking_class (id, class_name, item_order) VALUES
(1, 'Economy', 10),
(2, 'Premium Economy', 20),
(3, 'Business', 30),
(4, 'First Class', 40);

/*
 SQL 15
 SQL to make changes to meet the new design
 */

DROP TABLE flight;

CREATE TABLE airline (
    id INTEGER,
    name VARCHAR(100),
    CONSTRAINT pk_airline PRIMARY KEY (id)
);

CREATE TABLE flight_supply (
    id INTEGER,
    flight_no VARCHAR(5),
    airline_id INTEGER,
    departure_datetime DATETIME,
    departing_airport_id INTEGER,
    arriving_airport_id INTEGER,
    CONSTRAINT pk_flightsupply PRIMARY KEY (id),
    CONSTRAINT fk_flightsupply_airline
        FOREIGN KEY (airline_id)
        REFERENCES airline (id),
    CONSTRAINT fk_flightsupply_depairport
        FOREIGN KEY (departing_airport_id)
        REFERENCES airport (id),
    CONSTRAINT fk_flightsupply_arrairport
        FOREIGN KEY (arriving_airport_id)
        REFERENCES airport (id)
);

CREATE TABLE booked_flight (
    id INTEGER,
    booking_id INTEGER,
    flight_supply_id INTEGER,
    CONSTRAINT pk_bookedflight PRIMARY KEY (id),
    CONSTRAINT fk_bookedflight_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking (id),
    CONSTRAINT fk_bookedflight_flightsupply
        FOREIGN KEY (flight_supply_id)
        REFERENCES flight_supply (id)
);


CREATE TABLE booking_class_supply (
    booking_class_id INTEGER,
    flight_supply_id INTEGER,
    no_seats INTEGER,
    price_gbp DECIMAL(10, 2),
    CONSTRAINT fk_bts_classtype
        FOREIGN KEY (booking_class_id)
        REFERENCES booking_class (id),
    CONSTRAINT fk_bts_flightsupply
        FOREIGN KEY (flight_supply_id)
        REFERENCES flight_supply (id)
);

INSERT INTO airline(id, name) VALUES
(1, 'Air France'),
(2, 'British Airways');

INSERT INTO flight_supply (id, flight_no, airline_id, departure_datetime, departing_airport_id, arriving_airport_id) VALUES
(1, 'AF545', 1, '2025-03-18 14:45', 1, 2),
(2, 'AF971', 1, '2025-03-18 06:20', 1, 2),
(3, 'AF343', 1, '2025-03-18 11:30', 1, 2),
(4, 'AF545', 1, '2025-03-18 19:35', 1, 2),
(5, 'AF696', 1, '2025-03-18 17:35', 1, 2),
(6, 'BA935', 2, '2025-03-18 07:15', 1, 2),
(7, 'BA426', 2, '2025-03-18 14:10', 1, 2),
(8, 'BA730', 2, '2025-03-18 15:10', 1, 2),
(9, 'BA805', 2, '2025-03-18 11:40', 1, 2),
(10, 'BA278', 2, '2025-03-18 12:55', 1, 2),
(11, 'BA830', 2, '2025-03-18 08:25', 1, 2),
(12, 'BA383', 2, '2025-03-18 17:15', 1, 2),
(13, 'BA345', 2, '2025-03-18 20:00', 1, 2),
(14, 'BA798', 1, '2025-03-18 09:00', 1, 2),
(15, 'BA115', 1, '2025-03-18 08:55', 1, 2);

INSERT INTO booking_class_supply (booking_class_id, flight_supply_id, no_seats, price_gbp) VALUES
(1, 1, 200, 98),
(1, 2, 200, 99),
(1, 3, 200, 107),
(1, 4, 200, 98),
(1, 5, 200, 107),
(1, 6, 200, 109),
(1, 7, 200, 114),
(1, 8, 180, 114),
(1, 9, 180, 119),
(1, 10, 180, 119),
(1, 11, 160, 124),
(1, 12, 160, 119),
(1, 13, 200, 124),
(1, 14, 200, 161),
(1, 15, 200, 111),
(2, 1, 20, 147),
(2, 2, 20, 148.5),
(2, 3, 20, 160.5),
(2, 4, 20, 147),
(2, 5, 20, 160.5),
(2, 6, 20, 163.5),
(2, 7, 20, 171),
(2, 8, 20, 171),
(2, 9, 20, 178.5),
(2, 10, 20, 178.5),
(2, 11, 20, 186),
(2, 12, 20, 178.5),
(2, 13, 20, 186),
(2, 14, 20, 241.5),
(2, 15, 20, 166.5),
(3, 1, 16, 392),
(3, 2, 16, 396),
(3, 3, 16, 428),
(3, 4, 16, 392),
(3, 5, 16, 428),
(3, 6, 16, 436),
(3, 7, 16, 456),
(3, 8, 16, 456),
(3, 9, 16, 476),
(3, 10, 16, 476),
(3, 11, 16, 496),
(3, 12, 16, 476),
(3, 13, 16, 496),
(3, 14, 16, 644),
(3, 15, 16, 444),
(4, 1, 8, 882),
(4, 2, 8, 891),
(4, 3, 8, 963),
(4, 4, 8, 882),
(4, 5, 8, 963),
(4, 6, 8, 981),
(4, 7, 8, 1026),
(4, 8, 8, 1026),
(4, 9, 8, 1071),
(4, 10, 8, 1071),
(4, 11, 8, 1116),
(4, 12, 8, 1071),
(4, 13, 8, 1116),
(4, 14, 8, 1449),
(4, 15, 8, 999);


/* SQL 16 */

SELECT *
FROM flight_supply;

/* SQL 17 */

SELECT
c.city_name,
a.code,
a.name,
co.country_name
FROM country co
INNER JOIN city c ON co.id = c.country_id
INNER JOIN airport a ON a.city_id = c.id;

/* SQL 18 */

SELECT
fs.id,
fs.flight_no,
al.name AS airline_name,
fs.departure_datetime,
apd.name AS departing_airport,
cd.city_name AS departing_city,
apa.name AS arriving_airport,
ca.city_name AS arriving_city,
bcs.price_gbp
FROM city ca
INNER JOIN airport apa ON apa.city_id = ca.id
INNER JOIN flight_supply fs on apa.id = fs.arriving_airport_id
INNER JOIN airport apd ON fs.departing_airport_id = apd.id
INNER JOIN city cd ON cd.id = apd.city_id
INNER JOIN airline al ON fs.airline_id = al.id
INNER JOIN booking_class_supply bcs on fs.id = bcs.flight_supply_id
WHERE bcs.booking_class_id = 1
ORDER BY fs.departure_datetime ASC;
