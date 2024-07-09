select format(t.trans_date, 'yyyy-MM') as month, t.country, count(*) as trans_count, 
    count (
        case
            when state = 'approved' then 1
        end
    ) as approved_count,
    sum(amount) as trans_total_amount,
    sum (
        case
            when state = 'approved' then t.amount
            else 0
        end
    ) as approved_total_amount
from Transactions t
group by format(t.trans_date, 'yyyy-MM'), t.country