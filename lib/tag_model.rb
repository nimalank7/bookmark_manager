require_relative "../lib/database_connection.rb"
require_relative "./bookmark_tag_model.rb"
require_relative "./list.rb"

class Tag
  attr_reader :id, :content
  def initialize(id, content)
    @id = id
    @content = content
  end
  def self.create(content)
    result = DatabaseConnection.query(("INSERT INTO Tags (content) VALUES('#{content}') RETURNING tag_id, content;"))
    Tag.new(result[0]['tag_id'], result[0]['content'])
  end
  def self.all_tags(b_id)
    result = DatabaseConnection.query("SELECT Tags.tag_id, Tags.content FROM Tags INNER JOIN Bookmark_Tag ON Tags.tag_id = Bookmark_Tag.tag_id WHERE Bookmark_Tag.bookmark_id = '#{b_id}'")
    array_of_tags = result.map do |tag|
      Tag.new(tag['tag_id'], tag['content'])
    end
  end
  def all_bookmarks(bookmark_class = List)
    bookmark_class.all_bookmarks(@id)
  end
end
