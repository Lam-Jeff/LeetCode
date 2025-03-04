with count2019 as (
    select buyer_id 
    , count(*) as cnt
    from Orders
    where YEAR(order_date) = 2019
    group by buyer_id 
)
# Write your MySQL query statement below
select user_id as buyer_id, join_date, IFNULL(cnt,0) as orders_in_2019
from Users
Left JOIN count2019
on user_id = count2019.buyer_id
