# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

#3,012 statuses and 316 users
#276 users have more than one status
#207 users have statuses with food tags

# Select all the user names from the users table. 
SELECT name 
FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name
FROM users
WHERE name LIKE 'b%';


#How many users are there? 
SELECT COUNT(id)
FROM users;

#How many statuses by a certain user? 
SELECT user_id, COUNT(status) 
FROM statuses 
GROUP BY user_id;

#Return the user name column, and all the statuses by that user.
	#If it wasn't that case that all users have at least one status
SELECT name, status
FROM users
LEFT OUTER JOIN statuses on statuses.user_id = users.id;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT user_id 
FROM statuses 
WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status. 
	#INNER JOIN here because we would want to get rid of users with no statues in this case
SELECT name
FROM users
INNER JOIN statuses ON statuses.user_id = users.id
GROUP BY user_id
HAVING COUNT(status) > 1;



#Return all user names who have written more than one status with the tag “food.” 

	#Because the food tag is the only tag; 180 users
SELECT name
FROM users
INNER JOIN statuses ON users.id = statuses.user_id
INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id
GROUP BY user_id
HAVING COUNT(status) > 1;

	#If there were more than one tag
SELECT name
FROM users
INNER JOIN statuses ON users.id = statuses.user_id
INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id
INNER JOIN tags on statuses_tags.tag_id = tags.id
WHERE tags.tag = 'food'
GROUP BY user_id
HAVING COUNT(status) > 1;

#Return user names, their statuses, and their tags in one big join.
	#Does not count the statuses without tags. See lower question
SELECT name, status, tag
FROM users 
INNER JOIN statuses ON users.id = statuses.user_id 
INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id
INNER JOIN tags ON statuses_tags.tag_id = tags.id;



#What is the most recent status? 
SELECT status
FROM statuses
WHERE created_at = 
	(SELECT MAX(created_at) FROM statuses);

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT tag
FROM statuses_tags
INNER JOIN tags ON statuses_tags.tag_id = tags.id
GROUP BY tag
ORDER BY COUNT(status_id) DESC
LIMIT 1;

#What is the most popular user? 
SELECT user_id
FROM statuses 
GROUP BY user_id
ORDER BY COUNT(status) DESC
LIMIT 1;

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT name, status, tag
FROM users 
INNER JOIN statuses ON users.id = statuses.user_id 
LEFT OUTER JOIN statuses_tags ON statuses.id = statuses_tags.status_id
LEFT OUTER JOIN tags ON statuses_tags.tag_id = tags.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

