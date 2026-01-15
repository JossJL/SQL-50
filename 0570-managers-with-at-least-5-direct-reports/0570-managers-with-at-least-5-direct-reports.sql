# Write your MySQL query statement below
with
reports as (
    select
        count(b.managerid) as direct_reports,
        a.name,
        a.id
    from employee a
    left join employee b
       on a.id = b.managerid
    group by
    a.name,
    a.id
    )
select
    e.name
from employee e
left join reports d
    on e.id = d.id
where direct_reports >= 5

