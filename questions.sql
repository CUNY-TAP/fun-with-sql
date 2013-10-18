
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name FROM users WHERE name LIKE "b%";

#How many users are there? 
SELECT COUNT(*) FROM users;

#How many posts by a certain user? 
SELECT COUNT(*) FROM statuses where user_id=USER_ID

#Return the user name column, and all the status by that user. 
SELECT name, status FROM users inner join statuses on users.id = statuses.user_id where users.id=USER_ID

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT DISTINCT name FROM users left join statuses on users.id = statuses.user_id WHERE geocode IS NOT NULL;

#Return all user names who have written more than one status.
SELECT name FROM users u left join statuses s on u.id = s.user_id group by s.user_id HAVING count(*) > 1;

#Return all user names who have written more than one status with the tag “food.”
SELECT name FROM statuses_tags st left join statuses s on st.status_id = s.id left join users u on s.user_id=u.id group by u.name HAVING tag_id=1 AND count(*)>1;

#Return user names, their statuses, and their tags in one big join. 
SELECT name, status, tag FROM users left join statuses on users.id = statuses.user_id left join statuses_tags on statuses.id = statuses_tags.status_id left join tags on statuses_tags.tag_id = tags.id;   

#What is the most recent status? 
SELECT * from statuses order by created_at desc limit 1;

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
select tag from statuses_tags st left join tags t on st.tag_id = t.id group by tag_id order by count(*) desc limit 1;

#What is the most popular user? 
SELECT users.id, name, count(*) from users left join statuses on users.id = statuses.user_id group by users.id order by count(*) desc limit 1;

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT status, tag FROM statuses s left join statuses_tags st on s.id = st.status_id left join on tags t on st.tag_id = t.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)
The most popular word is "obama" with 1110 occurances. Take a look at concordance.rb for the implementation.

#What are some other kinds of queries that are useful? 
