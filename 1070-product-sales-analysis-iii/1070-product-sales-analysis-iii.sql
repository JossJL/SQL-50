# Write your MySQL query statement below
with minimum_year as (
    select
        min(year) as first_year,
        product_id
    from sales
    group by product_id
)
select
    s.product_id,
    first_year,
    quantity,
    price
from sales s
inner join minimum_year m
    on
    year = first_year
    and
    s.product_id=m.product_id
