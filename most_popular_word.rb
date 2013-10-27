require "sqlite3" 

db = SQLite3::Database.new("tweet_db.sqlite3")  

word_count_hash = Hash.new(0)    

db.execute("SELECT status FROM statuses") do |row|  
  words = row.first.split   
  words.each do |x|
  	x = x.downcase 
  	word_count_hash[x]+=1 
  end       
end

most_popular_word = word_count_hash.max_by{ | k, v | v }.first
puts "The Most popular word is '#{most_popular_word}'."   