with first_login as (
    select player_id, min(event_date) as event_date
    from Activity a
    group by player_id
),

login_previous_first as (
    select a.player_id, a.event_date
    from Activity a
    join first_login fl
        on dateadd(day, 1, fl.event_date) = a.event_date
        and fl.player_id = a.player_id
)

select 
    round (
        count(
            case
                when lpf.player_id is not null then 1
            end
        ) /
        cast(count(distinct a.player_id) as decimal)
    , 2) as fraction
from activity a
left join login_previous_first lpf on lpf.player_id = a.player_id and lpf.event_date = a.event_date

