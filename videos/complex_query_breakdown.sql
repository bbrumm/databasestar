/*
Video 73 - complex SQL query breakdown
*/

/*
01 - starting query
*/

select c.contest_id,c.hacker_id, c.name, sum(ss.ts), sum(ss.tas), sum(vs.tv),sum(vs.tuv) from Contests c
join  Colleges cl on cl.contest_id = c.contest_id
join Challenges ch on ch.college_id = cl.college_id
left join (select challenge_id,sum(total_submissions) as ts,sum(total_accepted_submissions) as tas from Submission_Stats group by challenge_id)as ss on ss.challenge_id = ch.challenge_id
left join (select challenge_id, sum(total_views) as tv,sum(total_unique_views) as tuv from View_Stats group by challenge_id ) as vs on vs.challenge_id = ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
having sum(ss.ts)<>0 and  sum(ss.tas) <> 0 and sum(vs.tv) <> 0 and sum(vs.tuv) <> 0
order by c.contest_id;

/*
02 - after manual format
*/

select
c.contest_id,
c.hacker_id,
c.name,
sum(ss.ts),
sum(ss.tas),
sum(vs.tv),
sum(vs.tuv)
from Contests c
join Colleges cl on cl.contest_id = c.contest_id
join Challenges ch on ch.college_id = cl.college_id
left join (
  select challenge_id,
  sum(total_submissions) as ts,
  sum(total_accepted_submissions) as tas
  from Submission_Stats
  group by challenge_id
) as ss on ss.challenge_id = ch.challenge_id
left join (
  select challenge_id,	
  sum(total_views) as tv,
  sum(total_unique_views) as tuv
  from View_Stats
  group by challenge_id
  ) as vs on vs.challenge_id = ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
having sum(ss.ts)<>0
  and  sum(ss.tas) <> 0
  and sum(vs.tv) <> 0
  and sum(vs.tuv) <> 0
order by c.contest_id;

/*
Check data
*/

SELECT * FROM contests;
SELECT * FROM challenges;
SELECT * FROM colleges;
SELECT * FROM submission_stats;
SELECT * FROM view_stats;

/*
Subqueries
*/

select challenge_id,
  sum(total_submissions) as ts,
  sum(total_accepted_submissions) as tas
  from Submission_Stats
  group by challenge_id;

select challenge_id,	
  sum(total_views) as tv,
  sum(total_unique_views) as tuv
  from View_Stats
  group by challenge_id;

/*
Full query
*/


select
c.contest_id,
c.hacker_id,
c.name,
sum(ss.ts),
sum(ss.tas),
sum(vs.tv),
sum(vs.tuv)
from Contests c
join Colleges cl on cl.contest_id = c.contest_id
join Challenges ch on ch.college_id = cl.college_id
left join (
  select challenge_id,
  sum(total_submissions) as ts,
  sum(total_accepted_submissions) as tas
  from Submission_Stats
  group by challenge_id
) as ss on ss.challenge_id = ch.challenge_id
left join (
  select challenge_id,	
  sum(total_views) as tv,
  sum(total_unique_views) as tuv
  from View_Stats
  group by challenge_id
  ) as vs on vs.challenge_id = ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
having sum(ss.ts)<>0
  and  sum(ss.tas) <> 0
  and sum(vs.tv) <> 0
  and sum(vs.tuv) <> 0
order by c.contest_id;