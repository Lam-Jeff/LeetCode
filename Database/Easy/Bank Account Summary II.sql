Select name, sum(amount) as balance
from Users u
join Transactions t
where u.account = t.account
group by u.account
having sum(amount) > 10000
