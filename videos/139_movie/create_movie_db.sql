/*
Create and populate the movie booking database
*/

CREATE TABLE movie (
  movie_id INT,
  director_id INT,
  title VARCHAR(200),
  status VARCHAR(20),
  age_rating VARCHAR(5),
  runtime_min INT,
  release_date DATE,
  trailer_link VARCHAR(1000),
  description VARCHAR(2000),
  banner_text VARCHAR(1000),
  header_image VARCHAR(1000),
  poster_image VARCHAR(1000),
  synopsis VARCHAR(4000),
  CONSTRAINT pk_movie PRIMARY KEY (movie_id),
  CONSTRAINT fk_movie_director FOREIGN KEY (director_id) REFERENCES director (director_id) #exclude this from when it is first added
);

CREATE TABLE director (
  director_id INT,
  director_name VARCHAR(500),
  CONSTRAINT pk_director PRIMARY KEY (director_id)
);


CREATE TABLE cast_member (
  cast_id INT,
  cast_name VARCHAR(500),
  CONSTRAINT pk_cast PRIMARY KEY (cast_id)
);



CREATE TABLE movie_cast (
  movie_id INT,
  cast_id INT,
  CONSTRAINT fk_mc_movie FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
  CONSTRAINT fk_mc_cast FOREIGN KEY (cast_id) REFERENCES cast_member (cast_id)
);


CREATE TABLE genre (
  genre_id INT,
  genre_name VARCHAR(100),
  CONSTRAINT pk_genre PRIMARY KEY (genre_id)
);



CREATE TABLE movie_genre (
  movie_id INT,
  genre_id INT,
  CONSTRAINT fk_mg_movie FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
  CONSTRAINT fk_mg_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);


INSERT INTO movie (movie_id, director_id, title, status, age_rating, runtime_min, release_date, trailer_link, description, banner_text, header_image, poster_image, synopsis)
VALUES (1, 1, 'Inside Out 2', 'Tickets On Sale', 'CTC', 105, '20240613', 'https://www.youtube.com/watch?v=CkLiND6qa34', 
'In ''Inside Out 2,'' Disney and Pixar dive back into Riley''s mind, now a teen, as it faces unexpected changes: new Emotions!', 
'Dive into Riley''s mind and discover new emotions! Secure your seats for a wild ride through the teen years with Joy, Sadness, Anger, Fear.', 
'https://www.hoyts.com.au/images/banner103.png', 'https://www.hoyts.com.au/images/poster2931.png', 
'In ''Inside Out 2,'' Disney and Pixar dive back into Riley''s mind, now a teen, as it faces unexpected changes: new Emotions! With Joy, Sadness, Anger, Fear, and Disgust unsure how to handle the arrival of Anxiety and others, voiced by Maya Hawke. Amy Poehler returns as Joy, joined by a stellar cast including Lewis Black and Diane Lane. Directed by Kelsey Mann, produced by Mark Nielsen, and featuring a screenplay by Meg LeFauve and Dave Holstein, ''Inside Out 2'' promises a captivating journey with a score by Andrea Datzman.'
);


INSERT INTO director (director_id, director_name)
VALUES (1, 'Kelsey Mann');



INSERT INTO genre (genre_id, genre_name) VALUES
(1, 'Adventure'),
(2, 'Animation'),
(3, 'Comedy'),
(4, 'Drama'),
(5, 'Family'),
(6, 'Fantasy');



INSERT INTO cast_member (cast_id, cast_name)
VALUES (1, 'Amy Poehler');



INSERT INTO movie_cast (movie_id, cast_id)
VALUES (1, 1);


INSERT INTO movie_genre (movie_id, genre_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6);



CREATE TABLE state (
  state_id INT,
  state_name VARCHAR(10),
  CONSTRAINT pk_state PRIMARY KEY (state_id)
);


CREATE TABLE cinema (
  cinema_id INT,
  cinema_name VARCHAR(200),
  state_id INT,
  CONSTRAINT pk_cinema PRIMARY KEY (cinema_id),
  CONSTRAINT fk_cinema_state FOREIGN KEY (state_id) REFERENCES state (state_id)
);


INSERT INTO state (state_id, state_name) VALUES
(1, 'ACT'),
(2, 'NSW'),
(3, 'QLD'),
(4, 'SA'),
(5, 'VIC'),
(6, 'WA');



INSERT INTO cinema (cinema_id, cinema_name, state_id) VALUES
(1, 'Belconnen', 1),
(2, 'Wooden', 1),
(3, 'Bankstown', 2),
(4, 'Blacktown', 2),
(5, 'Cronulla', 2),
(6, 'Erina', 2),
(7, 'Green Hills', 2),
(8, 'Redcliffe', 3),
(9, 'Stafford', 3),
(10, 'Arndale', 4),
(11, 'Norwood', 4),
(12, 'Broadmeadows', 5),
(13, 'Chadstone', 5),
(14, 'Highpoint', 5),
(15, 'Bunbury', 6),
(16, 'Carousel', 6),
(17, 'Southlands', 6);



CREATE TABLE showing_time (
  time_id INT,
  movie_id INT,
  cinema_id INT,
  showing_datetime DATETIME,
  CONSTRAINT pk_showingtime PRIMARY KEY (time_id),
  CONSTRAINT fk_show_movie FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
  CONSTRAINT fk_show_cinema FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id)
);



INSERT INTO showing_time (time_id, movie_id, cinema_id, showing_datetime) VALUES
(1, 1, 13, '2024-06-13 10:30:00'),
(2, 1, 13, '2024-06-13 13:00:00'),
(3, 1, 13, '2024-06-13 13:30:00'),
(4, 1, 13, '2024-06-13 15:30:00'),
(5, 1, 13, '2024-06-13 16:00:00'),
(6, 1, 13, '2024-06-13 18:00:00'),
(7, 1, 13, '2024-06-13 18:30:00'),
(8, 1, 13, '2024-06-14 10:30:00'),
(9, 1, 13, '2024-06-14 13:00:00'),
(10, 1, 13, '2024-06-14 13:30:00'),
(11, 1, 13, '2024-06-14 15:30:00'),
(12, 1, 13, '2024-06-14 16:00:00'),
(13, 1, 13, '2024-06-14 18:00:00'),
(14, 1, 13, '2024-06-14 18:30:00'),
(15, 1, 13, '2024-06-15 10:15:00'),
(16, 1, 13, '2024-06-15 10:30:00'),
(17, 1, 13, '2024-06-15 12:40:00'),
(18, 1, 13, '2024-06-15 13:00:00'),
(19, 1, 13, '2024-06-15 15:30:00'),
(20, 1, 13, '2024-06-15 18:00:00'),
(21, 1, 13, '2024-06-15 18:30:00');



CREATE TABLE feature_type (
  type_id INT,
  type_name VARCHAR(100),
  CONSTRAINT pk_ftype PRIMARY KEY (type_id)
);



CREATE TABLE feature (
  feature_id INT,
  type_id INT,
  feature_name VARCHAR(100),
  feature_description VARCHAR(500),
  CONSTRAINT pk_feature PRIMARY KEY (feature_id),
  CONSTRAINT fk_feature_type FOREIGN KEY (type_id) REFERENCES feature_type (type_id)
);


INSERT INTO feature_type (type_id, type_name) VALUES
(1, 'Experience'),
(2, 'Accessibility'),
(3, 'Attribute');



INSERT INTO feature (feature_id, type_id, feature_name, feature_description) VALUES
(1, 1, 'XTREMESCREEN', 'Our biggest & loudest cinema experience'),
(2, 1, 'HOYTS LUX', 'The ultimate dine-in cinema experience'),
(3, 1, 'D-BOX', 'HOYTS D-Box Motion Recliners'),
(4, 1, 'LOUNGE', 'HOYTS Lounges - Boutique velvet sofas'),
(5, 1, 'ONYX', 'Samsung Onyx - brilliant LED picture'),
(6, 1, 'ATMOS', 'Dolby Atmos® multi-dimensional sound'),
(7, 1, 'DAYBEDS', 'Seats up to three people'),
(8, 1, '3D', 'Action that jumps off the screen'),
(9, 1, 'RC', 'Recliner Seats'),
(10, 2, 'AD', 'Audio Description'),
(11, 2, 'CC', 'Closed Caption'),
(12, 2, 'OPEN CAP', 'Open Caption'),
(13, 2, 'SS', 'Sensory Screening'),
(14, 3, 'MOW', 'Movie of the Week*'),
(15, 3, 'SPECEVENT', 'Special Event'),
(16, 3, 'BDAY', 'Birthday Party Session'),
(17, 3, 'GNO', 'Girls'' Night Out'),
(18, 3, 'PRAMS', 'Prams at the Pix'),
(19, 3, 'NFT', 'No Free Tickets');



CREATE TABLE showing_feature (
  showing_id INT,
  feature_id INT,
  CONSTRAINT fk_showft_show FOREIGN KEY (showing_id) REFERENCES showing_time (time_id),
  CONSTRAINT fk_showft_feature FOREIGN KEY (feature_id) REFERENCES feature (feature_id)
);


INSERT INTO showing_feature (showing_id, feature_id) VALUES
(1, 1),
(1, 7),
(1, 10),
(1, 11),
(1, 19),
(2, 1),
(2, 7),
(2, 10),
(2, 11),
(2, 19),
(3, 2),
(3, 10),
(3, 11),
(3, 19),
(4, 1),
(4, 7),
(4, 10),
(4, 11),
(4, 19),
(5, 2),
(5, 10),
(5, 11),
(5, 19),
(6, 1),
(6, 7),
(6, 10),
(6, 11),
(6, 19),
(7, 2),
(7, 10),
(7, 11),
(7, 19);



CREATE TABLE seat_type (
  type_id INT,
  type_name VARCHAR(100),
  CONSTRAINT pk_seattype PRIMARY KEY (type_id)
);

CREATE TABLE theatre (
  theatre_id INT,
  cinema_id INT,
  theatre_num VARCHAR(5),
  CONSTRAINT pk_theatre PRIMARY KEY (theatre_id),
  CONSTRAINT fk_theatre_cin FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id)
);



ALTER TABLE showing_time
ADD COLUMN theatre_id INT;



ALTER TABLE showing_time
ADD CONSTRAINT fk_showtime_tht
FOREIGN KEY (theatre_id)
REFERENCES theatre (theatre_id);



ALTER TABLE showing_time
DROP COLUMN cinema_id;


ALTER TABLE showing_time
DROP CONSTRAINT fk_show_cinema;



CREATE TABLE seat (
  seat_id INT,
  seat_type_id INT,
  theatre_id INT,
  seat_location VARCHAR(5),
  CONSTRAINT pk_seat PRIMARY KEY (seat_id),
  CONSTRAINT fk_seat_type FOREIGN KEY (seat_type_id) REFERENCES seat_type (type_id),
  CONSTRAINT fk_seat_th FOREIGN KEY (theatre_id) REFERENCES theatre (theatre_id)
);



CREATE TABLE booking (
  booking_id INT,
  showing_id INT,
  CONSTRAINT pk_booking PRIMARY KEY (booking_id),
  CONSTRAINT fk_booking_show FOREIGN KEY (showing_id) REFERENCES showing_time (time_id)
);



CREATE TABLE booking_seat (
  booking_id INT,
  seat_id INT,
  CONSTRAINT fk_bkst_booking FOREIGN KEY (booking_id) REFERENCES booking (booking_id),
  CONSTRAINT fk_bkst_seat FOREIGN KEY (seat_id) REFERENCES seat (seat_id)
);



INSERT INTO seat_type (type_id, type_name) VALUES
(1, 'Standard'),
(2, 'Daybed'),
(3, 'Accessible');



INSERT INTO theatre (theatre_id, cinema_id, theatre_num) VALUES
(1, 13, 'A'),
(2, 13, 'B'),
(3, 13, 'C'),
(4, 13, 'D');


INSERT INTO seat (seat_id, seat_type_id, theatre_id, seat_location) VALUES
(1, 2, 1, 'A1'),
(2, 2, 1, 'A2'),
(3, 2, 1, 'A3'),
(4, 2, 1, 'A4'),
(5, 3, 1, 'B5'),
(6, 3, 1, 'B6'),
(7, 3, 1, 'C5'),
(8, 3, 1, 'C6'),
(9, 1, 1, 'B1'),
(10, 1, 1, 'B2'),
(11, 1, 1, 'B3'),
(12, 1, 1, 'B4'),
(13, 1, 1, 'B7'),
(14, 1, 1, 'B8'),
(15, 1, 1, 'B9'),
(16, 1, 1, 'B10'),
(17, 1, 1, 'C1'),
(18, 1, 1, 'C2'),
(19, 1, 1, 'C3'),
(20, 1, 1, 'C4'),
(21, 1, 1, 'C7'),
(22, 1, 1, 'C8'),
(23, 1, 1, 'C9'),
(24, 1, 1, 'C10'),
(25, 1, 1, 'D1'),
(26, 1, 1, 'D2'),
(27, 1, 1, 'D3'),
(28, 1, 1, 'D4'),
(29, 1, 1, 'D5'),
(30, 1, 1, 'D6'),
(31, 1, 1, 'D7'),
(32, 1, 1, 'D8'),
(33, 1, 1, 'D9'),
(34, 1, 1, 'D10'),
(35, 1, 1, 'E1'),
(36, 1, 1, 'E2'),
(37, 1, 1, 'E3'),
(38, 1, 1, 'E4'),
(39, 1, 1, 'E5'),
(40, 1, 1, 'E6'),
(41, 1, 1, 'E7'),
(42, 1, 1, 'E8'),
(43, 1, 1, 'E9'),
(44, 1, 1, 'E10'),
(45, 1, 1, 'F1'),
(46, 1, 1, 'F2'),
(47, 1, 1, 'F3'),
(48, 1, 1, 'F4'),
(49, 1, 1, 'F5'),
(50, 1, 1, 'F6'),
(51, 1, 1, 'F7'),
(52, 1, 1, 'F8'),
(53, 1, 1, 'F9'),
(54, 1, 1, 'F10');


UPDATE showing_time
SET theatre_id = 1;


CREATE TABLE ticket_type (
  type_id INT,
  ticket_type_name VARCHAR(50),
  ticket_price INT,
  CONSTRAINT pk_tickettype PRIMARY KEY (type_id)
);



CREATE TABLE booking_ticket (
  ticket_type_id INT,
  booking_id INT,
  ticket_qty INT,
  CONSTRAINT fk_booktk_type FOREIGN KEY (ticket_type_id) REFERENCES ticket_type (type_id),
  CONSTRAINT fk_booktk_booking FOREIGN KEY (booking_id) REFERENCES booking (booking_id)
);


ALTER TABLE booking
ADD COLUMN booking_fee INT;


INSERT INTO ticket_type (type_id, ticket_type_name, ticket_price) VALUES
(1, 'Adult', 2900),
(2, 'Child', 2350),
(3, 'Student', 2450),
(4, 'Concesson', 2500),
(5, 'Senior', 2200);


INSERT INTO booking (booking_id, showing_id, booking_fee)
VALUES (1, 1, 330);


INSERT INTO booking_ticket (ticket_type_id, booking_id, ticket_qty)
VALUES (1, 1, 2);



CREATE TABLE snack_type (
  type_id INT,
  type_name VARCHAR(100),
  CONSTRAINT pk_snacktype PRIMARY KEY (type_id)
);



CREATE TABLE snack (
  snack_id INT,
  snack_type_id INT,
  snack_name VARCHAR(100),
  price INT,
  CONSTRAINT pk_snack PRIMARY KEY (snack_id),
  CONSTRAINT fk_snack_type FOREIGN KEY (snack_type_id) REFERENCES snack_type (type_id)
);

CREATE TABLE booking_snack (
  booking_id INT,
  snack_id INT,
  snack_qty INT,
  CONSTRAINT fk_booksnk_booking FOREIGN KEY (booking_id) REFERENCES booking (booking_id),
  CONSTRAINT fk_booksnk_sback FOREIGN KEY (snack_id) REFERENCES snack (snack_id)
);



INSERT INTO snack_type (type_id, type_name) VALUES
(1, 'Drinks'),
(2, 'Hot Food');



INSERT INTO snack (snack_id, snack_type_id, snack_name, price) VALUES
(1, 1, 'Cappuccino', 420),
(2, 1, 'Flat White', 420),
(3, 1, 'Latte', 420),
(4, 1, 'Long Black', 420),
(5, 2, 'Chips', 720),
(6, 2, 'Garlic Bread', 630),
(7, 2, 'Margherita Pizza', 1600);




ALTER TABLE booking
ADD COLUMN email_address VARCHAR(350);

ALTER TABLE booking
ADD COLUMN created_datetime DATETIME;


/*
View movies and directors
*/


SELECT
m.movie_id,
d.director_id,
d.director_name,
m.title,
m.status,
m.age_rating,
m.runtime_min,
m.release_date,
m.trailer_link,
m.description,
m.banner_text,
m.header_image,
m.poster_image,
m.synopsis
FROM movie m
INNER JOIN director d ON m.director_id = d.director_id;



/*
View movies and people
*/

SELECT
m.movie_id,
d.director_id,
d.director_name,
m.title,
m.status,
m.age_rating,
m.runtime_min,
m.release_date,
m.trailer_link,
m.description,
m.banner_text,
m.header_image,
m.poster_image,
m.synopsis,
c.cast_name
FROM movie m
INNER JOIN director d ON m.director_id = d.director_id
INNER JOIN movie_cast mc ON mc.movie_id = m.movie_id
INNER JOIN cast_member c ON mc.cast_id = c.cast_id;



/*
View movies and genres,
using string aggregation
*/

SELECT
m.movie_id,
d.director_id,
d.director_name,
m.title,
m.status,
m.age_rating,
m.runtime_min,
m.release_date,
m.trailer_link,
m.description,
m.banner_text,
m.header_image,
m.poster_image,
m.synopsis,
c.cast_name,
GROUP_CONCAT(g.genre_name SEPARATOR ', ') AS genres
FROM movie m
INNER JOIN director d ON m.director_id = d.director_id
INNER JOIN movie_cast mc ON mc.movie_id = m.movie_id
INNER JOIN cast_member c ON mc.cast_id = c.cast_id
INNER JOIN movie_genre mg ON m.movie_id = mg.movie_id
INNER JOIN genre g ON mg.genre_id = g.genre_id
GROUP BY m.movie_id,
d.director_id,
d.director_name,
m.title,
m.status,
m.age_rating,
m.runtime_min,
m.release_date,
m.trailer_link,
m.description,
m.banner_text,
m.header_image,
m.poster_image,
m.synopsis,
c.cast_name;


SELECT
s.state_name,
c.cinema_name
FROM state s
INNER JOIN cinema c ON s.state_id = c.state_id;


SELECT
time_id,
showing_datetime
FROM showing_time
WHERE movie_id = 1
AND cinema_id = 13
ORDER BY showing_datetime ASC;


SELECT
t.type_id,
t.type_name,
f.feature_id,
f.feature_name,
f.feature_description
FROM feature_type t
INNER JOIN feature f ON t.type_id = f.type_id
ORDER BY t.type_id ASC, f.feature_id ASC;

SELECT
st.showing_datetime,
f.feature_name,
f.feature_description
FROM showing_time st
INNER JOIN showing_feature sf ON st.time_id = sf.showing_id
INNER JOIN feature f ON sf.feature_id = f.feature_id
WHERE st.time_id = 2;



SELECT
t.type_name,
s.snack_name,
s.price
FROM snack_type t
INNER JOIN snack s ON t.type_id = s.snack_type_id;