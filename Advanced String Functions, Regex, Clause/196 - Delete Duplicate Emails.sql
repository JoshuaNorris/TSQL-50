delete from Person
where id not in (
    select min(id)
    from Person
    group by email
    having count(*) > 1
) and email in (
    select email
    from Person
    group by email
    having count(*) > 1
)