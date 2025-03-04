with firstOrder as (
    select customer_id
    ,MIN(order_date)
    from Delivery 
    group by customer_id
)

select round(count(customer_id)/(select count(*) from firstOrder) * 100, 2) as immediate_percentage
from Delivery
where (customer_id, customer_pref_delivery_date) in (select * from firstOrder)
