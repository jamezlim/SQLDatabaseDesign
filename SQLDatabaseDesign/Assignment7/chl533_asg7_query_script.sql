-- Inner Join #1 
SELECT subscription.subscription_channel_ID, user.user_name ,user.user_account 
FROM user 
INNER JOIN subscription ON user.user_ID = subscription.subscription_user_ID 
WHERE subscription.subscription_channel_ID = 11 
ORDER BY user.user_name;

-- Inner Join #2 
SELECT c.channel_name, v.video_title, v.video_length
FROM channel c
INNER JOIN video v ON c.channel_ID = v.video_channel_ID
WHERE c.channel_theme = "men's fashion"
ORDER BY c.channel_name;

-- Left Join #1 
SELECT c.channel_name, c.channel_theme , s.subscription_user_ID 
FROM channel c  
LEFT JOIN subscription s ON c.channel_ID = s.subscription_channel_ID 
ORDER BY c.channel_name, s.subscription_user_ID;

-- Left Join #2 
SELECT u.user_name, u.user_account, u.user_age, s.subscription_channel_ID 
FROM user u
LEFT JOIN subscription s ON u.user_ID = s.subscription_user_ID
ORDER BY u.user_name, s.subscription_channel_ID;

-- Multi Join #1
SELECT c.channel_name, c.channel_theme, u.user_age, u.user_gender 
FROM channel c  
INNER JOIN subscription s ON c.channel_ID = s.subscription_channel_ID  
INNER JOIN user u ON u.user_ID = s.subscription_user_ID 
ORDER BY c.channel_name, u.user_age;

-- Nested Quary #1 
SELECT video_title, video_like_number
FROM video
WHERE video_like_number >
    (SELECT AVG(video_like_number) FROM video)
ORDER BY video_title, video_like_number;


--Nested Quary #2 
SELECT channel_name, channel_theme
FROM channel
WHERE channel_ID IN
    (SELECT video_channel_ID FROM video WHERE video_like_number > 5000)
ORDER BY channel_name;

-- Any Join #1
SELECT c.channel_name, c.channel_theme, c.channel_views, AVG(u.user_age) AS average_age FROM channel c 
INNER JOIN subscription s ON c.channel_ID = s.subscription_channel_ID 
INNER JOIN user u ON u.user_ID = s.subscription_user_ID  
WHERE u.user_age < 12  
ORDER BY c.channel_name;

