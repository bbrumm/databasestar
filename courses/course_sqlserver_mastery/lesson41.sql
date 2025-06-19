SELECT publisher_id, publisher_details
FROM publisher_contacts;


SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details = '{"contacts":[{"first_name":"Michelle","email":"michelle_b@abacus.com"}]}';



SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE publisher_details LIKE '%Michelle%';


SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Michelle';



SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Chris';


SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_PATH_EXISTS(publisher_details, '$.contacts[0].status') = 1;



SELECT
JSON_VALUE(publisher_details, '$.contacts[0].status') AS status,
COUNT(*) AS rowcount
FROM publisher_contacts
GROUP BY JSON_VALUE(publisher_details, '$.contacts[0].status'); 


