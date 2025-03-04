DELETE FROM Person 
WHERE id  not in (select * from (select MIN(id) from Person group by email)temp)
