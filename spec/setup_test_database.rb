require 'pg'

def setup_test_database
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec 'DROP TABLE Comments'
  connection.exec 'DROP TABLE bookmarks'
  connection.exec 'CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60))'
  connection.exec 'CREATE TABLE Comments (Comment_ID SERIAL PRIMARY KEY, Body VARCHAR(240), Bookmark_id INTEGER, FOREIGN KEY (Bookmark_id) REFERENCES Bookmarks (id))'
end

def add_bookmarks
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy')"
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://google.com', 'Google')"
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all software')"
end
