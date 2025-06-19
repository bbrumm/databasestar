SELECT publisher_id, publisher_details
FROM publisher_contacts;


SELECT publisher_id, publisher_details
FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Chris';


DELETE FROM publisher_contacts
WHERE JSON_VALUE(publisher_details, '$.contacts[0].first_name') = 'Chris';