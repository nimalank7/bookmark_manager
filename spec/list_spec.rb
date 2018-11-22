require "list"
require 'pg'

describe List do
  before(:each) {add_bookmarks} # This adds the bookmarks in
  it "contains makersacademy in the list of bookmarks when see_list is called" do
    bookmarks = List.see_list
    expect(bookmarks[0]['url']).to eq "http://www.makersacademy.com"
  end
  it "contains google.com in the list of bookmarks when see_list is called" do
    bookmarks = List.see_list
    expect(bookmarks[1]['url']).to eq "http://google.com"
  end
  it "contains destroyallsoftware in the list of bookmarks when see_list is called" do
    bookmarks = List.see_list
    expect(bookmarks[2]['url']).to eq "http://www.destroyallsoftware.com"
  end
  it "returns yahoo.com as the url" do
    expect(List.create_bookmark("http://www.yahoo.com")[0]['url']).to eq "http://www.yahoo.com"
  end
end
