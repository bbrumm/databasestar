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
  review VARCHAR(8000),
  timestamp_created VARCHAR(100),
  timestamp_updated VARCHAR(100),
  voted_up BIGINT,
  votes_up BIGINT,
  votes_funny BIGINT,
  weighted_vote_score INT,
  comment_count INT,
  steam_purchase INT,
  received_for_free INT,
  written_during_early_access INT,
  hidden_in_steam_china VARCHAR(10),
  steam_china_location VARCHAR(500)
);

TRUNCATE TABLE steam_reviews;

/*
Import the CSV file
1m rows - takes 12 sec
10m rows - takes 128 seconds
100m+ rows - takes 1,606 seconds
*/
LOAD DATA LOCAL INFILE  
'/Users/BB/Downloads/reviews_10m.csv'
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
