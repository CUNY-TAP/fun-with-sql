# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”.

SELECT name FROM users WHERE name LIKE("b%"); 

#How many users are there?

select count(name) from users;

#How many statuses by a certain user? 

select count(s.status) from statuses s inner join users u on u.id = s.user_id where u.name = "babyjojo107";

#Return the user name column, and all the statuses by that user. 

select u.name, s.status from statuses s inner join users u on u.id = s.user_id where u.name = "babyjojo107";

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 

select distinct u.name from users u inner join statuses s on u.id = s.user_id where geocode is not null;

#Return all user names who have written more than one status. 

select distinct u.name from users u inner join statuses s on u.id = s.user_id group by u.name having count(s.status)>1;

#Return all user names who have written more than one status with the tag “food.” 

select u.name from users u inner join statuses s on u.id = s.user_id left join statuses_tags st on s.id=st.status_id left join tags t on st.tag_id = t.id group by u.name having count(s.status)>1 and t.tag="food";

#Return user names, their statuses, and their tags in one big join. 

select u.name from users u inner join statuses s on u.id = s.user_id left join statuses_tags st on s.id=st.status_id left join tags t on st.tag_id = t.id;

#What is the most recent status? 

select status from statuses where created_at = (select max(created_at) from statuses);

#What is the most popular tag? (Hint, count how many statuses their are by tag). 

select t.tag from tags t inner join statuses_tags st on st.tag_id = t.id inner join statuses s on s.id = st.status_id group by t.tag order by count(st.tag_id) desc limit 1;

#What is the most popular user? 

select u.name from users u inner join statuses s on u.id = s.user_id group by u.name order by count(s.user_id) desc limit 1;

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 

select u.name, s.status, t.tag from users u inner join statuses s on u.id = s.user_id left join statuses_tags st on s.id=st.status_id left join tags t on st.tag_id = t.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)



#What are some other kinds of queries that are useful? 



