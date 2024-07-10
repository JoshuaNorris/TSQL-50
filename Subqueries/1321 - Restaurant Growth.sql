with grouped_dates as (
    select visited_on, sum(amount) as sum
    from Customer
    group by visited_on
),

solution_with_early_dates as (
    select visited_on,
        sum(sum) over (
            order by visited_on rows between 6 preceding and current row
        ) as amount,
        round(avg(cast(sum as decimal)) over (
            order by visited_on rows between 6 preceding and current row
        ), 2) as average_amount
    from grouped_dates
)

select *
from  solution_with_early_dates
where visited_on >= dateadd(day, 6, (
    select top 1 visited_on from solution_with_early_dates
))