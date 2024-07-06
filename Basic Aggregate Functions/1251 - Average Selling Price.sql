with TotalIncome as (
    select p.product_id, us.units, p.price * us.units as income
    from Prices p
    join UnitsSold us
        on
            p.product_id = us.product_id
            and us.purchase_date >= p.start_date
            and us.purchase_date <= p.end_date
)

select product_id, round((sum(cast(income as decimal)) / sum(units)), 2) as average_price
from TotalIncome
group by product_id