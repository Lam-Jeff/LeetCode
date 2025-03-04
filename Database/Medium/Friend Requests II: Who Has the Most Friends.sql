with  unionIds as (
    select accepter_id as id, count(distinct requester_id ) as num
from RequestAccepted
group by accepter_id
union all
 select requester_id as id, count(distinct accepter_id ) as num
from RequestAccepted
group by requester_id)

select  id , sum(num)as num
from unionIds
group by id
order by num desc
limit 1
