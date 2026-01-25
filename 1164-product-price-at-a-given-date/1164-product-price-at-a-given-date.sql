# Write your MySQL query statement below
with changed_products as(
    select 
        product_id, 
        new_price as change_price
    from products p1
    where (product_id, change_date) in (
        -- Subquery to find the max date for each product
        select product_id, max(change_date)
        from products
        where change_date <= '2019-08-16'
        group by product_id
    )
)
select
    p.product_id,
    ifnull(change_price, 10) as price
from products p
left join changed_products c on
    p.product_id = c.product_id
group by p.product_id

