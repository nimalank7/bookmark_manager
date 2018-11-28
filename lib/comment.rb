require_relative "./database_connection.rb"
require 'pg'

class Comment
  attr_reader :id, :body
  def initialize(id, body)
    @id = id
    @body = body
  end
  def self.create_comment(body, id)
    result = DatabaseConnection.query(("INSERT INTO Comments(body, bookmark_id) VALUES('#{body}', '#{id}') RETURNING body, bookmark_id;"))
    Comment.new(result[0]['bookmark_id'].to_i, result[0]['body'])
  end
  def self.all_comments(id)
    result = DatabaseConnection.query("SELECT * FROM Comments WHERE bookmark_id = '#{id}'")
    array_of_comments = result.map do |comment|
      Comment.new(result[0]['bookmark_id'].to_i, result[0]['body'])
    end
  end
end
