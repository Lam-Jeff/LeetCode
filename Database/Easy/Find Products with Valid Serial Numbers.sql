select product_id, product_name, description 
from products
where regexp_like(description, "SN[0-9]{4}-[0-9]{4}([^0-9]|$)")
order by product_id asc
