
/* Generate customer_address data */

WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
1
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn;


/*Insert 1000 customers*/
INSERT INTO customer_address (customer_id, address_id, status_id)
WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
1
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn;


/*Insert next 1000 customers*/
INSERT INTO customer_address (customer_id, address_id, status_id)
WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
1
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address ca
    WHERE ca.customer_id = c.customer_id
    AND ca.address_id = a.address_id
);



/*Add a second active address for 750 of those customers*/
INSERT INTO customer_address (customer_id, address_id, status_id)
WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
1
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address ca
    WHERE ca.customer_id = c.customer_id
    AND ca.address_id = a.address_id
)
FETCH NEXT 750 ROWS ONLY;




/*Add an inactive address for customers.*/
INSERT INTO customer_address (customer_id, address_id, status_id)
WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
2
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address ca
    WHERE ca.customer_id = c.customer_id
    AND ca.address_id = a.address_id
)
FETCH NEXT 400 ROWS ONLY;


/*Add an active address for 200 customers.*/
INSERT INTO customer_address (customer_id, address_id, status_id)
WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
1
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_address ca
    WHERE ca.customer_id = c.customer_id
    AND ca.address_id = a.address_id
)
FETCH NEXT 200 ROWS ONLY;

COMMIT;
