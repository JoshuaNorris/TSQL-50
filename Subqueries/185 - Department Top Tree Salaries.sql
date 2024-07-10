with top_salaries as (
    select id, dense_rank() over (
        PARTITION by departmentId order by salary desc
    ) as rank
    from Employee
)

select d.name as Department, e.name as Employee, e.salary
from Employee e
join Department d on d.id = e.departmentId
join top_salaries as tr on tr.id = e.id
where tr.rank <= 3
order by e.departmentId, e.salary