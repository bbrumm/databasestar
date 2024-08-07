/*
These queries are for the steps I take for the 100m rows data set
*/


/*
Find the count of rows in the table
Time taken: 35 seconds
*/

SELECT COUNT(*)
FROM steam_reviews;

/*
Count is 113,883,717
The 10% row number is 11,388,371
Find the row number for each row
Time taken: 473 seconds
Num games owned: 292
*/
SET @ten_pct_games_owned = 292;

SET @ten_pct_games_owned = (
	SELECT
	author_num_games_owned
	FROM (
		SELECT
		recommendationid,
		author_steamid,
		author_num_games_owned,
		ROW_NUMBER() OVER(ORDER BY author_num_games_owned DESC) AS row_num_games_owned
		FROM steam_reviews
	) s
	WHERE s.row_num_games_owned  =11388371
);


/*
Add new column
*/

ALTER TABLE steam_reviews
ADD COLUMN is_top_10_games_owned INT;

/*
Update in batches
Batch of 1000: time taken 0.2 sec
10,000: 0.7 sec
100,000: 5 sec - 9 sec
1,000,000: 71-92 seconds

If I do this for all three columns:
11m rows in 1m batches = 990 sec = 16 mins then x 3 for all columns = 45 mins
Probably won't reduce the main query by much then...but we can try
*/
SELECT @ten_pct_games_owned;

UPDATE steam_reviews
SET is_top_10_games_owned = 1
WHERE author_num_games_owned >= @ten_pct_games_owned
AND is_top_10_games_owned IS NULL
LIMIT 1000000;

COMMIT;

/*
Create index on this new column
*/

CREATE INDEX idx_sr_istopgames ON steam_reviews (is_top_10_games_owned);

/*
Update the main query to use this new column
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
            PERCENT_RANK () OVER (ORDER BY author_playtime_forever DESC) AS rank_playtime,
            PERCENT_RANK () OVER (ORDER BY author_num_reviews DESC) AS rank_num_reviews
			FROM steam_reviews
		) s
        WHERE s.rank_playtime <= 0.10
        OR s.rank_num_reviews <= 0.10
	)
)
AND s.is_top_10_games_owned = 1
AND votes_up > 0
AND language = 'english'
ORDER BY votes_up DESC;