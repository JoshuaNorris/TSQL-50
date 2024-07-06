With ManagerEmployeeCount as (
    select e.managerId , count(e.id) as "count"
    from Emyloyee e
    group by e.managerId
    having count(e.id) >=5 
)


select m.name
from ManagerEmployeeCount as e
join Employee m on e.managerId  = m.id;