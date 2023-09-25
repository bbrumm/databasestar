
SELECT
status_type,
status_value
FROM status_lookup
ORDER BY status_type, status_value;

SELECT
DISTINCT status
FROM product;



/* NOT EXISTS */
SELECT p.*
FROM product p
WHERE NOT EXISTS (
    SELECT status_value
    FROM status_lookup s
    WHERE s.status_value = p.status
    AND s.status_type = 'Product'
);



/* NOT IN - returns NULL*/
SELECT p.*
FROM product p
WHERE p.status NOT IN (
    SELECT status_value
    FROM status_lookup s
    WHERE s.status_type = 'Product'
);



/* NOT IN with NULL check*/
SELECT p.*
FROM product p
WHERE p.status NOT IN (
    SELECT status_value
    FROM status_lookup s
    WHERE s.status_type = 'Product'
    AND s.status_value IS NOT NULL
);



/* NOT EXISTS with explicit subquery value */
SELECT p.*
FROM product p
WHERE NOT EXISTS (
    SELECT 1
    FROM status_lookup s
    WHERE s.status_value = p.status
    AND s.status_type = 'Product'
);





