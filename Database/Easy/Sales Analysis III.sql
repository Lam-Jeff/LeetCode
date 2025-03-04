Select p.product_id, p.product_name
from Product p, sales s
where p.product_id = s.product_id
group by product_id 
having MIN(sale_date) >= "2019-01-01" and MAX(sale_date) <= "2019-03-31"
