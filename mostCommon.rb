require "sqlite3" 										#include sqlite3 library

db = SQLite3::Database.new("tweet_db.sqlite3")			#open the database
wordHash = Hash.new(0)									#make the new hash that will store the count for words

db.execute("SELECT status FROM statuses") do |row|		#reads the row into an array format
	string = "#{row.join(",")}"							#converts it to strings
	words = string.split(/ /)							#split the string into words array, remove spaces
	words.each {|x| wordHash[x]+=1}						#for each word found, increase the count by 1 in the hash
end

puts "Most popular word: #{wordHash.max_by{|k,v| v}}"	#prints the max by key-value pair on value count
