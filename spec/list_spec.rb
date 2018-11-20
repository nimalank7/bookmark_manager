require "list"

describe List do
  it "returns a list of bookmarks when see_list is called" do
    add_bookmarks
    
    bookmarks = List.see_list
    expect(bookmarks[0]['url']).to eq "http://www.makersacademy.com"
    expect(bookmarks[1]['url']).to eq "http://google.com"
    expect(bookmarks[2]['url']).to eq "http://www.destroyallsoftware.com"
  end

end
