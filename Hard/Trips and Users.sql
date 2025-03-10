SELECT request_at as Day
, ROUND(SUM(CASE WHEN status != "completed" THEN 1 ELSE 0 END)/COUNT(status) ,2) as "Cancellation Rate"
FROM Trips
JOIN Users u1
ON Trips.client_id = u1.users_id AND u1.banned = "No"
JOIN Users u2
ON  Trips.driver_id = u2.users_id AND u2.banned = "No"  
WHERE request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY request_at
