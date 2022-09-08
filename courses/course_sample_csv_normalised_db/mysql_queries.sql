/*
Lesson 07
*/
CREATE TABLE title_role (
	id INT,
	role_name VARCHAR(20),
	CONSTRAINT pk_titlerole PRIMARY KEY (id)
);

INSERT INTO title_role (id, role_name)
VALUES (1, 'ACTOR');

INSERT INTO title_role (id, role_name)
VALUES (2, 'DIRECTOR');

/*
Alter table to add new field and FK
*/
ALTER TABLE credits
ADD COLUMN role_id INT;

ALTER TABLE credits
ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES title_role(id);

UPDATE credits
SET role_id = 1
WHERE role = 'ACTOR';

UPDATE credits
SET role_id = 2
WHERE role = 'DIRECTOR';

SELECT c.person_id, c.id, c.name, c.character, t.role_name
FROM credits c
INNER JOIN title_role t ON c.role_id = t.id;

ALTER TABLE credits
DROP COLUMN role;

ALTER TABLE credits
CHANGE COLUMN id title_id TEXT;


/*
Lesson 08
*/
SELECT *
FROM titles;

SELECT type, COUNT(*)
FROM titles
GROUP BY type;

CREATE TABLE title_type (
    id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(20),
    CONSTRAINT pk_titletype PRIMARY KEY (id)
);

SELECT DISTINCT type
FROM titles;

INSERT INTO title_type (type_name)
SELECT DISTINCT type
FROM titles;

SELECT *
FROM title_type;

ALTER TABLE titles
ADD COLUMN title_type_id INT;

ALTER TABLE titles
ADD CONSTRAINT fk_titletype_id FOREIGN KEY (title_type_id) REFERENCES title_type(id);

--Confirm that these IDs are correct once I insert into the table
UPDATE titles
SET title_type_id = 1
WHERE type = 'SHOW';

UPDATE titles
SET title_type_id = 2
WHERE type = 'MOVIE';

SELECT
id,
title,
type,
title_type_id
FROM titles;


ALTER TABLE titles
DROP COLUMN type;

SELECT
t.id,
t.name
t.type,
t.title_type_id,
ty.type_name
FROM titles t
INNER JOIN title_type ty ON t.title_type_id = ty.id;


/*
Lesson 09
*/

SELECT *
FROM titles;


SELECT age_certification, COUNT(*)
FROM titles
GROUP BY age_certification;


CREATE TABLE age_certification (
    id INT NOT NULL AUTO_INCREMENT,
    certification_value VARCHAR(20),
    CONSTRAINT pk_certification PRIMARY KEY (id)
);

SELECT DISTINCT age_certification
FROM titles;

SELECT DISTINCT age_certification
FROM titles
WHERE age_certification != '';

INSERT INTO age_certification (certification_value)
SELECT DISTINCT age_certification
FROM titles
WHERE age_certification != '';


#--Alter
ALTER TABLE titles
ADD COLUMN age_certification_id INT;

ALTER TABLE titles
ADD CONSTRAINT fk_agecert_id FOREIGN KEY (age_certification_id) REFERENCES age_certification(id);


UPDATE titles
SET age_certification_id = 
CASE
 WHEN age_certification = 'TV MA' THEN 1
 WHEN age_certification = 'R' THEN 2
 WHEN age_certification = 'PG' THEN 3
 WHEN age_certification = 'TV-14' THEN 4
 WHEN age_certification = 'G' THEN 5
 WHEN age_certification = 'PG-13' THEN 6
 WHEN age_certification = 'TV-PG' THEN 7
 WHEN age_certification = 'TV-Y' THEN 8
 WHEN age_certification = 'TV-G' THEN 9
 WHEN age_certification = 'TV-Y7' THEN 10
 WHEN age_certification = 'NC-17' THEN 11
END;


SELECT 
t.id,
t.title,
t.description,
t.age_certification,
ac.certification_value
FROM titles t
INNER JOIN age_certification ac ON t.age_certification_id = ac.id;

#--Check for mistmatches
SELECT 
t.id,
t.title,
t.description,
t.age_certification,
ac.certification_value
FROM titles t
INNER JOIN age_certification ac ON t.age_certification_id = ac.id
WHERE t.age_certification != ac.certification_value;

ALTER TABLE titles
DROP COLUMN age_certification;



/*
Lesson 10 Genres
*/

CREATE TABLE genres (
  id INT NOT NULL AUTO_INCREMENT,
  genre_value VARCHAR(100),
  CONSTRAINT pk_genre PRIMARY KEY (id)
);


CREATE TABLE genre_titles (
  title_id VARCHAR(20),
  genre_id INT,
  CONSTRAINT fk_gt_title FOREIGN KEY (title_id) REFERENCES titles(id),
  CONSTRAINT fk_gt_genre FOREIGN KEY (genre_id) REFERENCES genres(id)
);

ALTER TABLE titles
ADD CONSTRAINT pk_titles PRIMARY KEY (id);

ALTER TABLE titles
MODIFY id VARCHAR(20);

#--Get unique lists

SELECT genres, COUNT(*)
FROM titles
GROUP BY genres;

SELECT *
FROM titles
WHERE id = 'tm185072';

/*
SELECT id,
genres,
JSON_EXTRACT(genres, '$[0]')
FROM titles
WHERE id = 'tm185072';



SELECT id, genres,
REPLACE(genres, '''', '"'),
JSON_EXTRACT(REPLACE(genres, '''', '"'), '$[0]')
FROM titles
WHERE id = 'tm185072';
*/

/*
Find unique genre values for a movie
*/
SELECT
t.id,
t.genres,
j.genre_value
FROM titles t
INNER JOIN JSON_TABLE(
	REPLACE(genres, '''', '"'),
    '$[*]' columns (genre_value VARCHAR(50) path '$')
) j
WHERE t.id = 'tm185072';


SELECT
j.genre_value
FROM titles t
INNER JOIN JSON_TABLE(
	REPLACE(genres, '''', '"'),
    '$[*]' columns (genre_value VARCHAR(50) path '$')
) j
WHERE t.id = 'tm185072';

/*
Find all unique genres
*/
SELECT DISTINCT j.genre_value
FROM titles t
INNER JOIN JSON_TABLE(
	REPLACE(genres, '''', '"'),
    '$[*]' columns (genre_value VARCHAR(50) path '$')
) j;


/*
Insert into table
*/
INSERT INTO genres (genre_value)
SELECT DISTINCT j.genre_value
FROM titles t
INNER JOIN JSON_TABLE(
	REPLACE(genres, '''', '"'),
    '$[*]' columns (genre_value VARCHAR(50) path '$')
) j;

SELECT id, genre_value
FROM genres;

/*
REPLACE(genres, '''', '"'),
JSON_EXTRACT(REPLACE(genres, '''', '"'), '$[0]')
FROM titles
WHERE id = 'tm185072';
*/

/*
Find genre records for a movie
*/
SELECT id, title, genres
FROM titles
WHERE id = 'tm185072';

#--Find genre records for all movies - LIKE
SELECT
t.id,
t.title,
t.genres,
g.id, 
g.genre_value
FROM titles t
INNER JOIN genres g 
ON t.genres LIKE '%' || g.genre_value || '%'
WHERE t.id = 'tm185072';

#--Find genre records for all movies
SELECT
t.id,
t.title,
t.genres,
g.id, 
g.genre_value
FROM titles t
CROSS JOIN genres g 
WHERE t.id = 'tm185072'
AND INSTR(t.genres, g.genre_value) > 0;


SELECT
t.id,
t.title,
t.genres,
g.id, 
g.genre_value
FROM titles t
CROSS JOIN genres g 
WHERE INSTR(t.genres, g.genre_value) > 0;


#Just IDs.
SELECT
t.id,
g.id
FROM titles t
CROSS JOIN genres g 
WHERE INSTR(t.genres, g.genre_value) > 0;

/*
Insert into genre titles
*/

INSERT INTO genre_titles (title_id, genre_id)
SELECT
t.id,
g.id
FROM titles t
CROSS JOIN genres g 
WHERE 1=1
AND INSTR(t.genres, g.genre_value) > 0;


#Select from new tables
SELECT
t.id, t.title, t.genres,
g.genre_value
FROM titles t
INNER JOIN genre_titles gt ON t.id = gt.title_id
INNER JOIN genres g ON gt.genre_id = g.id
WHERE t.id = 'tm185072';


ALTER TABLE titles
DROP COLUMN genres;


/*
11 - Production Country
*/

SELECT *
FROM titles;



CREATE TABLE production_country (
  id INT NOT NULL AUTO_INCREMENT,
  country VARCHAR(50),
  CONSTRAINT pk_prodcountry PRIMARY KEY (id)
);

CREATE TABLE title_production_country (
  title_id VARCHAR(20),
  country_id INT,
  CONSTRAINT fk_tpc_title FOREIGN KEY (title_id) REFERENCES titles(id),
  CONSTRAINT fk_tpc_country FOREIGN KEY (country_id) REFERENCES production_country(id)
);



#--Find unique production countries
SELECT DISTINCT j.country_value
FROM titles t
INNER JOIN JSON_TABLE(
	REPLACE(production_countries, '''', '"'),
    '$[*]' columns (country_value VARCHAR(50) path '$')
) j;


INSERT INTO production_country (country)
SELECT DISTINCT j.country_value
FROM titles t
INNER JOIN JSON_TABLE(
	REPLACE(production_countries, '''', '"'),
    '$[*]' columns (country_value VARCHAR(50) path '$')
) j;

#--Find matches for all movies
SELECT
t.id,
t.title,
t.production_countries,
c.id, 
c.country
FROM titles t
CROSS JOIN production_country c
WHERE 1=1
AND INSTR(t.production_countries, c.country) > 0;




#--Insert
INSERT INTO title_production_country (title_id, country_id)
SELECT
t.id,
c.id
FROM titles t
CROSS JOIN production_country c
WHERE 1=1
AND INSTR(t.production_countries, c.country) > 0;


#Select from new tables
SELECT
t.id,
t.title,
pc.country
FROM titles t
INNER JOIN title_production_country tpc ON t.id = tpc.title_id
INNER JOIN production_country pc ON tpc.country_id = pc.id
WHERE t.id = 'tm185072';

ALTER TABLE titles
DROP COLUMN production_countries;


#--Cleanup (optional)
DROP TABLE title_production_country;
DROP TABLE production_country;

/*
Lesson 12 Select queries
*/

#Select all movies
SELECT *
FROM titles;

#Movie ID: tm127384

#Select all actors in a movie
SELECT
c.name,
c.character
FROM credits c
INNER JOIN title_role tr ON c.role_id = tr.id
WHERE c.title_id = 'tm127384'
AND tr.role_name = 'ACTOR';

SELECT
c.name,
c.character
FROM credits c
WHERE c.title_id = 'tm127384'
AND c.role_id = 1;

#Select all movies directed by Martin Scorsese
SELECT
t.title,
t.release_year
FROM titles t
INNER JOIN credits c ON t.id = c.title_id
INNER JOIN title_role tr ON c.role_id = tr.id
WHERE tr.role_name = 'DIRECTOR'
AND c.name = 'Martin Scorsese';

#All movies after year 2000
SELECT
t.title,
t.description,
t.release_year
FROM titles t
INNER JOIN title_type tt ON t.title_type_id = tt.id
WHERE t.release_year > 2000
AND tt.type_name = 'MOVIE';
