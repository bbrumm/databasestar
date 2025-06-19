CREATE TABLE publisher_contacts (
  publisher_id INT,
  publisher_details NVARCHAR(4000)
);



INSERT INTO publisher_contacts (publisher_id, publisher_details)
VALUES (1, '
  {"contacts":[{
    "first_name":"John",
    "email":"john@teneighteen.com"
  }]}
'); 

INSERT INTO publisher_contacts (publisher_id, publisher_details)
VALUES (3, '
  {"contacts":[{
    "first_name":"Sarah",
    "email":"sarah@firstworldbooks.com"
  },
  {
    "first_name":"Jack",
    "email":"jack@firstworldbooks.com"
  }]}
');


INSERT INTO publisher_contacts (publisher_id, publisher_details)
VALUES (8, '
  {"contacts":[{
    "first_name":"Michelle",
    "email":"michelle_b@abacus.com"
  }]}
');

INSERT INTO publisher_contacts (publisher_id, publisher_details)
VALUES (12, '
  {"contacts":[{
    "first_name":"Chris",
    "email":"chris_donaldson@abingdonpress.com",
    "status":"inactive"
  },
  {
    "first_name":"Joanne",
    "email":"jo.smith@abingdonpress.com",
    "status":"active"
  }]}
'); 

INSERT INTO publisher_contacts (publisher_id, publisher_details)
VALUES (15, '
  {"contacts":[{
    "first_name":"Tom",
    "email":"tsmith@abrams.com"
  }]}
');


SELECT
publisher_id,
publisher_details
FROM publisher_contacts;



SELECT
publisher_id,
publisher_details,
JSON_VALUE(publisher_details, '$.first_name') AS first_name
FROM publisher_contacts;



SELECT
publisher_id,
publisher_details,
JSON_VALUE(publisher_details, '$.contacts') AS contacts
FROM publisher_contacts;


SELECT
publisher_id,
publisher_details,
JSON_VALUE(publisher_details, '$.contacts[0].first_name') AS first_name
FROM publisher_contacts;


SELECT
publisher_id,
publisher_details,
JSON_VALUE(publisher_details, '$.contacts[0].first_name') AS first_name,
JSON_VALUE(publisher_details, '$.contacts[0].email') AS email,
JSON_VALUE(publisher_details, '$.contacts[0].status') AS status
FROM publisher_contacts;