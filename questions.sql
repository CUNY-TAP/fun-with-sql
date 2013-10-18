# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name FROM users;

#Select all the user names whose name starts with the letter “b”. 
select name
from users
where name like 'b%';

#How many users are there? 
select count(*)
from users;

#How many statuses by a certain user? 
select u.name, count(s.status)
from users u inner join statuses s
on s.user_id = u.id
where u.id = 171
group by u.name;

#Return the user name column, and all the statuses by that user.
select users.name, statuses.status
from users join statuses
where users.id = 171 and statuses.user_id = 171; 

#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
select users.name
from users join statuses
where statuses.geocode is not null and users.id = statuses.user_id
group by users.name;

#Return all user names who have written more than one status. 
select u.name
from users u join statuses s
where u.id = s.user_id
group by u.name
having count(s.status) > 1;

#Return all user names who have written more than one status with the tag “food.” 
select u.name
from users u join statuses s join statuses_tags st join tags t
on u.id = s.user_id and s.id = st.status_id and st.tag_id = t.id
group by u.name
having count(t.tag like 'food') > 1;

#Return user names, their statuses, and their tags in one big join. 
select u.name, s.status, t.tag
from users u join statuses s join statuses_tags st join tags t
on u.id = s.user_id and s.id = st.status_id and st.tag_id = t.id;

#What is the most recent status? 
select max(t.created_at), s.status
from tags t join statuses_tags st join statuses s
on t.id = st.tag_id and st.status_id = s.id;

#What is the most popular tag? (Hint, count how many statuses their are by tag). 
select t.tag, count(s.status) as freq
from statuses s join statuses_tags st join tags t
where s.id = st.status_id and st.tag_id = t.id
group by t.tag
order by freq desc;

#What is the most popular user? 
##### Not sure how to structure this query
##### SQLite does not generate any output
select u.name, count(u.name) as freq
from users u join statuses s
group by u.name
having s.status like u.name
order by freq desc;

#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
select s.status, t.tag
from statuses s join statuses_tags st left join tags t
where s.id = st.status_id and st.tag_id = t.id;

#Extra Credit
#What is the most popular word? (you may need the help of ruby)

#What are some other kinds of queries that are useful? 

