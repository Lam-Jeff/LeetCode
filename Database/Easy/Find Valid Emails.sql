select user_id, email 
from Users
where REGEXP_LIKE(email, "^[a-zA-Z0-9_]+@[a-zA-Z]+[.]com$")
order by user_id asc
