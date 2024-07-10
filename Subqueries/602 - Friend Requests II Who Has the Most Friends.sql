with requester_and_accepter as (
    select requester_id as id
    from RequestAccepted 
    
    union all
    
    select accepter_id as id 
    from RequestAccepted
)

select top 1 id, count(*) as num
from requester_and_accepter
group by id
order by count(*) desc