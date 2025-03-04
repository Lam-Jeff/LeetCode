select a1.machine_id, round(avg(a2.timestamp - a1.timestamp), 3) as processing_time
from Activity a1
join Activity a2
on a1.machine_id = a2.machine_id 
AND a1.process_id = a2.process_id
where a1.activity_type like "start" and a2.activity_type like "end"
group by a1.machine_id
