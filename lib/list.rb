require 'pg'

class List
  def self.see_list
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec 'SELECT * FROM bookmarks'
  end
  def self.create_bookmark(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    result = connection.exec ("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
  end
  def self.test(value)
    puts "#{value}"
  end
end
