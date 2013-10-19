# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”.
SELECT name FROM users WHERE name LIKE "b%"; 

#How many users are there? 
SELECT count(*) FROM users;

#How many statuses by a certain user? 
SELECT count(*) FROM statuses WHERE user_id = 256;

#Return the user name column, and all the statuses by that user. 
SELECT name, status FROM users INNER JOIN statuses ON statuses.user_id;

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT user_id FROM statuses WHERE geocode IS NOT NULL; #if you want to return user_id numbers
SELECT name FROM users INNER JOIN statuses WHERE statuses.geocode IS NOT NULL; # if you want to return names

#Return all user names who have written more than one status. 
SELECT user_id FROM statuses WHERE status IS NOT NULL; #if you want to return user_id numbers

#Return all user names who have written more than one status with the tag “food.” 
# first I did: select id from tags where tag = 'food'; which tells me that the tag = 1 so then I searched for tag 1
# and SELECT* from statuses_tags confirms that 1 is the only tag in the db so I tried:
#select name from users INNER JOIN statuses_tags where tag_id = 1; and you can combine these to:
SELECT name FROM users INNER JOIN statuses_tags WHERE tag_id = (SELECT id FROM tags WHERE tag = 'food');

#Return user names, their statuses, and their tags in one big join. 
SELECT name, status, tag FROM users INNER JOIN statuses ON users.id = statuses.user_id INNER JOIN statuses_tags ON statuses.id = statuses_tags.status_id  INNER JOIN tags ON statuses_tags.tag_id = tags.id; 
# is this also correct, just ordered by user name??? 
SELECT name, status, tag FROM users INNER JOIN statuses INNER JOIN tags ON statuses.user_id; 

#What is the most recent status? 
SELECT MAX(updated_at), status FROM statuses; #this will give the timestamp followed by the status

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT MAX(tag) FROM statuses_tags INNER JOIN tags ON statuses_tags.tag_id = tags.id;
# this works the same as the following.  So do I need to do the = statement at the end here? SQL figures it out it seems...
SELECT MAX(tag) FROM statuses_tags INNER JOIN tags ON tag_id;

#What is the most popular user? 
# it seems like you can leave out the = users.id and you'd still get the same answer...why?
SELECT MAX(status),name FROM  statuses INNER JOIN users ON statuses.user_id = users.id; 

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
SELECT status, tag FROM statuses LEFT JOIN statuses_tags ON statuses.id = statuses_tags.status_id LEFT JOIN tags ON statuses_tags.tag_id = tags.id;


#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

