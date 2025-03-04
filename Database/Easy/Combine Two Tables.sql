# Write your MySQL query statement below
Select firstName, lastName, city, state
From Person, Address
Where Person.personId = Address.personId

union 

Select Person.firstName, Person.lastName, null as city, null as state
From Person
Where not exists (select 1 from Address where Person.personId = Address.personId)
