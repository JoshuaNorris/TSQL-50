
select contest_id, (round (
(
    cast(count (user_id) as decimal)
) /
(
    select count(user_id)
    from Users
)
, 4) * 100) as percentage
from Register
group by contest_id
order by percentage desc, contest_id asc