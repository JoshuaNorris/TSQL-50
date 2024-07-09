select user_id, count(follower_id) as follower_count
from Followers
group by user_id