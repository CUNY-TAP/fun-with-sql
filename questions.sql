# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 

select name from users where name like'b%';

#How many users are there? 
select count(name) from users;


#How many posts by a certain user? 
 select count(status) from statuses where user_id=277;


#Return the user name column, and all the status by that user. 
select name, status from users u inner join statuses  on u.id=user_id where u.id=277

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 

select  distinct geocode ,user_id from statuses where geocode!='NULL';
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

