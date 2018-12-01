CREATE TABLE Bookmark_Tag (Join_ID SERIAL PRIMARY KEY, Bookmark_id INTEGER, FOREIGN KEY (Bookmark_id) REFERENCES Bookmarks (id), tag_id INTEGER, FOREIGN KEY (tag_id) REFERENCES Tags (tag_id));
