
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE "b%";

#How many users are there? 
SELECT COUNT(name) FROM users;

#How many posts by a certain user? 
SELECT COUNT(status) FROM statuses WHERE user_id = "303";

#Return the user name column, and all the status by that user. 
SELECT users.name, statuses.status
FROM users
LEFT JOIN statuses
ON users.id=statuses.user_id
ORDER BY name;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT users.name
FROM users
LEFT JOIN statuses
ON users.id=statuses.user_id
WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status. 
SELECT users.name
FROM users
LEFT JOIN statuses
ON users.id=statuses.user_id
WHERE count(status)>1;


#Return all user names who have written more than one status with the tag “food.” 
SELECT users.name
FROM users
LEFT JOIN statuses
ON users.id=statuses.user_id
GROUP BY users.id HAVING count(status)>1;

#Return user names, their statuses, and their tags in one big join. 
SELECT users.name, statuses.status,tags.tag
FROM users
LEFT JOIN statuses
ON users.id=statuses.user_id
LEFT JOIN statuses_tags
ON statuses_tags.status_id=statuses.id
LEFT JOIN tags
ON statuses_tags.tag_id=tags.id;

#What is the most recent status? 
SELECT status FROM statuses WHERE created_at =  (SELECT MAX(created_at) from statuses);

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
select tag FROM tags WHERE id = (select MAX(tag_id) from statuses_tags);

#What is the most popular user? 
#depends on your definition of popular. My definition is how many times they were mentioned in a status.
#have to work on this one a lot more
select users.name FROM users
LEFT JOIN statuses
ON users.id=statuses.user_id
LIKE status = "%@

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
#dont understand the difference between this one and the one above unless the one above wasnt supposed to show any that have missing tags
select statuses.status, users.name, tags.tag
FROM users
LEFT join statuses
on users.id=statuses.user_id
LEFT join statuses_tags
ON statuses_tags.status_id=statuses.id
LEFT JOIN tags
on statuses_tags.tag_id=tags.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

