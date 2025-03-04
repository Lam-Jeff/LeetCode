with cte as (
    SELECT  visited_on
    , SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING  AND CURRENT ROW) as amount
    FROM Customer
)
SELECT DISTINCT visited_on
, amount
, ROUND(amount/7, 2) as average_amount
FROM cte
WHERE visited_on >= (SELECT min(visited_on)+6 FROM Customer)
