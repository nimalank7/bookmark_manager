require 'User'
describe User do
  before(:each) {add_bookmarks_and_comments_and_users}
  it "sets username to argument nimalan.kirubakaran@testing.com" do
    email = "nimalan.kirubakaran@testing.com"
    id = 1
    user = User.new(email, id)
    expect(user.email).to eq email
  end
  it "creates a user with email nimalan.kirubakaran@testing.com" do
    email = "nimalan.kirubakaran@testing.com"
    password = "password"
    id = 1
    # expect(BCrypt::Password).to receive(:create).with(password)
    user = User.create(email, password)
    expect(user.email).to eq email
  end
  it "creates a user with email nimalan.kirubakaran@testing.com and password as password" do
    email_address = "Bob"
    password = "password"
    # expect(BCrypt::Password).to receive(:create).with(password)
    # expect(DatabaseConnection).to receive(:query).with(("INSERT INTO Users (email, password) VALUES('#{email_address}', '#{password}') RETURNING user_id, email;"))
    expect(User.create(email_address, password).instance_of? User).to eq true
  end
  it "returns true if email already exists" do
    email = "nimalan.kirubakaran@test.com"
    expect(User.already_exists?(email)).to eq true
  end
  it "returns false if email doesn't already exist" do
    email = "nimalan.kirubakaran@testing.com"
    expect(User.already_exists?(email)).to eq false
  end
  it "successfully authenticates the user if email and password entered correctly" do
    User.create("Bob", "password")
    email_address = "Bob"
    password = "password"
    user = User.authenticate(email_address, password)
    expect(user.email).to eq "Bob"
  end
  it "returns false if the user enters email incorrectly" do
    User.create("Bob", "password")
    email = "Bo"
    password = "password"
    expect(User.authenticate(email, password)).to eq false
  end
  it "returns false if the user enters password incorrectly" do
    User.create("Bob", "password")
    email = "Bob"
    password = "passwor"
    expect(User.authenticate(email, password)).to eq false
  end
end
