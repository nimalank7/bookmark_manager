require_relative "./bookmark.rb"

class List
  attr_accessor :contents
  def initialize
    @contents = []
  end
  def see_list
    @contents.each do |bookmark|
      puts bookmark.url
    end
  end
end
