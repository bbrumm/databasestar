/*
Delete JSON
*/

--SQL 01
SELECT publisher_id, publisher_details
FROM publisher_contacts;

--SQL 02
SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Chris';

--SQL 03
DELETE FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Chris';

COMMIT;