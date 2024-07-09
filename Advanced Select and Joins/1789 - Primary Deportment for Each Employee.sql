with employee_department_count as (
    select employee_id, count(department_id) as department_count
    from Employee
    group by employee_id
)

select e.employee_id, e.department_id
from Employee e
join employee_department_count edc on edc.employee_id = e.employee_id
where
    (edc.department_count > 1 and e.primary_flag = 'Y')
    or
    (edc.department_count = 1)