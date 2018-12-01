require "bookmark_tag_model"
describe BookmarkTag do
  before(:each){add_bookmarks_and_comments_and_users}
  it "user sets instance variable of bookmark_id to 1" do
    bookmark_tag = BookmarkTag.new(1, 1)
    expect(bookmark_tag.bookmark_id).to eq 1
  end
  it "user sets instance variable of tag_id to 1" do
    bookmark_tag = BookmarkTag.new(1, 1)
    expect(bookmark_tag.tag_id).to eq 1
  end
  it "creates a bookmark tag and returns bookmark_id of 1" do
    expect(BookmarkTag.create(1,1).bookmark_id).to eq "1"
  end
  it "creates a bookmark tag and returns a tag_id of 1" do
    bookmark_tag = BookmarkTag.new(1, 1)
    expect(BookmarkTag.create(1,1).tag_id).to eq "1"
  end
end
