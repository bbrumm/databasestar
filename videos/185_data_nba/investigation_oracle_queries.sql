SELECT * FROM game_summary
order by game_date_est desc;

select * from game
order by game_date desc;

/*
Game ID 0042200405
Den vs Mia. Denver is home.
12 Jun 2023
Real result: Den 94 v Mia 89

WL_HOME seems to say if the home team wins.
pts_home is the home team score
pts_away
*/

SELECT team_name,
SUM(wins) AS wins
FROM (
    SELECT
    g.team_name_home AS team_name,
    COUNT(*) AS wins
    FROM game g
    WHERE g.wl_home = 'W'
    GROUP BY g.team_name_home
    
    UNION ALL
    
    SELECT
    g.team_name_away,
    COUNT(*)
    FROM game g
    WHERE g.wl_away = 'W'
    GROUP BY g.team_name_away
)
GROUP BY team_name
ORDER BY wins DESC;

/* Is there a way to get wins and losses but keep the query simple */


SELECT
g.team_name_home,
CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END AS wins,
CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END AS losses
FROM game g;


SELECT
g.team_name_home,
SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
FROM game g
GROUP BY g.team_name_home;


SELECT
g.team_name_away,
SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
FROM game g
GROUP BY g.team_name_away;

/* Q1 */
SELECT
team_name,
SUM(wins) AS wins,
SUM(losses) AS losses
FROM (
    SELECT
    g.team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game g
    GROUP BY g.team_name_home
    UNION ALL
    SELECT
    g.team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game g
    GROUP BY g.team_name_away
)
GROUP BY team_name
ORDER BY wins DESC;

/* Question 2 Analysis */
/*
season ID seems to be a combo of 2 for reg season or 4 for playoffs, then the 4-digit year
*/

SELECT *
FROM game
ORDER BY game_date DESC;

SELECT *
FROM game
WHERE season_id = 22022;


/*
use a CTE, then select the values
*/

WITH season_records AS (
    SELECT
    g.season_id,
    g.team_name_home AS team_name,
    SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game g
    GROUP BY g.season_id, g.team_name_home
    UNION ALL
    SELECT
    g.season_id,
    g.team_name_away,
    SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM game g
    GROUP BY g.season_id, g.team_name_away
)
SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_records
ORDER BY win_pct DESC;

/*
it shows a bunch of 1-prefix seasons
scroll down to something 2 that is recent
but it doesn't add up to 82
turns out the home and away records are different rows
so we need to SUM them inside the CTE
*/



WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
)

SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_records
ORDER BY win_pct DESC;

/*
first order by season_id
this shows the data by season
maybe filter by 22018
check against the NBA standings on Google
confirmed: the season ID refers to the start of the season.
22018 = season 2018-2019
now order by the win_pct desc

it shows all kinds of seasons including all star
Prefixes:
1 - Pre-Season
2 - Regular Season
3 - All-Star
4 - Playoffs

*/

SELECT
season_type,
season_id,
COUNT(*)
FROM game
GROUP BY season_type, season_id
ORDER BY season_type, season_id;



WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
)

SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_records
ORDER BY win_pct DESC, wins DESC;

/*
seems to be missing Phila 1976 season
all 1975 and all 1976 data actually
*/

SELECT season_id, COUNT(*)
FROM game
GROUP BY season_id
ORDER BY season_id ASC;

/*
otherwise that query is correct
*/


/* Q3 */


WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
)

SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_records
ORDER BY win_pct ASC, wins ASC;

/* Q4 */
/* Five-season run */



WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
)

SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_records
ORDER BY team_name ASC, season_id ASC;

/*
add a rolling sum of wins for the previous 5 years
*/


WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_record_with_window AS (
    SELECT
    season_id,
    team_name,
    wins,
    losses,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season_id ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_past_5yrs,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season_id ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_past_5yrs
    FROM season_records
)
SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct,
wins_past_5yrs,
losses_past_5yrs,
ROUND(wins_past_5yrs / (wins_past_5yrs + losses_past_5yrs), 3) AS win_pct_5yrs
FROM season_record_with_window
--ORDER BY team_name ASC, season_id ASC
ORDER BY win_pct_5yrs DESC, wins_past_5yrs DESC
;


/*
query seems good
now let's order it by the win_pct_5yrs column in desc order.
this will show the year that ends in the best win pct
shows a couple of single-season records at the top
how do we filter these out?
maybe add some kind of counter in the frame clause
*/




WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_record_with_window AS (
    SELECT
    season_id,
    team_name,
    wins,
    losses,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season_id ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS wins_past_5yrs,
    SUM(losses) OVER (
      PARTITION BY team_name
      ORDER BY season_id ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS losses_past_5yrs,
    COUNT(*) OVER (
      PARTITION BY team_name
      ORDER BY season_id ASC
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS seasons_included
    FROM season_records
)
SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct,
wins_past_5yrs,
losses_past_5yrs,
ROUND(wins_past_5yrs / (wins_past_5yrs + losses_past_5yrs), 3) AS win_pct_5yrs,
seasons_included
FROM season_record_with_window
WHERE seasons_included = 5
--ORDER BY team_name ASC, season_id ASC
ORDER BY win_pct_5yrs DESC, wins_past_5yrs DESC
;

/*
this query seems correct
scroll to the bottom to see the worst
*/

/* Q5 */
/* biggest change in wins between two seasons 
let's start with something like the earlier query
*/




WITH season_records AS (
    SELECT
    season_id,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
)

SELECT
season_id,
team_name,
wins,
losses,
ROUND(wins / (wins + losses), 3) AS win_pct
FROM season_records
ORDER BY team_name ASC, season_id ASC;

/*
add a LAG function to get the wins from the previous season
*/


WITH season_records AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_records_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    LAG(wins, 1) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_records
)
SELECT
season,
team_name,
wins,
losses,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_records_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY wins_increase DESC;

/*
comments on this:
- top result, 2007 Boston, is valid according to Wikipedia. They drafted Allen and Garnet
- 2007 Hornets refers to 2004 as the prev season due to missing data and the name changing
it would be ideal to have a list of years as a left join
- 1977 Nuggets, this is the first season we have for this team
- 1997 Spurs, valid. they drafted Duncan, and the previous year Robinson was injured.
overall the results are good but the underlying data is questionable

Is there a way to look for the previous actual year, rather than the previous row?

Charlotte Bobcats 2012 is missing and is a good example, roughly row 153.
Seasons are from 1946 to 2022
*/

SELECT
MIN(SUBSTR(season_id, 2, 4)) AS min_season,
MAX(SUBSTR(season_id, 2, 4)) AS max_season
FROM game;




WITH season_records AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_records_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    LAG(wins, 1) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_records
)
SELECT
season,
team_name,
wins,
losses,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_records_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY team_name ASC, season ASC;


/*
Generate a series of numbers for the years
*/

SELECT
LEVEL + 1945 AS season
FROM dual
CONNECT BY LEVEL <= 2022 - 1946 + 1;

/*
Use this as a CTE to populate the seasons
*/



WITH season_list AS (
    SELECT
    LEVEL + 1945 AS season
    FROM dual
    CONNECT BY LEVEL <= 2022 - 1946 + 1
),
season_records AS (
    SELECT
    SUBSTR(season_id, 2, 4) AS season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_records_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    LAG(wins, 1) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
    ) AS wins_prev_season
    FROM season_records
)
SELECT
s.season,
r.team_name,
r.wins,
r.losses,
r.wins_prev_season,
r.wins - r.wins_prev_season AS wins_increase
FROM season_list s
LEFT JOIN season_records_with_prev r ON s.season = r.season
--WHERE r.wins_prev_season IS NOT NULL
ORDER BY r.team_name ASC, s.season ASC;

/* this doesn't work because there's no record of the team for a season.
so the 2012 Charlotte Bobcats does not show. the 2012 record shows, but there is a null team for it

perhaps a MAX with a RANGE 1 PRECEDING could work?
*/



WITH season_records AS (
    SELECT
    TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_records_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    LAG(wins, 1) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
    ) AS wins_prev_season,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING --change this to 1 preceding once it works
    ) AS wins_prev_season_max
    FROM season_records
)
SELECT
season,
team_name,
wins,
losses,
wins_prev_season,
wins_prev_season_max
--wins - wins_prev_season AS wins_increase
FROM season_records_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY team_name ASC, season ASC;

/*
using MAX with preceding works
update the query to remove records where this is null
*/


WITH season_records AS (
    SELECT
    TO_NUMBER(SUBSTR(season_id, 2, 4)) AS season,
    team_name,
    SUM(wins) AS wins,
    SUM(losses) AS losses
    FROM (
        SELECT
        g.season_id,
        g.team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_home
        UNION ALL
        SELECT
        g.season_id,
        g.team_name_away,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
        FROM game g
        WHERE g.season_type = 'Regular Season'
        GROUP BY g.season_id, g.team_name_away
    )
    GROUP BY season_id, team_name
),
season_records_with_prev AS (
    SELECT
    season,
    team_name,
    wins,
    losses,
    SUM(wins) OVER (
      PARTITION BY team_name
      ORDER BY season ASC
      RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING --change this to 1 preceding once it works
    ) AS wins_prev_season
    FROM season_records
)
SELECT
season,
team_name,
wins,
wins_prev_season,
wins - wins_prev_season AS wins_increase
FROM season_records_with_prev
WHERE wins_prev_season IS NOT NULL
ORDER BY wins_increase DESC;

/*
Results are:
- 2007 Boston - OK, they had Garnett and Allen
- 1997 San Antonio - OK, they drafted Duncan
- 1999 LA Lakers - OK, hired Phil Jackson
- 1989 San Antonio - OK, hired David Robinson
- 2004 Phoenix - OK, added Steve Nash

Seems like a big player addition, or a head coach, can really turn things around

Worst 5?
- 1998 Chicago - MJ retired
- 2019 Golden State - KD left, Curry injured, Klay injured
- 2010 Cleveland - OK, Lebron moved to Miami
- 1996 San Antonio - OK, David Robinson was injured
- 1998 Seattle - OK, had some injuries, shorter season due to lockout


QUERY DONE

*/
