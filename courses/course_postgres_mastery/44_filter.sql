/*
Filter JSON
*/

--SQL 01
SELECT publisher_id, publisher_details
FROM publisher_contacts;

--SQL 02
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details = '{"contacts": [{"email": "michelle_b@abacus.com", "first_name": "Michelle"}]}';

--SQL 03
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details LIKE '%Michelle%';

--SQL 04
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details -> 'contacts' -> 0 -> 'first_name' = 'Michelle';

--SQL 05
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details -> 'contacts' -> 0 ->> 'first_name' = 'Michelle';

--SQL 06
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details -> 'contacts' -> 0 ->> 'first_name' = 'Chris';

--SQL 07
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details -> 'contacts' -> 0 ? 'status' = true;

--SQL 08
SELECT
publisher_details -> 'contacts' -> 0 ->> 'status' AS status,
COUNT(*) AS rowcount
FROM publisher_contacts
GROUP BY publisher_details -> 'contacts' -> 0 ->> 'status'; 