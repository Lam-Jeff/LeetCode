Select product_name, sum(unit) as unit
from Products p
JOIN Orders o 
ON p.product_id = o.product_id
AND  YEAR(order_date) = 2020 and MONTH(order_date) = 2
group by product_name
HAVING sum(unit) >= 100
