require 'pg'

def setup_test_database
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec 'TRUNCATE bookmarks'
end

def add_bookmarks
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy')"
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://google.com', 'Google')"
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all software')"
end
