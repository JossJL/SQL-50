# Write your MySQL query statement below
select 
    name,
    unique_id
from Employees e
left join
    EmployeeUNI eu on e.id = eu.id