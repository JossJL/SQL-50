# Write your MySQL query statement below
with number_of_users as (
    select
        count(user_id) as total_users
    from users
)

select
    contest_id,
   round (
    (
    count(distinct users.user_id)/max(total_users)
     )*100
     ,2)  as percentage
from register
left join users
    on
    users.user_id = register.user_id
cross join number_of_users

group by
    contest_id
order by 
    percentage desc,
    contest_id asc