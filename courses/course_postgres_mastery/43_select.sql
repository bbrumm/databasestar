/*
Selecting attributes
*/


--SQL 01
CREATE TABLE publisher_contacts (
  publisher_id INTEGER,
  publisher_details JSONB
);

--SQL 02
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


--SQL 03
SELECT
publisher_id,
publisher_details
FROM publisher_contacts;

--SQL 04
SELECT
publisher_id,
publisher_details,
publisher_details -> 'first_name' AS first_name
FROM publisher_contacts;

--SQL 05
SELECT
publisher_id,
publisher_details,
publisher_details -> 'contacts' AS contacts
FROM publisher_contacts;

--SQL 06
SELECT
publisher_id,
publisher_details,
publisher_details -> 'contacts' -> 0 AS contact_person
FROM publisher_contacts;


--SQL 07
SELECT
publisher_id,
publisher_details,
publisher_details -> 'contacts' -> 0 -> 'first_name' AS first_name
FROM publisher_contacts;

--SQL 08
SELECT
publisher_id,
publisher_details,
publisher_details -> 'contacts' -> 0 ->> 'first_name' AS first_name
FROM publisher_contacts;

--SQL 09
SELECT
publisher_id,
publisher_details,
publisher_details -> 'contacts' -> 0 ->> 'first_name' AS first_name,
publisher_details -> 'contacts' -> 0 ->> 'email' AS email,
publisher_details -> 'contacts' -> 0 ->> 'status' AS status
FROM publisher_contacts;
