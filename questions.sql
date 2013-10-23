# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL.
 
##########################################################################################

# Select all the user names from the users table.

SELECT name 
FROM users;

##########################################################################################

#Select all the user names whose name starts with the letter “b”.

SELECT name 
FROM users 
WHERE name LIKE 'b%'; 

##########################################################################################

#How many users are there? 

SELECT COUNT(*) 
FROM users;

##########################################################################################

#How many statuses by a certain user?

SELECT COUNT(*) 
FROM users 
INNER JOIN statuses ON users.id=statuses.user_id 
WHERE name='USER_NAME';

##########################################################################################

#Return the user name column, and all the statuses by that user. 

SELECT name , status FROM users 
INNER JOIN statuses ON users.id=statuses.user_id 
WHERE name='stinakwiatek';

##########################################################################################

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”).

SELECT DISTINCT name FROM users 
INNER JOIN statuses ON users.id=statuses.user_id 
WHERE geocode IS NOT NULL;

##########################################################################################

#Return all user names who have written more than one status. 

SELECT DISTINCT name 
FROM users 
INNER JOIN statuses ON users.id=statuses.user_id 
GROUP BY name 
HAVING COUNT (status) > 1;

##########################################################################################

#Return all user names who have written more than one status with the tag “food.” 

SELECT DISTINCT name
FROM users INNER JOIN statuses ON users.id=statuses.user_id 
INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id 
GROUP BY users.name 
HAVING tag_id=1 AND COUNT(*)>1;

##########################################################################################

#Return user names, their statuses, and their tags in one big join. 
 
SELECT name, status, tag 
FROM users INNER JOIN statuses ON users.id = statuses.user_id 
INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id
INNER JOIN tags ON statuses_tags.tag_id = tags.id;   


##########################################################################################

#What is the most recent status? 

SELECT status , MAX( created_at ) FROM statuses; 

##########################################################################################
#What is the most popular tag? (Hint, count how many statuses their are by tag). 
##########################################################################################
#What is the most popular user? 
##########################################################################################
#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
##########################################################################################
#Extra Credit
#What is the most popular word? (you may need the help of ruby)
##########################################################################################
#What are some other kinds of queries that are useful? 

