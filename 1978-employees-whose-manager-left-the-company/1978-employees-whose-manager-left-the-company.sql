select
    employee_id
from employees e
where not exists (
    select 1 
    from employees m 
    where m.employee_id = e.manager_id
)
and e.manager_id is not null
and e.salary < 30000
order by employee_id;