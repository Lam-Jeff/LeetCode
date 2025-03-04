select Department.name as Department
, Employee.name as Employee
, salary as Salary
from Employee, Department
where Department.id = Employee.departmentId
and (salary, departmentId) in (select Max(salary), departmentId from Employee group by departmentId)
