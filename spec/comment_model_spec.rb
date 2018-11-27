require 'comment'
require 'pg'

describe Comment do
  before(:each) {add_bookmarks}
  it "creates a comment when passed text and bookmark id" do
    comment = Comment.create_comment("Hello World", 1)
    expect(comment.body).to eq "Hello World"
  end
  it "creates a comment when passed text and bookmark id" do
    comment = Comment.create_comment("Hello World", 1)
    expect(comment.id).to eq 1
  end
end
