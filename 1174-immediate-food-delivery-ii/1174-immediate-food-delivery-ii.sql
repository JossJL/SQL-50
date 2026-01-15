# Write your MySQL query statement below
with first_order as(
    select
        min(order_date) as first_order,
        customer_id
    from delivery
    group by customer_id
)

select
    round( sum(case 
            when order_date = customer_pref_delivery_date 
                then 1
                    else 0 end)/count(d.customer_id)*100, 2) as immediate_percentage
from delivery d
inner join first_order f on
    d.customer_id = f.customer_id
    and
    d.order_date = f.first_order
