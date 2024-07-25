SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile=1;

DROP TABLE steam_reviews;

CREATE TABLE steam_reviews (
  recommendationid INT,
  appid INT,
  game VARCHAR(1000),
  author_steamid BIGINT,
  author_num_games_owned INT,
  author_num_reviews INT,
  author_playtime_forever INT,
  author_playtime_last_two_weeks INT,
  author_playtime_at_review INT,
  author_last_played INT,
  language VARCHAR(500),
  review VARCHAR(6000),
  timestamp_created VARCHAR(100),
  timestamp_updated VARCHAR(100),
  voted_up INT,
  votes_up INT,
  votes_funny INT,
  weighted_vote_score INT,
  comment_count INT,
  steam_purchase INT,
  received_for_free INT,
  written_during_early_access INT,
  hidden_in_steam_china INT,
  steam_china_location VARCHAR(500)
);

TRUNCATE TABLE steam_reviews;

/*
Import the CSV file
*/
LOAD DATA LOCAL INFILE  
'/Users/BB/Downloads/small_reviews.csv'
INTO TABLE steam_reviews  
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    recommendationid, appid, game, author_steamid, author_num_games_owned,
    author_num_reviews, author_playtime_forever, author_playtime_last_two_weeks,
    author_playtime_at_review, author_last_played, language, review, 
    timestamp_created, timestamp_updated, voted_up, votes_up, 
    votes_funny, weighted_vote_score, comment_count, steam_purchase, 
    received_for_free, written_during_early_access, hidden_in_steam_china, 
    steam_china_location
);



SELECT *
FROM steam_reviews;


SELECT *
FROM steam_reviews
WHERE recommendationid = 148919350;


