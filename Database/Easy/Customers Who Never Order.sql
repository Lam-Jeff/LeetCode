SELECT name as Customers
from Customers
where not exists (SELECT 1 from Orders where Customers.id = Orders.customerId)
