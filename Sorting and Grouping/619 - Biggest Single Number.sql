with number_count as (
    select num, count(num) as count
    from MyNumbers
    group by num
)

select max(mn.num)
from MyNumbers mn
join number_count nc on nc.num = mn.num and nc.count = 1
