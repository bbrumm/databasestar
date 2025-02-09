/*
Deadlocks - Transaction 2
*/

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
UPDATE courier
SET courier_name = 'Star Track Ltd'
WHERE id = 1;

--SQL 03
UPDATE courier
SET courier_name = 'AU Post'
WHERE id = 6;

--SQL 03
COMMIT;