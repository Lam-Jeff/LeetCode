select name, IFNULL(sum(distance),0) as travelled_distance
FROM Users
Left join Rides
ON Users.id = Rides.user_id
group by Users.id
order by travelled_distance desc, name asc
