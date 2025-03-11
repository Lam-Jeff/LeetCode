WITH RECURSIVE CTE AS (
    SELECT employee_id
    , employee_name 
    , 1 AS level
    , CONCAT(employee_id, "-" ) as team
    , salary
    FROM Employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id
    , e.employee_name 
    , CTE.level + 1 AS level
    , CAST(CONCAT(CTE.team, CONCAT(e.employee_id, "-" )) AS CHAR(255))  as team
    , e.salary
    FROM Employees e
    JOIN CTE 
    ON e.manager_id = CTE.employee_id
)
, CTE_intermediate AS (
    SELECT e.employee_id
    , CTE.employee_id as sub_employee
    , CTE.salary
    FROM CTE
    JOIN Employees e
    ON  CTE.TEAM  REGEXP CONCAT("^",e.employee_id ,'-')
    OR CTE.TEAM  REGEXP CONCAT("-", e.employee_id ,'-')
)
SELECT  CTE.employee_id
, CTE.employee_name
, CTE.level
, (COUNT(*)-1) AS team_size
, SUM(CTE_intermediate.salary) as budget
FROM CTE_intermediate
JOIN CTE
ON CTE.employee_id = CTE_intermediate.employee_id 
GROUP BY CTE.employee_id
ORDER BY level ASC, budget DESC, CTE.employee_name ASC
