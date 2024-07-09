with recent_change_date as (
    select product_id, max(change_date) as change_date
    from Products
    where change_date <= cast('2019-08-16' as date)
    group by product_id
),

product_ids as (
    select distinct product_id
    from Products
)

select pi.product_id,
    case
        when p.new_price is null then 10
        else p.new_price
    end as price
from product_ids pi
left join recent_change_date rcd on pi.product_id = rcd.product_id
left join Products p on pi.product_id = p.product_id and rcd.change_date = p.change_date