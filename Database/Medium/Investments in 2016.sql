select round(sum(tiv_2016), 2) as tiv_2016
from Insurance i1
where (lat, lon) not in (select lat, lon from Insurance i2 where i1.pid <> i2.pid)
and tiv_2015 in (select tiv_2015 from Insurance group by tiv_2015 having count(*) > 1)
