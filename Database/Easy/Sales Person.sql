select distinct sp.name 
from SalesPerson sp
where not exists (select sp.name 
                from  Orders o, company c
                where o.com_id = c.com_id
                and c.name like "RED"
                and sp.sales_id = o.sales_id)
