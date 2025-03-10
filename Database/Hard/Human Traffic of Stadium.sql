WITH cte as (
  SELECT id
    , visit_date
    , people
    , (id - ROW_NUMBER() OVER (ORDER BY id)) as gaps
    FROM Stadium
    WHERE people >= 100
)
SELECT  id
    , visit_date
    , people
FROM cte
WHERE cte.gaps IN (SELECT gaps FROM cte GROUP BY gaps HAVING COUNT(*) >= 3)
