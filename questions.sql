# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 



# Select all the user names from the users table. 
SELECT name FROM users; #outputs all the names from the users table. 

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE "b%"; #this only outputs users that have "b" as their begininng letter. 

#How many users are there? 
SELECT COUNT(*) FROM users; #316 just for my info 

#How many statuses by a certain user? # the total number of statuses?  
SELECT COUNT(*) FROM statuses WHERE user_id=USER_ID; #3012 statuses 

#Return the user name column, and all the statuses by that user. 
SELECT name, status FROM users inner join statuses on users.id = statuses.user_id WHERE users.id=USER_ID;   #woah that is cool. 

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT name FROM users LEFT JOIN statuses on users.id=statuses.user_id WHERE geocode IS NOT NULL; 

#Return all user names who have written more than one status. 
SELECT name FROM users u LEFT JOIN statuses s on u.id = s.user_id group by s.user_id HAVING count(*) > 1;

#Return all user names who have written more than one status with the tag “food.” 
SELECT name FROM users u LEFT JOIN statuses s ON u.id=s.user_id LEFT JOIN statuses_tags st ON s.id = st.status_id LEFT JOIN tags t ON st.tag_id = t.id WHERE t.tag = 'food' GROUP BY u.name HAVING count(status)>1;

#Return user names, their statuses, and their tags in one big join. 
SELECT name, status, tag FROM users LEFT JOIN statuses on users.id = statuses.user_id LEFT JOIN statuses_tags on statuses.id = statuses_tags.status_id LEFT JOIN tags on statuses_tags.tag_id = tags.id;   

#What is the most recent status? 
SELECT * FROM statuses order by created_at desc limit 1; #descending order will get the most recent status post

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT tag FROM statuses_tags st left join tags t on st.tag_id = t.id group by tag_id order by count(*) desc limit 1; #food

#What is the most popular user? 
SELECT users.id, name, COUNT(*) FROM users LEFT JOIN statuses on users.id = statuses.user_id GROUP BY users.id order by COUNT(*) desc limit 1; #givariuciha

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT s.status, t.tag FROM statuses s LEFT JOIN statuses_tags st ON s.id = st.status_id LEFT JOIN tags t ON st.tag_id = t.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

