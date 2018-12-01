require "bookmark_tag_model"
describe BookmarkTag do
  it "creates an instance of the BookmarkTag class" do
    expect(BookmarkTag.new.instance_of? BookmarkTag).to eq true
  end
end
