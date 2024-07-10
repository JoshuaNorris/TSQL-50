select *
from Patients
    cross apply string_split(conditions, ' ')
where substring(conditions, 1, 5) = 'DIAB1'