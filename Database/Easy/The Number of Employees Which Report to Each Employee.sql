select e1.employee_id, e1.name, count(e2.reports_to) as reports_count, round(avg(e2.age)) as average_age
from Employees e1
join Employees e2
on e1.employee_id = e2.reports_to
group by e1.employee_id
order by employee_id
