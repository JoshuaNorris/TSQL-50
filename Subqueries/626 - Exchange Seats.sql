

select id,
    case
        when id % 2 = 1 then coalesce(lead(student) over(order by id), student)
        else lag(student) over(order by id)
    end as student
from Seat

-- Got this answer from https://leetcode.com/problems/exchange-seats/solutions/4337513/think-like-sql-engine-mastering-lead-and-lag-functions-coalesce/?envType=study-plan-v2&envId=top-sql-50

-- lead is grabbing the next item
-- lag is grabbing the provious
-- having the order by id tells the lead and lag functions the order they should be operating in
-- the coalesce handles the case that it is an odd id and the last in the list.