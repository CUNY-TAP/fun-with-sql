
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE 'b%';

#How many users are there? 
SELECT count(*) FROM users;

#How many statuses by a certain user? 
SELECT count(*) FROM statuses where user_id = 325;

#Return the user name column, and all the statuses by that user. 
SELECT u.name, s.status FROM users u 
LEFT JOIN statuses s ON u.id = s.user_id 
WHERE u.id = 325;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT u.name FROM users u 
LEFT JOIN statuses s ON u.id = s.user_id 
WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status. 
SELECT u.name, count(s.status) FROM users u
INNER JOIN statuses s ON u.id = s.user_id 
GROUP BY u.id
HAVING count(s.status) > 1
ORDER BY count(s.status);

#Return all user names who have written more than one status with the tag “food.” 
SELECT u.name, count(s.status) FROM users u
INNER JOIN statuses s ON u.id = s.user_id 
INNER JOIN statuses_tags st ON s.id = st.status_id
INNER JOIN tags t on st.tag_id = t.id
WHERE t.tag = "food"
GROUP BY u.id
HAVING count(s.status) > 1
ORDER BY count(s.status);

#Return user names, their statuses, and their tags in one big join. 
SELECT u.name, s.status, t.tag FROM users u
INNER JOIN statuses s ON u.id = s.user_id
INNER JOIN statuses_tags st ON s.id = st.status_id
INNER JOIN tags t on st.tag_id = t.id;

#What is the most recent status?
SELECT status FROM statuses
WHERE updated_at = (SELECT MAX(updated_at) FROM statuses);

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT tag, count(st.id) FROM tags t
INNER JOIN statuses_tags st ON t.id = st.tag_id
GROUP BY t.id
ORDER BY count(st.id);
#This should order the tags by their popularity, but it's hard to test with only one tag...
#I did the problem below this first and the modeled this answer on that one
#Still not sure how to return only one entry of such a sorting

#What is the most popular user? 
#Is this asking for the user with the most statuses? I don't know if I'd call that most popular...
SELECT u.name, count(s.status) FROM users u
INNER JOIN statuses s ON u.id = s.user_id 
GROUP BY u.id
ORDER BY count(s.status);
#This will return all the users sorted by number of statuses.
#I'm not sure how to return only the one last one.

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT s.status, t.tag FROM statuses s
INNER JOIN statuses_tags st ON s.id = st.status_id
LEFT JOIN tags t on st.tag_id = t.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful?