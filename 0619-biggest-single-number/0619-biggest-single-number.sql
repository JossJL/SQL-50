# Write your MySQL query statement below
with number_counts as (
    -- 1. Count the frequency of each number in the original 'mynumbers' table.
    select
        num,
        count(num) AS frequency
    from
        mynumbers
    group by
        num
)

select
    -- 2. Select the maximum number (num) from the filtered results.
    max(num) as num
from
    number_counts
where
    frequency = 1