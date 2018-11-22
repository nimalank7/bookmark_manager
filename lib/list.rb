require 'pg'

class List
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.see_list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
      result = connection.exec 'SELECT * FROM bookmarks'
      value = result.map do |bookmark|
        List.new(bookmark['id'], bookmark['title'], bookmark['url'])
      end
      value
  end
  def self.create_bookmark(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    result = connection.exec ("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    List.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end
end
