/*
Reset - drop indexes
*/

ALTER TABLE view_stats DROP INDEX idx_vs_challenge;
ALTER TABLE contests DROP INDEX idx_cn_contestid;
ALTER TABLE colleges DROP INDEX idx_cl_contestid;
ALTER TABLE challenges DROP INDEX idx_ch_collegeid;
ALTER TABLE colleges DROP INDEX idx_cl_collegeid;
ALTER TABLE submission_stats DROP INDEX idx_ss_challengeid;
ALTER TABLE contests DROP INDEX idx_cn_group;
/*
ALTER TABLE x DROP INDEX idx_sumss_challengeid;
ALTER TABLE x DROP INDEX idx_sumvs_challengeid;
ALTER TABLE x DROP INDEX idx_sumssvs_challengeid;
*/
DROP TABLE summary_ss;
DROP TABLE summary_vs;
DROP TABLE summary_ssvs;

/*
The original query to improve
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
Total Cost: 11,708,922

Step 1:
Create an index on the table in the step that has the highest cost,
which is view stats
Create on vs.challenge_Id as it is being used for a join
*/

CREATE INDEX idx_vs_challenge ON view_stats (challenge_id);

/*
Rerun explain plan:
Step is changed to full index scan
Total cost: 11,708,922
No change overall

Step 2:
Let's create an index on the leftmost table
Alias C, which is contests.
Contest ID which is the table being joined
*/

CREATE INDEX idx_cn_contestid ON contests (contest_id);

/*
Rerun explain plan:
Total cost: 718,247
The c table has changed to a non unique key lookup and moved to the second step
So the query starts at another table then joins to this one now.

Step 3:
Create index on cl table
contest_id as it is used in the same join
*/

CREATE INDEX idx_cl_contestid ON colleges(contest_id);

/*
Rerun explain plan:
Total cost: 718,247 (same)
Same, because we still need some other data from the C table which is
not in the index

Step 4: 
index on CH table

*/
CREATE INDEX idx_ch_collegeid ON challenges (college_id);

/*
Rerun explain plan:
Total cost: 43,661
Two green boxes, indexes are used both times

Step 5:
index on college.college_id
*/
CREATE INDEX idx_cl_collegeid ON colleges (college_id);

/*
Rerun explain plan:
Total cost: 43,661
(no change)

Step 6: create index on ss on the column joined
*/

CREATE INDEX idx_ss_challengeid ON submission_stats (challenge_id);

/*
Rerun explain plan:
Total cost: 43,661
(no change)

Full table scan changed to full index scan
What else can we do?
*/

/*
EXCLUDE this
Try a composite index on the grouped columns
*/

CREATE INDEX idx_cn_group ON contests (contest_id, hacker_id, name);

/*Rerun explain plan:
Total cost: 43,661
(no change)

What else can we do?
Perhaps we can rewrite the query to reduce the need for grouping
The grouping in both steps is done because of summarising data
Let's try move the HAVING clause inside each subquery, maybe that will prevent the checks twice
and reduce the number of rows.
If this doesn't help, we could try a summary table

Step 7: updated query
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
  HAVING sum(total_submissions)  <> 0
  AND sum(total_accepted_submissions) <> 0
) as ss on ss.challenge_id = ch.challenge_id
left join (
  select challenge_id,	
  sum(total_views) as tv,
  sum(total_unique_views) as tuv
  from View_Stats
  group by challenge_id
  HAVING sum(total_views)  <> 0
  AND sum(total_unique_views) <> 0
  ) as vs on vs.challenge_id = ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
order by c.contest_id;

/*
No change to plan

Step 8:
Let's try summary tables, one each for now
*/
SELECT
challenge_id,
SUM(total_submissions) AS ts,
sum(total_accepted_submissions) as tas
from Submission_Stats
group by challenge_id
HAVING sum(total_submissions)  <> 0
AND sum(total_accepted_submissions) <> 0;


CREATE TEMPORARY TABLE summary_ss
SELECT
challenge_id,
SUM(total_submissions) AS ts,
sum(total_accepted_submissions) as tas
from Submission_Stats
group by challenge_id
HAVING sum(total_submissions)  <> 0
AND sum(total_accepted_submissions) <> 0;


CREATE TEMPORARY TABLE summary_vs
select challenge_id,	
  sum(total_views) as tv,
  sum(total_unique_views) as tuv
  from View_Stats
  group by challenge_id
  HAVING sum(total_views)  <> 0
  AND sum(total_unique_views) <> 0;
  
  
  select challenge_id,	
  sum(total_views) as tv,
  sum(total_unique_views) as tuv
  from View_Stats
  group by challenge_id
  HAVING sum(total_views)  <> 0
  AND sum(total_unique_views) <> 0;

/*
Update main query
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
left join summary_ss ss on ss.challenge_id = ch.challenge_id
left join summary_vs vs on vs.challenge_id = ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
order by c.contest_id;

/*
Explain plan
Total cost: 41,349,787
or 25,933,059
Way higher, but we have no indexes

Step 9:
create indexes
*/
CREATE INDEX idx_sumss_challengeid ON summary_ss (challenge_id);
CREATE INDEX idx_sumvs_challengeid ON summary_vs (challenge_id);

/*
Explain plan again
Cost: 717
Way better!
A red box, a bunch of green boxes, then group by.
We did do a couple of different steps, but this is better

Step 10
Let's try combine two summary tables into one
*/

SELECT
ss.challenge_id,
SUM(ss.total_submissions) AS ts,
SUM(ss.total_accepted_submissions) as tas,
  sum(vs.total_views) as tv,
  sum(vs.total_unique_views) as tuv
from Submission_Stats ss
LEFT JOIN view_stats vs ON ss.challenge_id = vs.challenge_id
group by ss.challenge_id
HAVING sum(ss.total_submissions)  <> 0
AND sum(ss.total_accepted_submissions) <> 0
AND sum(total_views)  <> 0
  AND sum(total_unique_views) <> 0;


CREATE TEMPORARY TABLE summary_ssvs 
SELECT
ss.challenge_id,
SUM(ss.total_submissions) AS ts,
SUM(ss.total_accepted_submissions) as tas,
  sum(vs.total_views) as tv,
  sum(vs.total_unique_views) as tuv
from Submission_Stats ss
LEFT JOIN view_stats vs ON ss.challenge_id = vs.challenge_id
group by ss.challenge_id
HAVING sum(ss.total_submissions)  <> 0
AND sum(ss.total_accepted_submissions) <> 0
AND sum(total_views)  <> 0
  AND sum(total_unique_views) <> 0;


CREATE INDEX idx_sumssvs_challengeid ON summary_ssvs (challenge_id);

/*
Update main query
*/

select
c.contest_id,
c.hacker_id,
c.name,
sum(sv.ts),
sum(sv.tas),
sum(sv.tv),
sum(sv.tuv)
from Contests c
join Colleges cl on cl.contest_id = c.contest_id
join Challenges ch on ch.college_id = cl.college_id
left join summary_ssvs sv on sv.challenge_id = ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
order by c.contest_id;

/*
Explain plan
Cost: 607
A bit better
*/

