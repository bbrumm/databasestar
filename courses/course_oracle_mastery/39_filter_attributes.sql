/*
Filter JSON
*/

--SQL 01
SELECT publisher_id, publisher_details
FROM publisher_contacts;

--SQL 02
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details = '{"contacts":[{"first_name":"Michelle","email":"michelle_b@abacus.com"}]}';


--SQL 03
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details LIKE '%Michelle%';

--SQL 04
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Michelle';

--SQL 05
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Chris';

--SQL 06
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_EXISTS(publisher_details, '$.contacts[0].status');

--SQL 07
SELECT
JSON_VALUE(publisher_details, '$.contacts[0].status') AS status,
COUNT(*) AS rowcount
FROM publisher_contacts
GROUP BY JSON_VALUE(publisher_details, '$.contacts[0].status'); 