CREATE TABLE Comments (Comment_ID SERIAL PRIMARY KEY, Body VARCHAR(240), Bookmark_id INTEGER, FOREIGN KEY (Bookmark_id) REFERENCES Bookmarks (id));
