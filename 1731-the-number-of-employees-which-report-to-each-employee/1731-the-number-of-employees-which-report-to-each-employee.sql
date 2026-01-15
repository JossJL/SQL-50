# Write your MySQL query statement below
select
    manager_id as employee_id,
    manager_name as name,
    count(reports_to) as reports_count,
    round(
    avg(age)
     ) as average_age
from employees
left join
    (
        select
            employee_id as manager_id,
            name as manager_name
        from employees
    ) managers
    on
    reports_to = manager_id
group by manager_id
having count(reports_to) > 0
order by employee_id