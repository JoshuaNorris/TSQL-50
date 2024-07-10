with first_criteria as (
    select i.pid
    from Insurance i
    join (
        select tiv_2015
        from Insurance
        group by tiv_2015
        having count(*) > 1
    ) as duplicates on i.tiv_2015 = duplicates.tiv_2015
),

second_criteria as (
    select i.pid
    from Insurance i
    join (
        select lat, lon
        from Insurance
        group by lat, lon
        having count(*) = 1
    ) as distincts on i.lon = distincts.lon and i.lat = distincts.lat
)

select round(sum(tiv_2016), 2) as tiv_2016
from Insurance i
join first_criteria fc on i.pid = fc.pid
join second_criteria sc on i.pid = sc.pid