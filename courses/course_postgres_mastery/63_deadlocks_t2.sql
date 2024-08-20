/*
Deadlocks - Transaction 2
*/

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
UPDATE courier
SET courier_name = 'Star Track Ltd'
WHERE id = 5;

--SQL 03
UPDATE courier
SET courier_name = 'AU Post'
WHERE id = 4;

--SQL 03
COMMIT;