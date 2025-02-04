/*
Updates
*/

--SQL 01
SELECT publisher_id, publisher_details
FROM publisher_contacts;

--SQL 02
UPDATE publisher_contacts
SET publisher_details = JSON_MERGEPATCH (
    publisher_details,
    '{"review_date":"2025-09-01"}'
)
WHERE publisher_id = 15;


--SQL 03
UPDATE publisher_contacts
SET publisher_details = JSON_MERGEPATCH (
    publisher_details,
    '{"first_name":"Thomas"}'
)
WHERE publisher_id = 15;

--SQL 04
UPDATE publisher_contacts
SET publisher_details = JSON_MERGEPATCH (
    publisher_details,
    '{"contacts":[{"first_name":"Thomas","email":"tsmith@abrams.com"}]}'
)
WHERE publisher_id = 15;

COMMIT;