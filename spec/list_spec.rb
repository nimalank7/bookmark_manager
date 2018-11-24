require "list"
require 'pg'

describe List do
  let(:list) { List.new(1, "Microsoft", "http://www.microsoft.com") }
  before(:each) {add_bookmarks} # This adds the bookmarks in
  it "contains makersacademy in the list of bookmarks when see_list is called" do
    bookmarks = List.see_list
    expect(bookmarks[0].url).to eq "http://www.makersacademy.com"
  end
  it "contains google.com in the list of bookmarks when see_list is called" do
    bookmarks = List.see_list
    expect(bookmarks[1].url).to eq "http://google.com"
  end
  it "contains destroyallsoftware in the list of bookmarks when see_list is called" do
    bookmarks = List.see_list
    expect(bookmarks[2].url).to eq "http://www.destroyallsoftware.com"
  end
  it "returns yahoo.com as the url" do
    result = List.create_bookmark("http://www.yahoo.com", "Yahoo")
    expect(result.url).to eq "http://www.yahoo.com"
  end
  it "returns yahoo as the title" do
    result = List.create_bookmark("http://www.yahoo.com", "Yahoo")
    expect(result.title).to eq "Yahoo"
  end
  it "deletes the URL http://www.yahoo.com" do
    List.create_bookmark("http://www.yahoo.com", "Yahoo")
    List.delete_bookmark("http://www.yahoo.com")
    expect(List.see_list.length).to eq 3
  end
  it "updates the URL of Apple bookmark to Microsoft Windows" do
    bookmark = List.create_bookmark("http://www.apple.com/uk/mac", "Apple")
    result = List.update_bookmark("http://www.windows.com", "Microsoft Windows", bookmark.id.to_i)
    expect(result.url).to eq "http://www.windows.com"
  end
  it "updates the title of Apple bookmark to Microsoft Windows" do
    bookmark = List.create_bookmark("http://www.apple.com/uk/mac", "Apple")
    result = List.update_bookmark("http://www.windows.com", "Microsoft Windows", bookmark.id.to_i)
    expect(result.title).to eq "Microsoft Windows"
  end
  it "finds a bookmark by title 'Google' and returns it" do
    bookmark = List.find_bookmark("Google")
    expect(bookmark[0].title).to eq "Google"
  end
  it "finds a bookmark by Google's URL and returns it" do
    List.find_bookmark("http://google.com")
    expect(List.search_results[0].url).to eq "http://google.com"
  end
  it "doesn't finds a bookmark returns empty array" do
    List.find_bookmark("http://www.hotmail.com")
    expect(List.search_results).to eq []
  end
end
