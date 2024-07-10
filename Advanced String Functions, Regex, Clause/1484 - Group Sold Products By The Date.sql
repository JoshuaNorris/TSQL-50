select sell_date, count(*) as num_sold, string_agg(product, ',') as products
from (
    select distinct sell_date as sell_date, product
    from Activities
) as Activites
group by sell_date
order by sell_date asc