require "bookmark"
describe Bookmark do

  it "user entry is stored in URL instance variable" do
    bookmark = Bookmark.new("http://www.google.com/")
    expect(bookmark.url).to eq "http://www.google.com/"
  end

  
end
