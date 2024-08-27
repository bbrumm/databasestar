/*
Updates
*/

--SQL 01
SELECT publisher_id, publisher_details
FROM publisher_contacts;

--SQL 02
UPDATE publisher_contacts
SET publisher_details = publisher_details || '{"review_date":"2025-09-01"}'
WHERE publisher_id = 15;

--SQL 03
UPDATE publisher_contacts
SET publisher_details = JSONB_SET(publisher_details, '{contacts, 0, first_name}', '"Thomas"')
WHERE publisher_id = 15;

--SQL 04
UPDATE publisher_contacts
SET publisher_details = JSONB_SET(publisher_details, '{contacts, 0, status}', '"active"')
WHERE publisher_id = 15;
