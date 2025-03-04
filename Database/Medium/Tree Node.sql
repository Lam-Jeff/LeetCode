select id
, case 
    when p_id is null then "Root" 
    when p_id in (select id from Tree) and id in (select p_id from Tree) then "Inner" 
    when p_id in (select id from Tree) and  id not in (select p_id from Tree where p_id is not null) then "Leaf"
END as type
from Tree
