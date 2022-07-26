

/* Insert all 2000 customers */
INSERT INTO customer_address (customer_id, address_id, status_id)
SELECT c.customer_id,
       (SELECT address_id
    FROM address
    ORDER BY RAND()
    LIMIT 1),
    1
FROM customer c;

/* Add a second active address for 750 of those customers */
INSERT INTO customer_address (customer_id, address_id, status_id)
SELECT customer_id, address_id, 1
FROM (
         SELECT ca.customer_id,
                (SELECT address_id
                 FROM address
                 ORDER BY RAND()
                 LIMIT 1) AS address_id
         FROM customer_address ca
         ORDER BY RAND()

     ) sub
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address c
    WHERE c.customer_id = sub.customer_id
    AND c.address_id = sub.address_id
    )
LIMIT 750;

/* Add an inactive address for customers. */
INSERT INTO customer_address (customer_id, address_id, status_id)
SELECT customer_id, address_id, 2
FROM (
         SELECT ca.customer_id,
                (SELECT address_id
                 FROM address
                 ORDER BY RAND()
                 LIMIT 1) AS address_id
         FROM customer_address ca
         ORDER BY RAND()

     ) sub
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address c
    WHERE c.customer_id = sub.customer_id
    AND c.address_id = sub.address_id
    )
LIMIT 400;

/* Add an active address for 200 customers. */
INSERT INTO customer_address (customer_id, address_id, status_id)
SELECT customer_id, address_id, 1
FROM (
         SELECT ca.customer_id,
                (SELECT address_id
                 FROM address
                 ORDER BY RAND()
                 LIMIT 1) AS address_id
         FROM customer_address ca
         ORDER BY RAND()

     ) sub
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address c
    WHERE c.customer_id = sub.customer_id
    AND c.address_id = sub.address_id
    )
LIMIT 200;
