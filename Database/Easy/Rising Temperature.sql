# Write your MySQL query statement below
select today.id
from Weather as today
Inner join Weather as yesterday
where DATEDIFF(today.recordDate, yesterday.recordDate) =1
AND today.temperature > yesterday.temperature
