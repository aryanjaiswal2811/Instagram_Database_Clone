-- Executing different queries on our DataBase

-- Challenge 1 : We want to reward our users who have been around the longest.
-- So find the 5 oldest users
SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;

-- Challenge 2 : Its need to be figured out when to schedule an ad campaign.
-- Find out what day of the week do most users register on.
SELECT DAYNAME(created_at) AS Day, COUNT(DAYNAME(created_at)) AS no_of_users
FROM users
GROUP BY DAYNAME(created_at);

-- Challenge 3 : We need to target our inactive users with an email campaign.
-- Find the users who have never posted a photo
SELECT username FROM users
WHERE id NOT IN(
SELECT user_id FROM photos)
ORDER BY username;
-- Another query to perform the same task is 
SELECT username FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL; -- if we write photos.id = NULL then it will not give anything in output

-- Challenge 4 : We are running a new contest to see who can get the most likes on single photos
-- Find out who won.
SELECT username,photos.id, photos.image_url, COUNT(photos.id) FROM photos
JOIN likes
ON photos.id = likes.photo_id
JOIN users 
ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY COUNT(photo_id) DESC
LIMIT 1;

-- Challenge 5 : The investors want to know ..
-- How many times does the average user post?
-- Approach to calculate avg number of posts
-- total no. of photos / total no. of users
SELECT (SELECT COUNT(photos.id) FROM photos) / (SELECT COUNT(users.id) from users) AS average_posts;

-- Challenge 6 : A brand wants to know which hashtags to use in a post
-- What are the top 5 most commonly used hashtags
SELECT tag_name , COUNT(photo_tags.tag_id)
FROM tags
JOIN photo_tags
ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY COUNT(photo_tags.tag_id) DESC
LIMIT 5;

-- Challenge 7 : We have a small problem with bots on our site
-- Find users who have liked every single photo on the site
SELECT username, COUNT(*) AS num_likes FROM users
JOIN likes
ON  
id = likes.user_id
GROUP BY id
HAVING num_likes = (SELECT COUNT(*) FROM photos);





