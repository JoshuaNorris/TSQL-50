with PoorRatingPercentage as (
    select query_name, round((AVG(
        case
            when rating >= 3 then 0.00
            else 1.00
        end
    )* 100),2 )as prp
    from Queries
    group by query_name
)

select q.query_name, round(avg(cast (q.rating as Decimal) / q.position), 2) as quality, p.prp as poor_query_percentage
from Queries q
join PoorRatingPercentage p on q.query_name = p.query_name
group by q.query_name, p.prp;