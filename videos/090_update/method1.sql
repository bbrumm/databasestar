SELECT *
FROM comments_2m;

SELECT COUNT(*)
FROM comments_2m;

SELECT COUNT(*)
FROM comments_2m
WHERE INSTR(text, '&quot;') > 0;


/*
Method 1: update
*/
UPDATE comments_2m
SET text = REPLACE(text, '&quot;', '''');
