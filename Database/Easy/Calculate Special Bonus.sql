Select employee_id
        ,case
            when employee_id % 2 = 1 AND name NOT LIKE "M%" THEN salary
            else 0
        END as bonus
from Employees
order by employee_id
