with totalUser as (
    select count(*) as countTotal
    from Users u)

select contest_id,  round(count( r.user_id)/(select countTotal from totalUser) * 100, 2) as percentage
from Register r
group by contest_id
order by percentage desc, contest_id asc
