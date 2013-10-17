require 'sqlite3'

db = SQLite3::Database.new 'tweet_db.sqlite3'

statuses = db.execute "SELECT status from statuses"

concordance = Hash.new(0);

statuses.each do |status| 
  words = status.first.split(" ")
  words.each do |word| 
    word.downcase!
    concordance[word] = concordance[word]+1
  end
end

maxKey, maxVal = "", -1

concordance.each do |k, v|
  if v > maxVal
    maxVal = v
    maxKey = k
  end
end

puts "hash[#{maxKey}] = #{maxVal}"
