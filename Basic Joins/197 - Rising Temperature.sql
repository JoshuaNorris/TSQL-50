select w1.id 
from Weather w1, Weather w2
where w1.temperature > w2.temperature
    and w1.recordDate = DATEADD(day, 1, w2.recordDate);