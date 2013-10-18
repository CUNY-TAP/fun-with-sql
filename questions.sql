
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”.
SELECT name FROM users WHERE name LIKE "b%";

#How many users are there? 
SELECT COUNT(id) FROM users;

#How many posts by a certain user?
SELECT COUNT(status) FROM users JOIN statuses ON users.id = statuses.user_id WHERE users.name = "name_here"; 

#Return the user name column, and all the status by that user.
SELECT name, status FROM users JOIN statuses ON users.id = statuses.user_id WHERE users.name = "name_here";

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT name FROM users JOIN statuses ON users.id = statuses.user_id WHERE statuses.geocode IS NOT NULL;

#Return all user names who have written more than one status. 
SELECT DISTINCT name FROM users JOIN statuses ON users.id = statuses.user_id GROUP BY user_id HAVING COUNT(status) > 1;

#Return all user names who have written more than one status with the tag “food.” 
SELECT name, status
FROM 
users JOIN statuses ON users.id = statuses.user_id
JOIN statuses_tags ON statuses.id = statuses_tags.status_id
JOIN tags ON statuses_tags.tag_id = tags.id
WHERE tag = "food" GROUP BY user_id HAVING COUNT(status) > 1;

#Return user names, their statuses, and their tags in one big join.
SELECT name, status, tag
FROM 
users JOIN statuses ON users.id = statuses.user_id
JOIN statuses_tags ON statuses.id = statuses_tags.status_id
JOIN tags ON statuses_tags.tag_id = tags.id;

#What is the most recent status? 
SELECT status FROM statuses ORDER BY created_at DESC LIMIT 1;

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT DISTINCT tag
FROM
tags JOIN statuses_tags ON tags.id = statuses_tags.tag_id
GROUP BY tag HAVING COUNT(status_id);

#What is the most popular user?
SELECT name, COUNT(status)
FROM
users JOIN statuses ON users.id = statuses.user_id
GROUP BY user_id
ORDER BY COUNT(status) DESC;

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT name, status, tag
FROM 
statuses LEFT JOIN statuses_tags ON statuses.id = statuses_tags.status_id
LEFT JOIN tags ON statuses_tags.tag_id = tags.id
LEFT JOIN users ON statuses.user_id = users.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

