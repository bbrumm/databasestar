/*
Authors and customer names
*/
SELECT first_name || ' ' || last_name AS fullname
FROM customer
UNION
SELECT author_name
FROM author;


