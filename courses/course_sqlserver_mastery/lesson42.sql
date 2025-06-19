SELECT publisher_id, publisher_details
FROM publisher_contacts;



UPDATE publisher_contacts
SET publisher_details = JSON_MODIFY(
	publisher_details,
	'$.contacts[0].review_date',
	'2025-09-01'
)
WHERE publisher_id = 15;



UPDATE publisher_contacts
SET publisher_details = JSON_MODIFY(
	publisher_details,
	'$.contacts[0].first_name',
	'Thomas'
)
WHERE publisher_id = 15;