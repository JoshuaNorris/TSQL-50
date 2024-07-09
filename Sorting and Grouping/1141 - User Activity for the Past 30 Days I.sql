select activity_date as day, count(DISTINCT user_id) as active_users
from Activity
group by activity_date
having activity_date <= cast('2019-07-27' as date) and activity_date > dateadd(day, -30, cast('2019-07-27' as date))