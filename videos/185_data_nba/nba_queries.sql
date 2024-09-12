/*
Queries to analyse the NBA data set
*/

/* SQL 01 */

SELECT *
FROM player;

/* SQL 02 */

SELECT *
FROM team;

/* SQL 03 */

SELECT *
FROM game;

/* SQL 04 */

SELECT
game_date,
team_name_home,
team_name_away,
wl_home,
wl_away
FROM game;

/* SQL 05 */

SELECT
game_date,
team_name_home,
team_name_away,
wl_home,
wl_away
FROM game
ORDER BY game_date DESC;

/* SQL 06 */

SELECT
team_name_home,
COUNT(*) AS wins
FROM game
WHERE wl_home = 'W'
GROUP BY team_name_home;

/* SQL 07 */


SELECT
team_name_home AS team_name,
COUNT(*) AS wins
FROM game
WHERE wl_home = 'W'
GROUP BY team_name_home
UNION ALL
SELECT team_name_away,
COUNT(*)
FROM game
WHERE wl_away = 'W'
GROUP BY team_name_away
ORDER BY team_name ASC;

/* SQL 08 */

SELECT
team_name_home,
CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END AS wins,
CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END AS losses
FROM game;

/* SQL 09 */

SELECT
team_name_home,
SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
FROM game
GROUP BY team_name_home;

/* SQL 10 */

SELECT
team_name_home AS team_name,
SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
FROM game
GROUP BY team_name_home
UNION ALL
SELECT
team_name_away,
SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
FROM game
GROUP BY team_name_away
ORDER BY team_name ASC;

/* SQL 11 */

SELECT
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY team_name_home
    UNION ALL
    SELECT
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY team_name_away
)
GROUP BY team_name
ORDER BY team_name ASC;

/* SQL 12 */

SELECT
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY team_name_home
    UNION ALL
    SELECT
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY team_name_away
)
GROUP BY team_name
ORDER BY wins DESC;


/*
===
Q2
===
*/


/* SQL 13 */


SELECT
season_id,
season_type,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    season_id,
    season_type,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY season_id, season_type, team_name_home
    UNION ALL
    SELECT
    season_id,
    season_type,
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY season_id, season_type, team_name_away
)
GROUP BY season_id, season_type, team_name;

/* SQL 14 */


SELECT
season,
season_type,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    season_type,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY season_id, season_type, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    season_type,
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    GROUP BY season_id, season_type, team_name_away
)
GROUP BY season, season_type, team_name;

/* SQL 15 */

SELECT
season,
season_type,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    season_type,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, season_type, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    season_type,
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, season_type, team_name_away
)
GROUP BY season, season_type, team_name;


/* SQL 16 */

SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
GROUP BY season, team_name;

/* SQL 17 */

WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM season_record
GROUP BY season, team_name;

/* SQL 18 */

WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses,
SUM(wins) / SUM(wins + losses) AS win_pct
FROM season_record
GROUP BY season, team_name;

/* SQL 19 */

WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses,
ROUND(SUM(wins) / SUM(wins + losses), 3) AS win_pct
FROM season_record
GROUP BY season, team_name;

/* SQL 20 */

WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses,
ROUND(SUM(wins) / SUM(wins + losses), 3) AS win_pct
FROM season_record
GROUP BY season, team_name
ORDER BY win_pct DESC;

/*
Q3
*/


/* SQL 21 */


WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses,
ROUND(SUM(wins) / SUM(wins + losses), 3) AS win_pct
FROM season_record
GROUP BY season, team_name
ORDER BY win_pct ASC;

/*
Q4
*/

/* SQL 22 */

WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses,
ROUND(SUM(wins) / SUM(wins + losses), 3) AS win_pct
FROM season_record
GROUP BY season, team_name
ORDER BY win_pct DESC;

/* SQL 23 */

WITH season_record AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_home
    UNION ALL
    SELECT
    SUBSTR(season_id, 2, 4),
    team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game
    WHERE season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
season,
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses,
ROUND(SUM(wins) / SUM(wins + losses), 3) AS win_pct
FROM season_record
GROUP BY season, team_name
ORDER BY team_name ASC, season ASC;

/* SQL 24 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
)
SELECT
season,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_record
ORDER BY team_name ASC, season ASC;

/* SQL 25 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
)
SELECT
season,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct,
SUM(wins) OVER (
  PARTITION BY team_name
  ORDER BY season ASC
) AS wins_5y
FROM season_record
ORDER BY team_name ASC, season ASC;


/* SQL 26 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
)
SELECT
season,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct,
SUM(wins) OVER (
  PARTITION BY team_name
  ORDER BY season ASC
  ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
) AS wins_5y
FROM season_record
ORDER BY team_name ASC, season ASC;

/* SQL 27 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
)
SELECT
season,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct,
SUM(wins) OVER (
  PARTITION BY team_name
  ORDER BY season ASC
  ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
) AS wins_5y,
SUM(losses) OVER (
  PARTITION BY team_name
  ORDER BY season ASC
  ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
) AS losses_5y
FROM season_record
ORDER BY team_name ASC, season ASC;

/* SQL 28 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_5y AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    ROUND(wins / (wins + losses), 3) AS win_pct,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_5y,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_5y
    FROM season_record
)
SELECT
season,
team_name,
wins,
losses,
win_pct,
wins_5y,
losses_5y,
ROUND(wins_5y / (wins_5y + losses_5y), 3) AS win_pct_5y
FROM season_5y
ORDER BY team_name ASC, season ASC;

/* SQL 29 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_5y AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    ROUND(wins / (wins + losses), 3) AS win_pct,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_5y,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_5y
    FROM season_record
)
SELECT
season,
team_name,
wins,
losses,
win_pct,
wins_5y,
losses_5y,
ROUND(wins_5y / (wins_5y + losses_5y), 3) AS win_pct_5y
FROM season_5y
ORDER BY win_pct_5y DESC;

/* SQL 30 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_5y AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    ROUND(wins / (wins + losses), 3) AS win_pct,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_5y,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_5y,
    COUNT(*) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS seasons_included
    FROM season_record
)
SELECT
season,
team_name,
wins,
losses,
win_pct,
wins_5y,
losses_5y,
ROUND(wins_5y / (wins_5y + losses_5y), 3) AS win_pct_5y,
seasons_included
FROM season_5y
ORDER BY win_pct_5y DESC;

/* SQL 31 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_5y AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    ROUND(wins / (wins + losses), 3) AS win_pct,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_5y,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_5y,
    COUNT(*) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS seasons_included
    FROM season_record
)
SELECT
season,
team_name,
wins,
losses,
win_pct,
wins_5y,
losses_5y,
ROUND(wins_5y / (wins_5y + losses_5y), 3) AS win_pct_5y
FROM season_5y
WHERE seasons_included = 5
ORDER BY win_pct_5y DESC;

/* SQL 32 */


WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_5y AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    ROUND(wins / (wins + losses), 3) AS win_pct,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_5y,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_5y,
    COUNT(*) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS seasons_included
    FROM season_record
)
SELECT
season,
team_name,
wins,
losses,
win_pct,
wins_5y,
losses_5y,
ROUND(wins_5y / (wins_5y + losses_5y), 3) AS win_pct_5y
FROM season_5y
WHERE team_name = 'Golden State Warriors'
ORDER BY season ASC;

/*
Q5
*/

/* SQL 33 */


WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
)
SELECT
season,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_record
ORDER BY team_name ASC, season ASC;


/* SQL 34 */


WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
)
SELECT
season,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct,
LAG(wins, 1) OVER (
    PARTITION BY team_name
    ORDER BY season ASC
) AS wins_prev_season
FROM season_record
ORDER BY team_name ASC, season ASC;


/* SQL 35 */


WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season
FROM season_with_prev
ORDER BY team_name ASC, season ASC;


/* SQL 36 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
ORDER BY team_name ASC, season ASC;

/* SQL 37 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
ORDER BY wins_increase DESC;

/* SQL 38 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY wins_increase DESC;


/* SQL 39 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
WHERE team_name = 'New Orleans Hornets'
ORDER BY season ASC;

/* SQL 40 */

SELECT
MIN(SUBSTR(season_id, 2, 4)) AS min_season,
MAX(SUBSTR(season_id, 2, 4)) AS max_season
FROM game;

/* SQL 41 */

SELECT
LEVEL
FROM dual
CONNECT BY LEVEL <= 10;

/* SQL 42 */

SELECT
LEVEL + 1945 AS season
FROM dual
CONNECT BY LEVEL <= 2022 - 1946 + 1;

/* SQL 43 */


WITH season_list AS (
    SELECT
    LEVEL + 1945 AS season
    FROM dual
    CONNECT BY LEVEL <= 2022 - 1946 + 1
), season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
s.season,
p.team_name,
p.wins,
p.wins_prev_season,
p.wins - p.wins_prev_season AS wins_increase
FROM season_list s
LEFT JOIN season_with_prev p ON s.season = p.season
WHERE p.team_name = 'New Orleans Hornets'
ORDER BY s.season ASC;

/* SQL 44 */

WITH season_list AS (
    SELECT
    LEVEL + 1945 AS season
    FROM dual
    CONNECT BY LEVEL <= 2022 - 1946 + 1
), season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
s.season,
p.team_name,
p.wins,
p.wins_prev_season,
p.wins - p.wins_prev_season AS wins_increase
FROM season_list s
LEFT JOIN season_with_prev p ON s.season = p.season
ORDER BY p.team_name ASC, s.season ASC;

/* SQL 45 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
WHERE team_name = 'New Orleans Hornets'
ORDER BY season ASC;

/* SQL 46 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        SUBSTR(season_id, 2, 4) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        SUBSTR(season_id, 2, 4),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season,
    SUM(wins) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
        RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING
    ) AS wins_prev_season_sum
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase,
wins_prev_season_sum
FROM season_with_prev
WHERE team_name = 'New Orleans Hornets'
ORDER BY season ASC;

/* SQL 47 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    LAG(wins, 1) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
    ) AS wins_prev_season,
    SUM(wins) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
        RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING
    ) AS wins_prev_season_sum
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase,
wins_prev_season_sum
FROM season_with_prev
WHERE team_name = 'New Orleans Hornets'
ORDER BY season ASC;


/* SQL 48 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    SUM(wins) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
        RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
WHERE team_name = 'New Orleans Hornets'
ORDER BY season ASC;


/* SQL 49 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    SUM(wins) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
        RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
ORDER BY wins_increase DESC;


/* SQL 50 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    SUM(wins) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
        RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY wins_increase DESC;


/* SQL 51 */

WITH season_record AS (
    SELECT
    season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_home
        UNION ALL
        SELECT
        TO_NUMBER(SUBSTR(season_id, 2, 4)),
        team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game
        WHERE season_type = 'Regular Season'
        GROUP BY season_id, team_name_away
    )
    GROUP BY season, team_name
),
season_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    SUM(wins) OVER (
        PARTITION BY team_name
        ORDER BY season ASC
        RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING
    ) AS wins_prev_season
    FROM season_record
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY wins_increase ASC;

