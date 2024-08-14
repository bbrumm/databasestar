/*
JSON into rows
*/

--SQL 01
SELECT publisher_id, publisher_details
FROM publisher_contacts;

--SQL 02
SELECT
publisher_id,
JSONB_EACH(publisher_details -> 'contacts' -> 0)
FROM publisher_contacts;

--SQL 03
SELECT
publisher_id,
key,
value
FROM publisher_contacts,
JSONB_EACH(publisher_details -> 'contacts' -> 0);

--SQL 04
SELECT
publisher_id,
key,
value
FROM publisher_contacts,
JSONB_EACH_TEXT(publisher_details -> 'contacts' -> 0);

--SQL 05
SELECT
publisher_id,
JSONB_ARRAY_ELEMENTS(publisher_details -> 'contacts')
FROM publisher_contacts;