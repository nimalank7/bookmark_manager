require "list"

describe List do
  before(:each) {add_bookmarks} # This adds the bookmarks in
  it "contains makersacademy in the list of bookmarks when see_list is called" do
    add_bookmarks

    bookmarks = List.see_list
    expect(bookmarks[0]['url']).to eq "http://www.makersacademy.com"
  end
  it "contains google.com in the list of bookmarks when see_list is called" do
    add_bookmarks
    bookmarks = List.see_list
    expect(bookmarks[1]['url']).to eq "http://google.com"
  end
  it "contains destroyallsoftware in the list of bookmarks when see_list is called" do
    add_bookmarks
    bookmarks = List.see_list
    expect(bookmarks[2]['url']).to eq "http://www.destroyallsoftware.com"
  end
end
