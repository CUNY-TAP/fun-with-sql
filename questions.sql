# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE "b%";

#How many users are there? 
SELECT COUNT(*) FROM users;

#How many statuses by a certain user? 
SELECT COUNT(*) FROM statuses WHERE user_id =42;

#Return the user name column, and all the statuses by that user. 
SELECT name, status FROM users INNER statuses ON users.id = statuses.user_id WHERE users.id = 42;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT users.name FROM users INNER JOIN statuses ON users.id = statuses.user_id WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status.
SELECT name FROM users WHERE id IN (SELECT user_id FROM statuses GROUP BY user_id HAVING COUNT(user_id) > 1) 

#Return all user names who have written more than one status with the tag “food.” 
SELECT name FROM users WHERE id IN (SELECT statuses.user_id FROM statuses INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id WHERE tag_id = 1 GROUP BY user_id HAVING COUNT(user_id) > 1);

#Return user names, their statuses, and their tags in one big join. 
SELECT users.name, statuses.status, tags.tag FROM users INNER JOIN statuses ON users.id = statuses.user_id INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id INNER JOIN tags ON statuses_tags.tag_id = tags.id;

#What is the most recent status? 
SELECT status, created_at FROM statuses WHERE created_at IN (SELECT MAX(created_at) FROM statuses);

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT tags.tag  FROM tags INNER JOIN statuses_tags ON tags.id = statuses_tags.tag_id INNER JOIN statuses ON statuses_tags.status_id = statuses.id GROUP BY statuses_tags.tag_id ORDER BY COUNT(statuses_tags.tag_id) DESC LIMIT 1;

#What is the most popular user? 
SELECT users.name FROM users INNER JOIN statuses ON users.id = statuses.user_id GROUP BY statuses.user_id ORDER BY COUNT(statuses.user_id) DESC LIMIT 1;

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag.
SELECT statuses.status, tags.tag FROM statuses INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id LEFT JOIN tags ON statuses_tags.tag_id = tags.id; 

#Extra Credit
#What is the most popular word? (you may need the help of ruby)
See most_popular_word.rb

#What are some other kinds of queries that are useful? 
#Users that have no statuses
SELECT users.name FROM users LEFT JOIN statuses ON users.id = statuses.user_id WHERE statuses.status IS NULL;

