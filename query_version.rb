#!/usr/bin/ruby

require 'pg'

puts 'Version of libpg: ' + PG.library_version.to_s

con = PG.connect :dbname => 'bookmark_manager' # :user => 'nimalankirubakaran' this works without it
puts con.class # Stores it as an object - PG::Connection
rs = con.exec 'SELECT * FROM bookmarks'
puts rs.class # Stores it as an object - PG::Result
puts rs[0]
rs.each do |row|
  puts "#{row['id']} and #{row['url']}"
end

rs.clear if rs
con.close if con
