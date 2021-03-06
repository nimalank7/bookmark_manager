require 'pg'
require 'uri'
require_relative "./database_connection.rb"
require_relative "./comment.rb"
require_relative "./tag_model.rb"

class List
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.see_list
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    array_of_bookmarks = result.map do |bookmark|
      List.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  def self.create_bookmark(url, title)
    return false unless is_url?(url)
    result = DatabaseConnection.query(("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;"))
    List.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete_bookmark(url)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE url='#{url}'")
  end
  def self.update_bookmark(url, title, id)
    result = DatabaseConnection.query(("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id=#{id} RETURNING id, title, url;"))
    List.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.find_bookmark(search = nil)
    bookmarks = List.see_list
    @results = bookmarks.select do |bookmark|
      bookmark.url == search || bookmark.title == search # I should downcase this
    end
  end
  def self.search_results
    @results
  end
  def all_comments(comment_class = Comment)
    comment_class.all_comments(@id)
  end
  def all_tags(tag_class = Tag)
    tag_class.all_tags(@id)
  end
  def self.all_bookmarks(t_id)
    result = DatabaseConnection.query("SELECT Bookmarks.id, Bookmarks.title, Bookmarks.url FROM Bookmarks INNER JOIN Bookmark_Tag ON Bookmarks.id = Bookmark_Tag.bookmark_id WHERE Bookmark_Tag.tag_id = '#{t_id}'")
    array_of_bookmarks = result.map do |bookmark|
      List.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  private
  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http','https'])}\z/
  end

end
