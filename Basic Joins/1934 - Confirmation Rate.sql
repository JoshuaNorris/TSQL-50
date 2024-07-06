with ConfirmationNums as (
    select s.user_id, c.time_stamp, 
        CASE c.action
            when 'confirmed' then 1.00
            else 0.00
        end as action_num
    from Signups s
    left join Confirmations c
        on s.user_id = c.user_id
)

select user_id, round (avg(action_num), 2) as confirmation_rate
from ConfirmationNums
group by user_id
