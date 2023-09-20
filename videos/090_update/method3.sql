/*
Method 3: loop and rowcount
This will:
- select the rows to update into a temp table
- select the top 1000 from the temp table
- remove the rows from the temp table once it is updated
*/

/*
Create table for IDs to update
*/
CREATE TABLE ids_to_update AS
SELECT id
FROM comments_2m
WHERE INSTR(text, '&quot;') > 0;

/*
Create table for the current batch
*/
CREATE TABLE ids_current_batch (
	id INT
);

CREATE INDEX idx_idstoupdate ON ids_to_update (id);
CREATE INDEX idx_idsbatch ON ids_current_batch (id);

/*
Repeat from here
*/

INSERT INTO ids_current_batch (id)
SELECT id
FROM ids_to_update
LIMIT 1000;

/*
Update data
*/
UPDATE comments_2m c
INNER JOIN ids_current_batch u ON c.id = u.id
SET c.text = REPLACE(c.text, '&quot;', '''');

/*
Then remove the updated records from the ids_to_update table
*/
DELETE FROM ids_to_update
WHERE id IN (
  SELECT id
  FROM ids_current_batch
);

/*
Remove from the current batch table
*/
DELETE FROM ids_current_batch;

/*
Repeat all of these steps until data is all updated.
*/