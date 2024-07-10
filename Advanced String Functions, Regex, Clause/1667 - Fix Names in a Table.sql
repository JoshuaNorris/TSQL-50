select user_id, upper(substring(name, 1, 1)) + lower(right(name, len(name) - 1))
from Users