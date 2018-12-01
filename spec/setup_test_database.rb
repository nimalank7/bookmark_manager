require 'pg'
require 'bcrypt'

def setup_test_database
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec 'DROP TABLE Comments'
  connection.exec 'DROP TABLE bookmarks'
  connection.exec 'DROP TABLE Users'
  connection.exec 'CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60))'
  connection.exec 'CREATE TABLE Comments (Comment_ID SERIAL PRIMARY KEY, Body VARCHAR(240), Bookmark_id INTEGER, FOREIGN KEY (Bookmark_id) REFERENCES Bookmarks (id) ON DELETE CASCADE)'
  connection.exec 'CREATE TABLE Users(user_ID SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140))'
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
end
