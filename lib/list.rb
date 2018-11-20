require 'pg'

class List
  attr_accessor :contents
  def initialize
    @contents = []
  end

  def self.see_list
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec 'SELECT * FROM bookmarks'
  end

end
