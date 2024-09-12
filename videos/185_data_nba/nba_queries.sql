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

