# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT * 
FROM users 
WHERE name like '%b';

#How many users are there? 
SELECT COUNT(*) FROM users;

#How many statuses by a certain user? 
SELECT COUNT(*)
FROM users u INNER JOIN statuses s
ON u.id=s.user_id
WHERE name="youngpeete";

#Return the user name column, and all the statuses by that user. 
SELECT name, status
FROM users u INNER JOIN statuses s
ON u.id=s.user_id
WHERE name="youngpeete";

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT name
FROM users u INNER JOIN statuses s
ON u.id=s.user_id
WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status. 
SELECT name
FROM 
(SELECT s.user_id,COUNT(*) AS sNum, u.name 
FROM users u INNER JOIN statuses s
ON u.id=s.user_id
GROUP BY s.user_id
)
WHERE sNUM >1;


#Return all user names who have written more than one status with the tag “food.” 
SELECT name
FROM
(SELECT s.user_id, COUNT(*)as sNUM, name,status, tag
FROM tags t, statuses_tags st, statuses s, users u
WHERE t.id=st.tag_id AND s.id=st.status_id AND u.id=s.user_id AND t.tag="food" 
GROUP BY s.user_id
)
WHERE sNUM >1;

#Return user names, their statuses, and their tags in one big join. 
SELECT u.name, status, tag
FROM users u INNER JOIN
(SELECT user_id, tag, status
FROM statuses s INNER JOIN
(SELECT t.tag, st.status_id
FROM tags t INNER JOIN statuses_tags st
ON t.id=st.tag_id)AS a
ON a.status_id=s.id)AS b
ON u.id= b.user_id;

#What is the most recent status? 
SELECT *
FROM statuses
Where updated_at IN(
SELECT MAX(updated_at)
FROM statuses)

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT tag
FROM statuses s INNER JOIN
(SELECT st.tag_id, t.tag, st.status_id
FROM tags t INNER JOIN statuses_tags st
ON t.id=st.tag_id)AS a
ON a.status_id = s.id
GROUP BY a.tag
ORDER BY COUNT(tag);

#What is the most popular user? 
/*Following SQL statement to find all the status that @ other users, but I have no idea how to get that @user out of status*/
SELECT *
FROM users u INNER JOIN statuses s
ON u.id=s.user_id
Where status like "%@%"

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT u.name, status, tag
FROM users u INNER JOIN
(SELECT user_id, tag, status
FROM statuses s INNER JOIN
(SELECT t.tag, st.status_id
FROM tags t INNER JOIN statuses_tags st
ON t.id=st.tag_id)AS a
ON a.status_id=s.id)AS b
ON u.id= b.user_id
ORDER BY u.name;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

