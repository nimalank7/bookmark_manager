require 'comment'
require 'pg'

describe Comment do
  before(:each) {add_bookmarks_and_comments_and_users}
  it "creates a comment when passed text and bookmark id" do
    comment = Comment.create_comment("Hello World", 1)
    expect(comment.body).to eq "Hello World"
  end
  it "creates a comment when passed text and bookmark id" do
    comment = Comment.create_comment("Hello World", 1)
    expect(comment.id).to eq 1
  end
  it "returns all comments for a specific bookmark" do
    expect(Comment.all_comments(2).length).to eq 2
  end
  it "returns the 'Go to search engine' comment for that bookmark" do
    expect(Comment.all_comments(2)[0].body).to eq "Go to search engine"
  end
  it "returns the 'Find anything' comment for that bookmark" do
    expect(Comment.all_comments(2)[1].body).to eq "Find anything"
  end
end
