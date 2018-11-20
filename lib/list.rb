require 'pg'
class List
  attr_accessor :contents
  def initialize
    @contents = []
  end

  def self.see_list
    con = PG.connect :dbname => 'bookmark_manager'
    rs = con.exec 'SELECT * FROM bookmarks'
  end

end
