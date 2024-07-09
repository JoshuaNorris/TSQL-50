--  select emyloyee_id, name, reports_count, average_age (of reports)

select e1.reports_to as employee_id, e2.name, count(e1.employee_id) as reports_count, round(avg(cast(e1.age as decimal)), 0) as average_age
from Employees e1
join Employees e2 on e1.reports_to = e2.employee_id
group by e1.reports_to, e2.name
having e1.reports_to is not null
order by e1.reports_to