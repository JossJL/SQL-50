# Write your MySQL query statement below
with low_salary as (
select
count(account_id) as accounts_count,
    "Low Salary" as category
from accounts
where income < 20000
),
medium_salary as(
    select
    count(account_id) as accounts_count,
    "Average Salary" as category
    from accounts
    where income >= 20000 and income <= 50000)

,
high_salary as(
    select
    count(account_id) as accounts_count,
    "High Salary" as category
    from accounts
    where income > 50000)

select
    category,
    accounts_count
from low_salary
union 
    select 
        category,
        accounts_count 
    from medium_salary
union 
    select 
        category,
        accounts_count 
    from high_salary
