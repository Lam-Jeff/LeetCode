Select user_id, concat(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2, length(name)))) as name
from Users
order by user_id
