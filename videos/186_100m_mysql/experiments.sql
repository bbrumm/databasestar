CREATE TABLE test_ntile (
id INTEGER,
owned_games INTEGER
);

INSERT INTO test_ntile (id, owned_games) VALUES
(1, 6975),
(2, 6365),
(3, 4978),
(4, 3244),
(5, 3941),
(6, 3922),
(7, 6734),
(8, 8822),
(9, 9708),
(10, 3354),
(11, 5521),
(12, 7928),
(13, 716),
(14, 9947),
(15, 5376),
(16, 9236),
(17, 9074),
(18, 7116),
(19, 2554),
(20, 5614),
(21, 9022),
(22, 1712),
(23, 2097),
(24, 308),
(25, 9335),
(26, 3814),
(27, 8333),
(28, 9073),
(29, 1158),
(30, 6635),
(31, 2884),
(32, 9941),
(33, 2850),
(34, 3432),
(35, 7360),
(36, 4037),
(37, 1243),
(38, 7764),
(39, 5923),
(40, 748),
(41, 3228),
(42, 441);

SELECT id, owned_games
FROM test_ntile
ORDER BY owned_games DESC;

SELECT id, owned_games,
NTILE(10) OVER(ORDER BY owned_games DESC) AS ten_percentile,
PERCENT_RANK () OVER (ORDER BY owned_games DESC) AS rank_games_owned
FROM test_ntile
ORDER BY owned_games DESC;

ALTER TABLE test_ntile
ADD COLUMN is_top_10_games_owned INT;

UPDATE test_ntile
SET is_top_10_games_owned = 1
WHERE NTILE(10) OVER(ORDER BY owned_games DESC) = 1;

/*
Create a table with the top 10 IDs
*/
SELECT
author_steamid
FROM (
	SELECT
	author_steamid,
	NTILE(10) OVER(ORDER BY author_num_games_owned DESC) AS percentile_ten
	FROM steam_reviews
) s
WHERE s.percentile_ten = 1;


