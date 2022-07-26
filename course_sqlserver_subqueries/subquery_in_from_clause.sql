--Subquery in FROM clause

SELECT games_year,
season,
COUNT(id) AS num_competitors
FROM (
	SELECT
	g.games_year,
	g.season,
	gc.id
	FROM games g
	INNER JOIN games_competitor gc ON g.id = gc.games_id
) sub
GROUP BY games_year, season
ORDER BY games_year ASC;

