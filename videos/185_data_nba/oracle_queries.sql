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
g.team_name_away,
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
can I make a view to simplify the way to get win and loss records?
or a CTE?
*/







