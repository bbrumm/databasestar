SELECT *
FROM steam_reviews LIMIT 100;



/*
SQL 01
Main query
The starting point of the video
This shows a cost of 13,251 with the medium_reviews file (approx 100k rows)
For 1m rows, cost is 142,267, time taken is 13 seconds
For 10m rows, cost is 1,533,828, time taken is 167 seconds
For 100m+ rows, cost is X, time taken is X (duration 2832 seconds, fetching 212 seconds, total 3044 seconds = 51 minutes
*/

SELECT
game, 
recommendationid,
review,
votes_up,
FROM_UNIXTIME(timestamp_created) AS created_date
FROM steam_reviews
WHERE (
	author_steamid IN (
        #Find the author IDs of the top 10% of authors based on the number of games owned
		SELECT
		author_steamid
		FROM (
			SELECT
			author_steamid,
			PERCENT_RANK () OVER (ORDER BY author_num_games_owned DESC) AS rank_games_owned
			FROM steam_reviews
		) s
		WHERE s.rank_games_owned <= 0.10
	)
	OR author_steamid IN (
		#Find the author IDs of the top 10% of authors based on play time
		SELECT
		author_steamid
		FROM (
			SELECT
			author_steamid,
			PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime
			FROM steam_reviews
		) s
		WHERE s.rank_playtime <= 0.10
	)
    OR author_steamid IN (
		#Find the author IDs of the top 10% of authors based on number of reviews
		SELECT
		author_steamid
		FROM (
			SELECT
			author_steamid,
			PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
			FROM steam_reviews
		) s
		WHERE s.rank_num_reviews <= 0.10
  )
)
AND votes_up > 0
AND language = 'english'
ORDER BY votes_up DESC;

/*
SQL 02
Create indexes
*/

CREATE INDEX idx_sr_authorid ON steam_reviews (author_steamid);
CREATE INDEX idx_sr_where ON steam_reviews (votes_up, language);

/*
SQL 03
Create descending index
*/

CREATE INDEX idx_sr_votesup ON steam_reviews (votes_up DESC);

/*
SQL 04
Combine three subqueries into one
*/


SELECT
game, 
recommendationid,
review,
votes_up,
FROM_UNIXTIME(timestamp_created) AS created_date
FROM steam_reviews
WHERE (
	author_steamid IN (
        #Find the author IDs of the top 10% of authors based on different criteria
		SELECT
		author_steamid
		FROM (
			SELECT
			author_steamid,
			PERCENT_RANK () OVER (ORDER BY author_num_games_owned DESC) AS rank_games_owned,
            PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime,
            PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
			FROM steam_reviews
		) s
		WHERE s.rank_games_owned <= 0.10
        OR s.rank_playtime <= 0.10
        OR s.rank_num_reviews <= 0.10
	)
)
AND votes_up > 0
AND language = 'english'
ORDER BY votes_up DESC;

/*
SQL 05
Use a temp table
Create the temp table
For 10m rows: 176 seconds
*/

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

CREATE TEMPORARY TABLE top_authors AS
SELECT
author_steamid
FROM (
	SELECT
	author_steamid,
	PERCENT_RANK () OVER (ORDER BY author_num_games_owned DESC) AS rank_games_owned,
    PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime,
    PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
	FROM steam_reviews
) s;

/*
This has table lock errors
Perhaps filter it by the top 10
*/

/*
SQL 06
Update query
*/


SELECT
game, 
recommendationid,
review,
votes_up,
FROM_UNIXTIME(timestamp_created) AS created_date
FROM steam_reviews
WHERE author_steamid IN (
        #Find the author IDs of the top 10% of authors based on the criteria in the temp table
		SELECT
		author_steamid
		FROM top_authors
        WHERE rank_games_owned <= 0.10
	    OR rank_playtime <= 0.10
	    OR rank_num_reviews <= 0.10
  )
AND votes_up > 0
AND language = 'english'
ORDER BY votes_up DESC;


/* SQL 07 */
SELECT COUNT(*)
FROM top_authors;


/* SQL 08 */
SELECT COUNT(*)
FROM top_authors
WHERE rank_games_owned <= 0.10
OR rank_playtime <= 0.10
OR rank_num_reviews <= 0.10;

/* SQL 09 */

DROP TABLE top_authors;

CREATE TEMPORARY TABLE top_authors AS
SELECT
author_steamid
FROM (
	SELECT
	author_steamid,
	PERCENT_RANK () OVER (ORDER BY author_num_games_owned DESC) AS rank_games_owned,
    PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime,
    PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
	FROM steam_reviews
) s
WHERE s.rank_games_owned <= 0.10
OR s.rank_playtime <= 0.10
OR s.rank_num_reviews <= 0.10;

/* SQL 10 */


SELECT
game, 
recommendationid,
review,
votes_up,
FROM_UNIXTIME(timestamp_created) AS created_date
FROM steam_reviews
WHERE author_steamid IN (
        #Find the author IDs of the top 10% of authors based on the criteria in the temp table
		SELECT
		author_steamid
		FROM top_authors
  )
AND votes_up > 0
AND language = 'english'
ORDER BY votes_up DESC;

/* SQL 11 */

SELECT
r.game, 
r.recommendationid,
r.review,
r.votes_up,
FROM_UNIXTIME(r.timestamp_created) AS created_date
FROM steam_reviews r
INNER JOIN top_authors a ON r.author_steamid = a.author_steamid
WHERE r.votes_up > 0
AND r.language = 'english'
ORDER BY r.votes_up DESC;

/* SQL 12 */

SELECT *
FROM top_authors;


/* SQL 13 */

SELECT
COUNT(*) as rowcount,
COUNT(DISTINCT author_steamid) AS distinct_count
FROM top_authors;

/* SQL 14 */

DROP TABLE top_authors;

CREATE TEMPORARY TABLE top_authors AS
SELECT DISTINCT
author_steamid
FROM (
	SELECT
	author_steamid,
	PERCENT_RANK () OVER (ORDER BY author_num_games_owned DESC) AS rank_games_owned,
    PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime,
    PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
	FROM steam_reviews
) s
WHERE rank_games_owned <= 0.10
OR rank_playtime <= 0.10
OR rank_num_reviews <= 0.10;

/* SQL 15 */

SELECT
r.game, 
r.recommendationid,
r.review,
r.votes_up,
FROM_UNIXTIME(r.timestamp_created) AS created_date
FROM steam_reviews r
INNER JOIN top_authors a ON r.author_steamid = a.author_steamid
WHERE r.votes_up > 0
AND r.language = 'english'
ORDER BY r.votes_up DESC;

/* SQL 16 */

CREATE INDEX idx_topauth_authid ON top_authors (author_steamid);

/* SQL 17 */

CREATE TEMPORARY TABLE steam_reviews_top_authors AS 
SELECT
r.game, 
r.recommendationid,
r.review,
r.votes_up,
FROM_UNIXTIME(r.timestamp_created) AS created_date
FROM steam_reviews r
INNER JOIN top_authors a ON r.author_steamid = a.author_steamid
WHERE r.votes_up > 0
AND r.language = 'english';

/* SQL 18 */

SELECT
game,
recommendationid,
review,
votes_up,
created_date
FROM steam_reviews_top_authors
ORDER BY votes_up DESC;

/* SQL 19 */

DROP TABLE top_authors;

CREATE TABLE top_authors AS
SELECT DISTINCT
author_steamid
FROM (
	SELECT
	author_steamid,
	PERCENT_RANK () OVER (ORDER BY author_num_games_owned DESC) AS rank_games_owned,
    PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime,
    PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
	FROM steam_reviews
) s
WHERE rank_games_owned <= 0.10
OR rank_playtime <= 0.10
OR rank_num_reviews <= 0.10;

/* SQL 20 */

DROP TABLE steam_reviews_top_authors;

CREATE TABLE steam_reviews_top_authors AS 
SELECT
r.game, 
r.recommendationid,
r.review,
r.votes_up,
FROM_UNIXTIME(r.timestamp_created) AS created_date
FROM steam_reviews r
INNER JOIN top_authors a ON r.author_steamid = a.author_steamid
WHERE r.votes_up > 0
AND r.language = 'english';

/* SQL 21 */

SELECT
game,
recommendationid,
review,
votes_up,
created_date
FROM steam_reviews_top_authors
ORDER BY votes_up DESC;

/* SQL 22 */

SELECT
game,
recommendationid,
review,
votes_up,
created_date
FROM steam_reviews_top_authors
ORDER BY r.votes_up DESC
LIMIT 100 OFFSET 0;

/* SQL 23 */

SELECT
game,
recommendationid,
review,
votes_up,
created_date
FROM steam_reviews_top_authors
ORDER BY r.votes_up DESC, recommendationid ASC
LIMIT 100 OFFSET 0;

/* SQL 24 */

CREATE INDEX idx_staging_order ON steam_reviews_top_authors (votes_up DESC, recommendationid ASC);



