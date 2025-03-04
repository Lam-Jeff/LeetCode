select id, case
                WHEN id = (SELECT MAX(id) FROM seat) AND id % 2 = 1 THEN student 
                WHEN id % 2 = 0 THEN LAG(student,1) over()
                WHEN id % 2 = 1 THEN LEAD(student, 1) over()  
                END as student
from seat
order by id asc
