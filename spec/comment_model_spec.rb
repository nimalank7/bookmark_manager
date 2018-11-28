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
  it "returns all comments for a specific bookmark" do
    Comment.create_comment("Hello World", 1)
    Comment.create_comment("Goodbye World", 1)
    expect(Comment.all_comments.length).to eq 2
  end
  it "returns the 'Hello World' comment for that bookmark" do
    Comment.create_comment("Hello World", 1)
    Comment.create_comment("Goodbye World", 1)
    expect(Comment.all_comments(1)[0].body).to eq "Hello World"
  end
  it "returns the 'Goodbye World' comment for that bookmark" do
    Comment.create_comment("Hello World", 1)
    Comment.create_comment("Goodbye World", 1)
    expect(Comment.all_comments(1)[1].body).to eq "Goodbye World"
  end
end
