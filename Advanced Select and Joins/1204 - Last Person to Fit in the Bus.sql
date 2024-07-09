with weights as (
    select a.turn, sum(b.weight) weight
    from Queue a join Queue b
    on a.turn >= b.turn
    group by a.turn
    having sum(b.weight) <=1000
),

max_turn as (
    select max(turn) as turn
    from weights
)

select q.person_name
from Queue q
join max_turn mt on q.turn = mt.turn 