with first_year as (
    select product_id, min(year) as year
    from Sales
    group by product_id
)

select s.product_id, s.year as first_year, s.quantity, s.price
from Sales as s
join first_year fy on s.year = fy.year and s.product_id = fy.product_id