# Write your MySQL query statement below
with yesterday as (
    select id,
    date_add(recorddate, interval 1 day) as recorddate,
    temperature
    from weather
)

select
    weather.id
from weather
left join yesterday
    on weather.recorddate = yesterday.recorddate
where
    yesterday.temperature < weather.temperature
