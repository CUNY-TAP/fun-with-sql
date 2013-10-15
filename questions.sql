# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

Table: users						Table:statuses
0|id|INTEGER|1||1 ->user_id	  		0|id|INTEGER|1||1		 ->status_id
1|name|varchar(255)|0||0			1|user_id|integer|0||0
2|created_at|datetime|1||0			2|status|text|0||0
3|updated_at|datetime|1||0			3|geocode|varchar(255)|0||0
									4|created_at|datetime|1||0
									5|updated_at|datetime|1||0
			
Table: tags							Table:statuses_tags
0|id|INTEGER|1||1					0|id|INTEGER|1||1
1|tag|varchar(255)|0||0				1|status_id|integer|0||0
2|created_at|datetime|1||0			2|tag_id|integer|0||0	->tags.id
3|updated_at|datetime|1||0

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE "b%";

#How many users are there? 
SELECT count(*) FROM users;

#How many posts by a certain user? 
SELECT name, count(*) FROM statuses s 
LEFT JOIN users u ON s.user_id = u.id GROUP BY name;

#Return the user name column, and all the status by that user. 
SELECT name, status FROM statuses s 
LEFT JOIN users u ON s.user_id = u.id GROUP BY name;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT name FROM users u 
LEFT JOIN statuses s on u.id=s.user_id WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status.
SELECT name FROM users u 
LEFT JOIN statuses s ON u.id = s.user_id 
GROUP BY user_id HAVING count(status)>1; 

#Return all user names who have written more than one status with the tag “food.” 
SELECT name FROM users u 
LEFT JOIN statuses s ON u.id=s.user_id 
LEFT JOIN statuses_tags st ON s.id = st.status_id 
LEFT JOIN tags t ON st.tag_id = t.id 
WHERE t.tag = 'food' 
GROUP BY u.name HAVING count(status)>1;

#Return user names, their statuses, and their tags in one big join. 
SELECT DISTINCT u.name, s.status, t.tag FROM users u 
LEFT JOIN statuses s ON u.id=s.user_id 
LEFT JOIN statuses_tags st ON s.id = st.status_id 
LEFT JOIN tags t ON st.tag_id = t.id; 

#What is the most recent status? 
SELECT status FROM statuses WHERE created_at = (SELECT MAX(created_at) FROM statuses);

#What is the most popular tag? (Hint, count how many statuses there are by tag).
SELECT tag FROM tags WHERE tag = (SELECT MAX(tag) FROM tags);
#^Would counting the max tag entries from tags work as well? I got the answer: 'food'
#But I only see 1 tag entry in the tags table?? (SELECT * FROM tags -Returns only 1 tag entry)

#What is the most popular user?
SELECT u.name, max(user_id) FROM users u LEFT JOIN statuses s ON u.id=s.user_id; 

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT s.status, t.tag FROM statuses s
LEFT JOIN statuses_tags st ON s.id = st.status_id
LEFT JOIN tags t ON st.tag_id = t.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)
#Most popular word is "Obama" with a count of 1072
#See "mostCommon.rb" for code.

#What are some other kinds of queries that are useful? 
#TRIGGERS, not sure if it counts as a query but 
#they are useful for handeling db events such as adding a timestamp when certain event occurs.

