/*
Update supplier values
Oracle, SQL Server, MySQL, Postgres
*/

UPDATE supplier
SET supplier_id = 1
WHERE supplier_name = 'Smith';

UPDATE supplier
SET supplier_id = 2
WHERE supplier_name = 'Hush';

UPDATE supplier
SET supplier_id = 3
WHERE supplier_name = 'Ralph Lauren';

UPDATE supplier
SET supplier_id = 4
WHERE supplier_name = 'Nike';

UPDATE supplier
SET supplier_id = 5
WHERE supplier_name = 'Adidas';

UPDATE supplier
SET supplier_id = 6
WHERE supplier_name = 'Harrods';


SELECT
supplier_id,
supplier_name,
city,
num_employees
FROM supplier;
