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
      array_of_bookmarks = result.map do |bookmark|
        List.new(bookmark['id'], bookmark['title'], bookmark['url'])
      end
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
  def self.delete_bookmark(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    connection.exec "DELETE FROM bookmarks WHERE url='#{url}'"
  end
  def self.update_bookmark(url, title, id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    result = connection.exec ("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id=#{id} RETURNING id, title, url;")
    List.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end
end
