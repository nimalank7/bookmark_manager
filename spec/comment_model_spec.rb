require 'comment'
describe Comment do
  it "creates an instance of the comment clas" do
    comment = Comment.new
    expect(comment.instance_of? Comment)
  end
end
