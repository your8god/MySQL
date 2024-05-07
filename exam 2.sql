--1
SELECT * FROM Posts
ORDER BY 
    CASE content_type
        WHEN 'photo' THEN 1
        WHEN 'video' THEN 2
        ELSE 3
    END,
    likes_count DESC;

--2
SELECT user_id, 
    DATEDIFF(MAX(post_date), MAX(post_date)) days_between
FROM Posts
WHERE YEAR(post_date) = 2023
GROUP BY user_id
HAVING days_between > 0;

--3
SELECT DISTINCT id FROM Posts
LEFT JOIN PostLikes P ON id = post_id
WHERE P.user_id IS NULL
ORDER BY 1 DESC;

--4
SELECT COUNT(DISTINCT U1.user_id) number_of_active_users
FROM UserActions U1 JOIN UserActions U2 ON 
    U1.user_id = U2.user_id
    AND MONTH(U1.event_date) = 6 AND
    MONTH(U2.event_date) = 7;

--5
SELECT user_id, 
    COUNT(post_id) / COUNT(DISTINCT Posts.id)  avg_shares_per_post
FROM Posts LEFT JOIN PostShares ON Posts.id = post_id
GROUP BY 1;

--6
SELECT ad_id, 
    ROUND(SUM(event_type = 'click') / 
    SUM(event_type = 'impression') * 100, 2) efficiency_coefficient
FROM AdImpressions
GROUP BY 1;

--7
WITH posts_cnt AS 
(
    SELECT user_id, COUNT(*) count
    FROM Posts
    GROUP BY 1, DAY(post_date)
)
SELECT user_id, COUNT(*) number_of_posts, 
    AVG(comments) avg_number_of_comments FROM Posts
JOIN PostInteractions ON id = post_id
WHERE 1 NOT IN (SELECT count FROM posts_cnt WHERE user_id = Posts.user_id)
GROUP BY 1
HAVING avg_number_of_comments >= 150;

--8
SELECT DISTINCT user_a_id, user_b_id FROM FriendshipStatus
JOIN Events E1 ON E1.user_id = user_a_id
JOIN Events E2 ON E2.user_id = user_b_id
WHERE status = 'not_friends' AND E1.event_type = 'private' AND
E2.event_type = 'private' AND E1.attendance_status IN ('going', 'maybe')
AND E2.attendance_status IN ('going', 'maybe') AND E1.event_id = E2.event_id
GROUP BY 1, 2
HAVING COUNT(*) > 1;