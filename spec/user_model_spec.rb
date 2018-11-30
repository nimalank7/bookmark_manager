require 'User'
describe User do
  before(:each) { add_bookmarks_and_comments } # This adds the bookmarks in
  it "sets username to argument nimalan.kirubakaran@test.com" do
    email = "nimalan.kirubakaran@test.com"
    id = 1
    user = User.new(email, id)
    expect(user.email).to eq email
  end
  it "creates a user with email nimalan.kirubakaran@test.com" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    id = 1
    expect(BCrypt::Password).to receive(:create).with(password)
    user = User.create(email, password)
    expect(user.email).to eq email
  end
  it "creates a user with email nimalan.kirubakaran@test.com and password as password" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    expect(BCrypt::Password).to receive(:create).with(password)
    user = User.create(email, password)

  end
  it "returns true if email already exists" do
    email = "nimalan.kirubakaran@test.com"
    password = "password"
    expect(BCrypt::Password).to receive(:create).with(password)
    User.create(email, password)
    expect(User.already_exists?(email)).to eq true
  end
  it "returns false if email doesn't already exist" do
    email = "nimalan.kirubakaran@test.com"
    expect(User.already_exists?(email)).to eq false
  end
end
