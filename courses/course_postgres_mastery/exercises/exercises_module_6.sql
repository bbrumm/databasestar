/*
Exercises from the PostgreSQL Mastery course
Module 6
*/

/* 38-01 */

CREATE TABLE my_json (
  id INTEGER,
  some_data JSONB
);

INSERT INTO my_json (id, some_data)
VALUES (1, '{"color":"red"}');


/* 38-02 */

CREATE TABLE product_details (
  id INTEGER,
  product_name TEXT,
  product_attributes JSONB
);

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (1, 'Jeans', '{"fit":"regular"}');

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (2, 'Running Shoes',  '{"color":"red"}');

/* 39-01 */

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (3, 'Jacket', '{"size":"M", "color":"Black"}');

/* 39-02 */

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (4, 'Backpack', '{"color":"Black", "dimensions":{"height":"100","width":"40","depth":"60"}}');

/* 40-01 */

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (5, 'Striped T-shirt', '{"color":["blue", "red", "white"]}');

/* 41-01 */

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (6, 'Plain T-shirt', JSONB_BUILD_OBJECT('color', 'white', 'size', 'L'));

/* 41-02 */

SELECT
address_id,
street_number,
street_name,
city,
country_id,
JSONB_BUILD_OBJECT(
	'address_id', address_id,
	'street_number', street_number,
	'street_name', street_name,
	'city', city,
	'country_id', country_id
) AS row_as_json
FROM address;

/* 42-01 */

SELECT
ROW_TO_JSON(b) AS book_records
FROM (
  SELECT
  book_id, 
  title, 
  isbn13, 
  language_id, 
  num_pages, 
  publication_date, 
  publisher_id 
  FROM book
) b;

/* 42-02 */

SELECT
ROW_TO_JSON(b) AS book_records
FROM (
  SELECT
  book_id, 
  title, 
  isbn13, 
  language_id, 
  num_pages, 
  publication_date, 
  publisher_id 
  FROM book
  WHERE book_id = 10
) b;

/* 42-03 */

INSERT INTO product_details (id, product_name, product_attributes)
VALUES (7, 'Book',
    SELECT
    ROW_TO_JSON(b) AS book_records
    FROM (
    SELECT
    book_id, 
    title, 
    isbn13, 
    language_id, 
    num_pages, 
    publication_date, 
    publisher_id 
    FROM book
    WHERE book_id = 10
    )
);

/* 43-01 */

SELECT
id,
product_name,
product_attributes,
product_attributes -> 'color' AS color
FROM product_details;

/* 44-01 */

SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details -> 'contacts' -> 0 -> 'email' = 'sarah@firstworldbooks.com';

/* 44-02 */

SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details -> 'contacts' -> 1 -> 'first_name' = 'Joanne';

/* 45-01 */

SELECT
publisher_id,
JSONB_ARRAY_ELEMENTS(publisher_details -> 'contacts')
FROM publisher_contacts;

/* 45-02 */

SELECT
publisher_id,
contact_details,
contact_details ->> 'email' AS email,
contact_details ->> 'first_name' AS first_name,
contact_details ->> 'status' AS status
FROM (
	SELECT
	publisher_id,
	JSONB_ARRAY_ELEMENTS(publisher_details -> 'contacts') AS contact_details
	FROM publisher_contacts
) s;

/* 46-01 */

UPDATE publisher_contacts
SET publisher_details = JSONB_SET(publisher_details, '{contacts, 0, last_name}', '"Anderson"')
WHERE publisher_id = 15;

/* 46-02 */

UPDATE publisher_contacts
SET publisher_details = JSONB_SET(publisher_details, '{contacts, 0, email}', '"sarah@firstworld.com"')
WHERE publisher_id = 3;