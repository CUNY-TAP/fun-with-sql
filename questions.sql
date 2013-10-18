
# Remember to turn in the SQL queries that return the answers, I am not actually interested in the answers themselves, 
# but valid SQL. 

# Select all the user names from the users table. 
SELECT name 
FROM users;

#Select all the user names whose name starts with the letter “b”. 
SELECT name 
FROM users 
WHERE name like 'b%';


#How many users are there? 
SELECT COUNT(*) 
FROM users;



#How many posts by a certain user? 
SELECT COUNT(*), u.name 
FROM users u JOIN statuses ON u.id = user_id 
WHERE u.name = 'newsaddictions';
#OR
SELECT COUNT(*), u.name 
FROM users u JOIN statuses ON u.id = user_id 
WHERE u.name = #<'--insert username--'>;



#Return the user name column, and all the status by that user.
SELECT u.name AS 'NAME', s.status AS 'STATUS'
FROM users u
JOIN statuses s ON u.id = s.user_id
ORDER BY NAME;




#Return all users who have at least 1 status that has a geocode. (Hint, you’ll want somewhere your WHERE clause “geocode IS NOT NULL”). 
SELECT u.name 
FROM users u JOIN statuses ON u.id = user_id 
WHERE geocode IS NOT NULL GROUP BY u.name;



#Return all user names who have written more than one status. 
SELECT Name 
FROM

(
	SELECT u.name AS 'Name',COUNT(*) AS 'Num' 
	FROM users u JOIN statuses s ON u.id = s.user_id 
	GROUP BY Name
) 

WHERE Num > 1;




#Return all user names who have written more than one status with the tag “food.” 

SELECT Name
FROM(
	
	SELECT u.name AS 'Name', COUNT(*) AS 'Num'
	FROM statuses s
	JOIN statuses_tags st ON s.id = st.status_id
	JOIN tags tg ON tg.id = st.tag_id
	JOIN users u ON u.id = s.user_id
	WHERE tg.tag = 'food'
	GROUP BY u.name, tg.tag
	
	)
WHERE Num > 1;



#Return user names, their statuses, and their tags in one big join. 
SELECT u.name as 'Name', s.status AS 'Status', t.tag AS 'Tag'
From users u
JOIN statuses s ON s.user_id = u.id
JOIN statuses_tags st ON st.status_id = s.id
JOIN tags t ON t.id = st.tag_id;




#What is the most recent status? 
SELECT user_id, MAX(created_at), status 
FROM statuses 
ORDER BY created_at;



#What is the most popular tag? (Hint, count how many statuses their are by tag). 
SELECT tag, MAX(Num)
FROM(
SELECT tag AS 'TAG', COUNT(*) AS 'Num'
FROM tags t
JOIN statuses_tags st ON st.tag_id = t.id
GROUP BY tag
);


#What is the most popular user? 
#---This query searches for the user with the most tweets----#
#---If there is a tie in the amount of tweets, it will select by lex order---#
SELECT Name, MAX(NUM)
FROM(
SELECT u.name AS 'Name', COUNT(*) "NUM"
FROM users u
JOIN statuses s ON s.user_id = u.id
GROUP BY u.name
);



#Give me ALL statuses by all users, with their tags, even the ones that don’t necessarily have a tag. 
#-----------HELP------------#
#With tags
SELECT u.name AS 'NAME', s.status AS 'STATUS', t.tag AS 'TAG'
FROM users u
JOIN statuses s ON u.id = s.user_id
JOIN statuses_tags st ON st.status_id = s.id
JOIN tags t ON t.id = st.tag_id
ORDER BY NAME;

#-----having difficulty finding a way to insert statuses without null values---#

#Extra Credit
#What is the most popular word? (you may need the help of ruby)
'Count: 1072'
'Word : Obama'
'See code below for how it was done'
#----Ruby Program below is what executes this answer------#
/*
require 'sqlite3'

#Oens up database for queries
db = SQLite3::Database.open "tweet_db.sqlite3"

#statement that grabs the result of a specific query
stm = db.prepare "SELECT status FROM statuses"

#Hash with a default value of 0 will keep count of all the individual words used
#within the statuses
wordHash = Hash.new {|hash, key| hash[key] = 0 }

#The results are held in an array
#Each status exists in wordHash[0]
#We will split the status into individual words and store into a hash
stm.each do |item|
	altStm = item[0].split(" ")
	altStm.each do |word|
		if wordHash.keys.include?(word) == nil
			wordHash[word]
	
		else
			wordHash[word] += 1

		end		
	end
end

#Find Max value
ansWord = "dummyVariable"
max = -1

wordHash.each do |item|
	if max < item[1]
		max = item[1]
		ansWord  = item[0]
	end
end

puts max
puts ansWord

*/

#What are some other kinds of queries that are useful? 
#See how many posts by all users and ordered by number and then by name
SELECT COUNT(*),u.name FROM users u JOIN statuses ON u.id = user_id GROUP BY u.name ORDER BY COUNT(*)DESC, u.name ASC;
