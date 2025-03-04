WITH totalWeight as (
    select Queue.*
    , sum(weight) OVER (order by turn) as Total_Weight
    FROM Queue
)

SELECT person_name
FROM totalWeight
WHERE Total_Weight <= 1000
ORDER BY Total_Weight DESC
LIMIT 1
