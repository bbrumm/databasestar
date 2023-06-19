/*
Method 2: Update statement with WHERE
*/
UPDATE comments_2m
SET text = REPLACE(text, '&quot;', '''')
WHERE INSTR(text, '&quot;') > 0;
