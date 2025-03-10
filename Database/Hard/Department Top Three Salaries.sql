WITH cte as (
    SELECT id
    , name
    , salary
    , departmentId
    , DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as s_rank
    FROM Employee
)

SELECT Department.name  as Department
, cte.name as Employee
, cte.salary as Salary
from cte, Department
WHERE s_rank <= 3
AND Department.id = cte.departmentId
