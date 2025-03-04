select unionTable.employee_id
from 
(select e.employee_id
from Employees e
left outer JOIN Salaries s 
on e.employee_id = s.employee_id
where s.employee_id is null
union 
select s.employee_id
from Salaries s
left outer JOIN  Employees e
on e.employee_id = s.employee_id
where e.employee_id is null
) as unionTable
order by unionTable.employee_id
