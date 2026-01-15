# Write your MySQL query statement below
with number_of_products as (
    select
        count(product_key) as total_products
    from product
)
select
    customer_id
from customer c
cross join number_of_products n
group by customer_id
having count(distinct product_key) = max(total_products)
