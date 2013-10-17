
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE 'b%';

#How many users are there? 
SELECT COUNT(name) FROM users;

#How many posts by a certain user? 
SELECT users.name, COUNT(distinct statuses.status) FROM statuses LEFT JOIN users WHERE statuses.user_id = users.id GROUP BY users.name;
	#Most statuses where repeats, with different timestamps, this should give you no repeats
	#Alternative with repeating status message
SELECT users.name, COUNT(statuses.status) FROM statuses LEFT JOIN users WHERE statuses.user_id = users.id GROUP BY users.name;

#Return the user name column, and all the status by that user. 
SELECT DISTINCT users.name, statuses.status FROM statuses LEFT JOIN users WHERE statuses.user_id = users.id;
	#Again making sure only non repeating statuses are brought up.
	#Alternative with repeating status messages
SELECT users.name, statuses.status FROM statuses LEFT JOIN users WHERE statuses.user_id = users.id ORDER BY users.name;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT users.name FROM statuses LEFT JOIN users WHERE statuses.user_id = users.id AND geocode IS NOT NULL GROUP BY users.name;

#Return all user names who have written more than one status. 

#Return all user names who have written more than one status with the tag “food.” 

#Return user names, their statuses, and their tags in one big join. 

#What is the most recent status? 

#What is the most popular tag? (Hint, count how many statuses their are by tag). 

#What is the most popular user? 

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

