/*
Original query
*/

with cte as(select ids,team_name
from teams t join (select home_team_id as ids
from matches
union all
select away_team_id as ids 
from matches)  u
on t.team_id = u.ids),
cte2 as (select
team_name,
case when ids = home_team_id then home_team_goals else away_team_goals
end as goal_for,
case when ids != home_team_id then home_team_goals else away_team_goals
end as goal_against
from (
select ids,team_name,home_team_id, away_team_id,home_team_goals,away_team_goals
from(  select *
from cte c join matches m 
on c.ids = m.home_team_id
or c.ids = m.away_team_id
) tbl 
group by 1,2,3,4,5,6) tbl1
)
select team_name,count(team_name) as matches_played,
sum(points) as points,
sum(goal_for) as goal_for,
sum(goal_against) as goal_against,
sum(goal_for-goal_against) as goal_diff
from (
select *
, case 
    when goal_for < goal_against then 0
    when goal_for > goal_against then 3 
    else 1 end as points
        from cte2) tbl2
group by 1
order by points desc, goal_diff desc