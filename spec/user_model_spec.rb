require 'User'
describe User do
  before(:each) { add_bookmarks_and_comments } # This adds the bookmarks in
  it "sets password to argument password" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    id = 1
    user = User.new(email, password, id)
    expect(user.password).to eq password
  end
  it "sets username to argument nimalan.kirubakaran@test.com" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    id = 1
    user = User.new(email, password, id)
    expect(user.email).to eq email
  end
  it "creates a user with email nimalan.kirubakaran@test.com" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    id = 1
    user = User.create(email, password)
    expect(user.email).to eq email
  end
  it "creates a user with email nimalan.kirubakaran@test.com and password as password" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    user = User.create(email, password)
    expect(user.password).to eq password
  end
end
