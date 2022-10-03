/*
Sample data for splitting strings in SQL
*/

/*
Create and populate movie table
*/

CREATE TABLE movie (
  movie_title VARCHAR(100),
  category VARCHAR(200)
);

INSERT INTO movie (movie_title, category) VALUES ('The Avengers','action, superhero,fantasy');
INSERT INTO movie (movie_title, category) VALUES ('The Ring', 'horror,thriller');
INSERT INTO movie (movie_title, category) VALUES ('Titanic', 'romance,drama');
INSERT INTO movie (movie_title, category) VALUES ('Wedding Crashers', 'drama,comedy,romance');

/*
Oracle
*/
SELECT
REGEXP_SUBSTR (
  'The quick brown fox', '[^ ]+', 1, level
) AS string_parts
FROM dual
CONNECT BY REGEXP_SUBSTR (
  'The quick brown fox', '[^ ]+', 1, level
) IS NOT NULL;


SELECT
REGEXP_SUBSTR (
  'Once upon a time, there were three little ducks: Huey, Duey, and Louie.',
  '[^,]+', 1, level) AS string_parts
FROM dual
CONNECT BY REGEXP_SUBSTR (
  'Once upon a time, there were three little ducks: Huey, Duey, and Louie.',
  '[^,]+', 1, level) IS NOT NULL;



SELECT
movie_title,
REGEXP_SUBSTR(
  category,
  '[^,]+', 1, level) AS split_category
FROM movie
CROSS JOIN LATERAL (
  SELECT level rn
  FROM dual
  CONNECT BY level <=
    length ( category ) - length ( replace ( category, ',' ) ) + 1
);




/*
SQL Server
*/

SELECT value
FROM STRING_SPLIT('The quick brown fox', ' ');


SELECT value
FROM STRING_SPLIT('Once upon a time, there were three little ducks: Huey, Duey, and Louie.', ',');


SELECT value
FROM STRING_SPLIT('The quick brown fox', ' ', 1);


SELECT
movie_title,
value
FROM movie
CROSS APPLY STRING_SPLIT(category, ',');

/*
MySQL
*/


/* Example 1 */
SELECT
  SUBSTRING_INDEX(SUBSTRING_INDEX('The quick brown fox', ' ', numbers.n), ' ', -1) name
FROM
  (select 1 AS n UNION ALL
   select 2 union all select 3 union all
   select 4 union all select 5
   )  numbers
   WHERE CHAR_LENGTH('The quick brown fox') - CHAR_LENGTH(REPLACE('The quick brown fox', ' ', '')) >= numbers.n-1
	ORDER BY n ASC;


/* Example 2 */
SELECT
  SUBSTRING_INDEX(
    SUBSTRING_INDEX(
      'Once upon a time, there were three little ducks: Huey, Duey, and Louie.', ',', numbers.n
    ), ',', -1) AS string_parts
FROM
  (select 1 AS n UNION ALL
   select 2 union all select 3 union all
   select 4 union all select 5
   ) numbers
   WHERE CHAR_LENGTH(
     'Once upon a time, there were three little ducks: Huey, Duey, and Louie.'
     ) - CHAR_LENGTH(
       REPLACE('Once upon a time, there were three little ducks: Huey, Duey, and Louie.', ',', '')
	) >= numbers.n-1
	ORDER BY n ASC;
   
/* Example 3 JSON */

select t.id, j.name
from mytable t
join json_table(
  replace(json_array(t.name), ',', '","'),
  '$[*]' columns (name varchar(50) path '$')
) j

/* Example 4 */

SELECT
movie.movie_title,
SUBSTRING_INDEX(
  SUBSTRING_INDEX(
    movie.category, ',', numbers.n
  ), ',', -1
) AS category_name
FROM
  (select 1 AS n UNION ALL
   select 2 union all select 3 union all
   select 4 union all select 5
   ) numbers
INNER JOIN movie
  ON CHAR_LENGTH(movie.category)
     - CHAR_LENGTH(REPLACE(movie.category, ',', '')) >= numbers.n-1
ORDER BY movie_title, n;

/*
Postgres
*/

SELECT UNNEST(
  STRING_TO_ARRAY('The quick brown fox', ' ')
) AS string_parts;

SELECT UNNEST(
  STRING_TO_ARRAY('Once upon a time, there were three little ducks: Huey, Duey, and Louie.', ',')
) AS string_parts;


SELECT
movie_title,
UNNEST(
  STRING_TO_ARRAY(movie.category, ',')
) AS category_name
FROM movie;