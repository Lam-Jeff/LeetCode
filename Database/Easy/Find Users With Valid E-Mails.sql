select user_id, name, mail
from Users u 
where REGEXP_LIKE(u.mail, "^[a-zA-Z][a-zA-Z0-9-_.]*@leetcode[.]com$")
