# Write your MySQL query statement below
with next_day as (
    select 
        date_sub(event_date, interval 1 day) as next_day,
        player_id
    from activity
),
    first_date as (
        select
            min(event_date) as first_login,
            player_id
        from activity
        group by player_id
)
select
    round(
    count(n.player_id)/count(distinct a.player_id)
     ,2) as fraction
from activity a
left join next_day n
    on
    n.next_day = event_date
    and
    a.player_id = n.player_id
inner join first_date f
    on
    first_login = event_date
    and
    f.player_id = a.player_id
