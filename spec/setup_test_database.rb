require 'pg'
require 'bcrypt'

def setup_test_database
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec 'DROP TABLE Bookmark_Tag'
  connection.exec 'DROP TABLE Comments'
  connection.exec 'DROP TABLE bookmarks'
  connection.exec 'DROP TABLE Users'
  connection.exec 'DROP TABLE Tags'
  connection.exec 'CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60))'
  connection.exec 'CREATE TABLE Comments (Comment_ID SERIAL PRIMARY KEY, Body VARCHAR(240), Bookmark_id INTEGER, FOREIGN KEY (Bookmark_id) REFERENCES Bookmarks (id) ON DELETE CASCADE)'
  connection.exec 'CREATE TABLE Users(user_ID SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140))'
  connection.exec 'CREATE TABLE Tags(tag_ID SERIAL PRIMARY KEY, content VARCHAR(60))'
  connection.exec 'CREATE TABLE Bookmark_Tag (Join_ID SERIAL PRIMARY KEY, Bookmark_id INTEGER, FOREIGN KEY (Bookmark_id) REFERENCES Bookmarks (id) ON DELETE CASCADE, tag_id INTEGER, FOREIGN KEY (tag_id) REFERENCES Tags (tag_id))'
end

def add_bookmarks_and_comments_and_users
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy')"
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google')"
  connection.exec "INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all software')"
  connection.exec "INSERT INTO Comments(body, bookmark_id) VALUES('Go to search engine', 2)"
  connection.exec "INSERT INTO Comments(body, bookmark_id) VALUES('Find anything', 2)"
  # enc_password = BCrypt::Password.create("password")
  connection.exec "INSERT INTO Users (email, password) VALUES('nimalan.kirubakaran@test.com', 'password')"
  connection.exec "INSERT INTO Tags(content) VALUES('Housekeeping')"
  connection.exec "INSERT INTO Tags(content) VALUES('Travel')"
  connection.exec "INSERT INTO Bookmark_Tag(bookmark_id, tag_id) VALUES(1, 2)" # Makers Travel
  connection.exec "INSERT INTO Bookmark_Tag(bookmark_id, tag_id) VALUES(1, 1)" # Makers Housekeeping
  connection.exec "INSERT INTO Bookmark_Tag(bookmark_id, tag_id) VALUES(2, 1)" # Google Travel
  connection.exec "INSERT INTO Bookmark_Tag(bookmark_id, tag_id) VALUES(2, 2)" # Google Housekeeping
end
