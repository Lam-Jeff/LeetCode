select e1.name
from Employee e1
LEFT JOIN Employee e2
ON  e1.id = e2.managerId
group by e1.id
having count(e2.managerId) >= 5
