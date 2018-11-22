require 'pg'

def setup_test_database
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec 'TRUNCATE bookmarks'
end

def add_bookmarks
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')"
  connection.exec "INSERT INTO bookmarks (url) VALUES('http://google.com')"
  connection.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"
end
