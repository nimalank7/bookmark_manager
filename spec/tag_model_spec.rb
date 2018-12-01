require "tag_model"
describe Tag do
  before(:each) {add_bookmarks_and_comments_and_users} # This adds the bookmarks in
  it "user can set the content instance variable to 'Travel'" do
    tag = Tag.new(1, "Travel")
    expect(tag.content).to eq "Travel"
  end
  it "user can set the id instance variable to 1" do
    tag = Tag.new(1, "Travel")
    expect(tag.id).to eq 1
  end
  it "user can create a tag with content 'Housekeeping' and returns name" do
    expect(Tag.create("Housekeeping").content).to eq "Housekeeping"
  end
  it "user can create a tag with content 'Housekeeping' and returns id" do
    expect(Tag.create("Housekeeping").id.empty?).to eq false
  end
  it "returns all tags for a specific bookmark - Makers to be 2" do
    expect(Tag.all_tags(1).length).to eq 2
  end
  it "returns the 'Travel' tag for that bookmark" do
    expect(Tag.all_tags(1)[0].content).to eq "Housekeeping"
  end
  it "returns the 'Housekeeping' tag for that bookmark" do
    expect(Tag.all_tags(1)[1].content).to eq "Travel"
  end
  it "returns all bookmarks for a given tag" do
    tag = Tag.new(1, "Housekeeping")
    expect(List).to receive(:all_bookmarks).with(tag.id)
    tag.all_bookmarks(List)
  end
  it "finds tag by Tag id and returns Housekeeping" do
    expect(Tag.find(1).content).to eq "Housekeeping"
  end
end
