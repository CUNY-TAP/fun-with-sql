Peter Mingione Initial Comment
==============================


# fun-with-sql 
============

Practice your SQL. 

The goal of this lab is to familiarize yourself with SQL statements. Please make sure to sanity check your work. Just because you get a response from SQL, does it make sense? Is it returning thousands of rows, when it should be returning only a handful? 

## Completing the assignment
Follow set up below. As before, you should fork this repo, and submit your work as a pull request against the master branch of this repo.

## Setup

Checkout out the SQLite file from git hub:

	$ git clone git@github.com:CUNY-TAP/fun-with-sql.git

Change to the directory:
	
	$ cd fun-with-sql

Create an RVM gemset (and use it):

	$ rvm use ruby-2.0.0@funwithsql --create

Install the SQLite3 gem:
	
	$ gem install sqlite3
 
Run the sqlite3 console:
	
	$ sqlite3 tweet_db.sqlite3

You are now in the SQL lite console. 


## Helpful Commands
	sqlite> .quit 
	sqlite> .tables ## lists all the tables in the DB
	sqlite> PRAGMA table_info(NAME_OF_TABLE) ## shows you columns in table.
	sqlite> select * from users ; ## returns all rows and all columns from the users table. 

## Hints
For a shortcut, you can ‘nickname’ a table by specifying a name after the table name in the FROM clause. For example, if I want to nickname the users table as ‘u’, I can do it like so in the following query. 

	SELECT u.name, s.status FROM users u INNER JOIN statuses s ON s.user_id = u.id ;

You can use the LIKE operator in a where clause to look for text patterns. The % character is used as a wild card. 

	WHERE name LIKE ‘%ST’

Will find rows whose name column ends with the characters “ST”. 

	WHERE name LIKE ‘%ST%’

Will find rows whose name column has the characters “ST” anywhere within the phrase. 

	WHERE name = “STEVE JOBS”

Will find only the rows whose name column EXACLY matches “STEVE JOBS”. 

If you get stuck, google around, and make sure to checkout the SQLite command reference. http://www.sqlite.org/lang.html

## Questions
Look in the questions.sql file to create the actual SQL statements. Make sure to edit the questions.sql, and submit that as a pull request against the master repo. 
