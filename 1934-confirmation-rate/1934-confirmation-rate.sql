# Write your MySQL query statement below
with
confirmed as(
    select
        count(action) as confirmed_actions,
        user_id
    from confirmations
where action = 'confirmed'
group by user_id
),

actions as (
    select
    count(action) as all_actions,
        user_id
    from confirmations
group by user_id
)

select
    s.user_id,
    round(
        ifnull(
            confirmed_actions/all_actions,0
            ), 2
     ) as confirmation_rate
from signups s
left join confirmed c on
    s.user_id = c.user_id
left join actions a on
    s.user_id = a.user_id
group by user_id