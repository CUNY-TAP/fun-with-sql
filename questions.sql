
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name 
FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name 
FROM users 
WHERE name 
LIKE 'b%';

#How many users are there? 
SELECT COUNT(name) 
FROM users;

#How many posts by a certain user? 
SELECT users.name, COUNT(DISTINCT statuses.status) 
FROM statuses 
LEFT JOIN users 
WHERE statuses.user_id = users.id 
GROUP BY users.name;
	#Most statuses where repeats, with different timestamps, this should give you no repeats
	#Alternative with repeating status message
SELECT users.name, COUNT(statuses.status) 
FROM statuses 
LEFT JOIN users 
WHERE statuses.user_id = users.id 
GROUP BY users.name;

#Return the user name column, and all the status by that user. 
SELECT DISTINCT users.name, statuses.status 
FROM statuses 
LEFT JOIN users 
WHERE statuses.user_id = users.id;
	#Again making sure only non repeating statuses are brought up.
	#Alternative with repeating status messages
SELECT users.name, statuses.status 
FROM statuses 
LEFT JOIN users 
WHERE statuses.user_id = users.id 
ORDER BY users.name;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT users.name 
FROM statuses 
LEFT JOIN users 
WHERE statuses.user_id = users.id 
AND geocode IS NOT NULL GROUP BY users.name;

#Return all user names who have written more than one status. 
SELECT users.name, COUNT(DISTINCT statuses.status) 
FROM statuses 
LEFT JOIN users 
WHERE statuses.user_id = users.id 
GROUP BY users.name 
HAVING COUNT (DISTINCT statuses.status) > 1;

#Return all user names who have written more than one status with the tag “food.” 
SELECT users.name 
FROM users 
LEFT JOIN statuses
WHERE statuses.user_id = users.id 
AND statuses.id IN 
	(SELECT statuses_tags.status_id 
 	 FROM statuses_tags 
 	 WHERE statuses_tags.tag_id IN 
 	 	(SELECT id 
 	 	 FROM tags 
 	 	 WHERE tag = 'food')) 
GROUP BY users.name HAVING COUNT(DISTINCT statuses.status) > 1;

#Return user names, their statuses, and their tags in one big join. 
SELECT DISTINCT users.name, statuses.status, tags.tag  
FROM users 
LEFT JOIN statuses ON statuses.user_id = users.id 
LEFT JOIN statuses_tags ON statuses.id = statuses_tags.status_id 
LEFT JOIN tags ON statuses_tags.tag_id = tags.id 
ORDER BY users.name;

#What is the most recent status? 
SELECT status, MAX(updated_at) FROM statuses;

#What is the most popular tag? (Hint, count how many statuses there are by tag). 
SELECT tags.tag 
FROM tags 
WHERE tags.id IN 
	(SELECT statuses_tags.tag_id 
	 FROM statuses_tags 
	 GROUP BY statuses_tags.tag_id 
	 ORDER BY COUNT(*) DESC);

#Who is the most popular user? 
SELECT users.name 
FROM users 
WHERE users.id IN 
	(SELECT statuses.user_id 
	 FROM statuses 
	 GROUP BY statuses.user_id 
	 ORDER BY COUNT(*) 
	 DESC LIMIT 1);

#I am pretty sure that there is more than one user who has the same number of repeat apperances than what this results in

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT statuses.status, tags.tag 
FROM statuses 
LEFT JOIN statuses_tags ON statuses.id = statuses_tags.status_id 
LEFT JOIN tags ON statuses_tags.tag_id = tags.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

