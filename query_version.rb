#!/usr/bin/ruby

require 'pg'

puts 'Version of libpg: ' + PG.library_version.to_s

connection = PG.connect :dbname => 'bookmark_manager' # :user => 'nimalankirubakaran' this works without it
puts connection.class # Stores it as an object - PG::Connection
result = con.exec 'SELECT * FROM bookmarks'
puts result.class # Stores it as an object - PG::Result
# puts result[0]
result.each do |row|
  puts "#{row['id']} and #{row['url']}"
end

result.clear if rs
connection.close if con
