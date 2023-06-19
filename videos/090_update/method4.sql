/*
Method 4: IDs in temp table
*/
CREATE TEMPORARY TABLE ids_to_update AS
SELECT id
FROM comments_2m
WHERE INSTR(text, '&quot;') > 0;

CREATE INDEX idx_idstoupdate ON ids_to_update (id);


UPDATE comments_2m c
INNER JOIN ids_to_update u ON c.id = u.id
SET c.text = REPLACE(c.text, '&quot;', '''');

