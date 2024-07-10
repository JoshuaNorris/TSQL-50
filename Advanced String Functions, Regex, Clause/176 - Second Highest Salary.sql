with max_salary as (
    select max(salary) as salary
    from Employee
)

select coalesce (max(e.salary), null) as SecondHighestSalary
from Employee e
left join max_salary ms on e.salary = ms.salary
where ms.salary is null