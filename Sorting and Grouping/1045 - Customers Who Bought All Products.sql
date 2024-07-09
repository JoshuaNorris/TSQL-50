with customer_product_count as (
    select customer_id, count(distinct product_key) as count
    from Customer
    group by customer_id
),

product_count as (
    select count(*) as count
    from Product
)

select cpc.customer_id
from customer_product_count cpc
cross join product_count pc
where cpc.count = pc.count