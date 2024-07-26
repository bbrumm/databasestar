SELECT *
FROM steam_reviews;



/*
Main query
The starting point of the video
This shows a cost of 13,251 with the medium_reviews file (approx 100k rows)
For 1m rows, cost is 142,267, time taken is 13 seconds
For 10m rows, cost is 1,533,828, time taken is 167 seconds
For 100m+ rows, cost is X, time taken is X
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

