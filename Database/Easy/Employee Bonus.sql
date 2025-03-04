Select name, bonus
from Employee e
left outer join bonus b on e.empId = b.empId
where b.bonus < 1000
OR b.bonus is null
