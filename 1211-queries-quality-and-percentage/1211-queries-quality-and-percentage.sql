# Write your MySQL query statement below
with poor_query_percentage as (
    select
        query_name,
        count(query_name) as total_poor_queries
    from queries
    where rating < 3
    group by(query_name)
)

select
    q.query_name,
   ifnull(
   round(
    avg(
            rating/
            position
            )
    ,2)
    ,0) as quality,
    ifnull(
        round( max(total_poor_queries)/
            count(q.query_name)
        * 100,
        2),
        0) as poor_query_percentage
from queries q
left join
    poor_query_percentage pq
    on
    pq.query_name = q.query_name
group by(query_name)


#select
#from queries