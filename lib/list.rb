require_relative "./bookmark.rb"

class List
  attr_accessor :contents
  def initialize

    @contents = []
  end

  def see_list
    @contents
  end

  def self.create_instance
    @list = List.new
  end

  def self.read_instance
    @list
  end
end
