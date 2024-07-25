SELECT *
FROM steam_reviews;

/*
Query for analysis
*/

SELECT
game,
FROM_UNIXTIME(timestamp_created) AS created_date,
votes_up
FROM steam_reviews
WHERE written_during_early_access = 0;