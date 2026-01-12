with categories as (
    select 'Low Salary' as category
    union select 'Average Salary'
    union select 'High Salary'
),
AccountGroups as (
    select 
        case 
            when income < 20000 then 'Low Salary'
            when income between 20000 and 50000 then 'Average Salary'
            else 'High Salary'
        end as category
    from accounts
)

select 
    c.category, 
    count(a.category) as accounts_count
from Categories c
left join AccountGroups a on c.category = a.category
group by c.category;
