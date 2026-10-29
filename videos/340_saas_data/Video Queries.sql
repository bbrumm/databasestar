SELECT *
FROM customers;

SELECT SUM(monthly_amount) AS mrr
FROM subscriptions
WHERE ended_at IS NULL;

SELECT COUNT(*)
FROM subscriptions
WHERE started_at < '2024-01-01'
AND (ended_at IS NULL OR ended_at >= '2024-01-01');

SELECT COUNT(*) AS churned
FROM subscriptions
WHERE ended_at >= '2024-01-01'
AND ended_at < '2024-02-01';


WITH customers_at_start AS (
    SELECT COUNT(*) AS num_rows
    FROM subscriptions
    WHERE started_at < '2024-01-01'
    AND (ended_at IS NULL OR ended_at >= '2024-01-01')
),
churned AS (
    SELECT COUNT(*) AS num_rows
    FROM subscriptions
    WHERE ended_at >= '2024-01-01'
    AND ended_at < '2024-02-01'
)
SELECT
ROUND(churned.num_rows::numeric / customers_at_start.num_rows * 100, 2) AS churn_rate_pct
FROM customers_at_start, churned;


--LTV

WITH customers_at_start AS (
    SELECT COUNT(*) AS num_rows
    FROM subscriptions
    WHERE started_at < '2024-01-01'
    AND (ended_at IS NULL OR ended_at >= '2024-01-01')
),
churned AS (
    SELECT COUNT(*) AS num_rows
    FROM subscriptions
    WHERE ended_at >= '2024-01-01'
    AND ended_at < '2024-02-01'
),
avg_revenue AS (
    SELECT
    AVG(monthly_amount) AS avg_monthly_revenue
    FROM subscriptions
    WHERE ended_at IS NULL
)
SELECT
    ROUND(avg_revenue.avg_monthly_revenue /
          ROUND(churned.num_rows::numeric / customers_at_start.num_rows, 2)
    , 2) AS ltv
FROM customers_at_start, churned, avg_revenue;





