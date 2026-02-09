# Write your MySQL query statement below
(
select
    name as results
from (select
        name,
        count(mr.user_id)
    from movierating mr
    left join users u on 
    u.user_id = mr.user_id
    group by mr.user_id
    order by count(mr.user_id) desc, name asc
    limit 1) as result
)
union all
(
select
    title as results
from (
    select
        title,
        avg(rating) as average
    from movierating mr
    left join movies m on
    m.movie_id = mr.movie_id
    where date_format(created_at, '%Y-%m') = '2020-02'
    group by mr.movie_id
    order by average desc, title asc
limit 1) as movie_result
)
