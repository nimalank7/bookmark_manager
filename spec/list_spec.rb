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
    expect(result.title).to eq "Yahoo"
  end
  it "initializing the id instance variable to 1" do
    expect(list.id).to eq 1
  end

  it "initializing the title instance variable to Microsoft" do
    expect(list.title).to eq "Microsoft"
  end
  it "initializing the url instance variable to http://www.microsoft.com" do
    expect(list.url).to eq "http://www.microsoft.com"
  end

end
